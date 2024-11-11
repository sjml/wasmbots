import { RNG } from "../game/random.ts";
import { type ILogger } from "./logger.ts";
import config from "./config.ts";
import { type InstantiateDonePayload } from "../worker/messages.ts";
import { CoreMsg } from "../index.ts";
import { sleep, encodeBase64, decodeBase64 } from "../core/util.ts";

interface WasmBotsExports {
    memory: WebAssembly.Memory;
    setup: (requestReserve: number) => number;
    receiveGameParams: (offset: number) => boolean;
    tick: (offset: number) => void;
    clientInitialize?: () => void;
    _initialize?: () => void;
    _start?: () => void;
}

export abstract class GuestProgram {
    protected logger: ILogger;
    protected localRng: RNG;
    protected botName: string;
    isShutDown: boolean;

    protected constructor(rngSeed: number, logger?: ILogger) {
        logger ||= console;
        this.logger = logger;
        this.localRng = new RNG(rngSeed);
        this.botName = "";
        this.isShutDown = false;
    }

    abstract getReserveBlock(): Uint8Array;
    abstract setupMemory(): Promise<boolean>;
    abstract runReceiveGameParams(offset: number): Promise<boolean>;
    abstract runTick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message>;

    getReserveBlockDV(): DataView {
        const rb = this.getReserveBlock();
        return new DataView(rb.buffer, rb.byteOffset, rb.byteLength);
    }

    protected liftString(memory: Uint8Array, msgPtr: number, msgLen: number): string {
        const bytes = new Uint8Array(memory.buffer, msgPtr, msgLen);
        return new TextDecoder("utf-8").decode(bytes);
    }

    shutdown() {
        console.info(`Shutting down ${this.botName} on request`)
        this.isShutDown = true;
    }

    async runSetup(): Promise<InstantiateDonePayload> {
        const errStatus = {
            success: false,
            botName: "",
            botVersion: [],
        };

        const memorySuccess = await this.setupMemory();
        if (!memorySuccess) {
            this.isShutDown = true;
            return errStatus;
        }

        let reserveBlock = this.getReserveBlock();
        let botName = this.liftString(reserveBlock, reserveBlock.byteOffset, 26);
        let nullTermIdx = botName.indexOf('\0');
        if (nullTermIdx >= 0) {
            botName = botName.substring(0, nullTermIdx);
        }
        if (botName.length < config.minimumNameLength) {
            this.logger.error(`CLIENT ERROR: Bot name "${botName}" is too short (minimum length: ${config.minimumNameLength})`);
            this.isShutDown = true;
            return errStatus;
        }

        const dv = this.getReserveBlockDV();
        const versionMajor = dv.getUint16(26, true);
        const versionMinor = dv.getUint16(28, true);
        const versionPatch = dv.getUint16(30, true);
        this.botName = `${botName} v${versionMajor}.${versionMinor}.${versionPatch}`;
        this.logger.info(`### ${this.botName} ###`);

        reserveBlock.fill(0);

        const gp = new CoreMsg.InitialParameters();
        gp.paramsVersion = 7;
        gp.engineVersionMajor = config.version[0];
        gp.engineVersionMinor = config.version[1];
        gp.engineVersionPatch = config.version[2];
        gp.diagonalMovement = config.diagonalMovement;

        gp.writeBytes(dv, false);

        const resultOffset = 1024; // TODO: use this again; swapped to 0 just while debugging some stuff
        let ready: boolean;
        try {
            ready = await this.runReceiveGameParams(0);
        }
        catch (err) {
            this.logger.error(`FATAL ERROR: Crash during client setup:\n  ${err}`);
            this.isShutDown = true;
            return errStatus;
        }

        if (this.isShutDown) {
            return errStatus;
        }

        this.isShutDown = !ready;

        return {
            success: ready,
            botName: botName,
            botVersion: [versionMajor, versionMinor, versionPatch],
        };
    }
}

export class WasmGuestProgram extends GuestProgram {
    exports: WasmBotsExports|null;
    instance: WebAssembly.Instance|null;
    private reservePtr: number;

    constructor(rngSeed: number) {
        super(rngSeed);
        this.exports = null;
        this.instance = null;
        this.reservePtr = 0;
    }

    getReserveBlock(): Uint8Array {
        if (this.exports == null) {
            throw new Error("Cannot get reserve block of uninitialized module");
        }
        return new Uint8Array(this.exports!.memory.buffer, this.reservePtr, config.memorySize);
    }

    async init(module: WebAssembly.Module): Promise<boolean> {
        try {
            this.instance = await WebAssembly.instantiate(module, {
                env: {
                    shutdown: () => this.shutdown(),
                    logFunction: (logLevel: number, msgPtr: number, msgLen: number) => {
                        this.log(logLevel, msgPtr, msgLen);
                    },
                    getRandomInt: (min: number, max: number) => {
                        if (max < min) {
                            return 0;
                        }
                        return this.localRng.randInt(min, max);
                    },
                }
            });
            this.exports = this.instance.exports as unknown as WasmBotsExports;

            // built-in setup function from various compilers
            //   (TinyGo uses this to set up the heap, for example)
            if (this.exports?._initialize) {
                this.exports._initialize();
            }
            // same as above; usually only exists if you've built
            //   it as an "application" instead of a library,
            //   but let's play along
            if (this.exports?._start) {
                this.exports._start();
            }

            // optional export from client code;
            //   should only be used for things like registering
            //   callbacks and the like; very minimal
            if (this.exports?.clientInitialize) {
                this.exports.clientInitialize();
            }
        } catch (err) {
            this.logger.error(`CLIENT ERROR: Intitialization failed:\n  ${err}`);
            return false;
        }

        return true;
    }

    protected log(logLevel: number, msgPtr: number, msgLen: number) {
        const logStr = this.liftString(new Uint8Array(this.exports!.memory.buffer), msgPtr, msgLen);
        // const output = `${new Date().toISOString()} (${msgPtr}, ${msgLen}):\n    ${logStr}`;
        // const output = `${new Date().toISOString()}: ${logStr}`;
        const output = `${logStr}`;
        switch (logLevel) {
            case 0:
                this.logger.error(output);
                break;
            case 1:
                this.logger.warn(output);
                break;
            case 2:
                this.logger.log(output);
                break;
            case 3:
                this.logger.info(output);
                break;
            case 4:
                this.logger.debug(output);
                break;
            default:
                throw new Error(`Unknown log level! ${logLevel}`);
        }
    }

    async setupMemory(): Promise<boolean> {
        if (!this.exports) {
            this.logger.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
            return false;
        }
        try {
            this.reservePtr = this.exports.setup(config.memorySize);
        } catch (error) {
            this.logger.error(`RUNTIME ERROR: Crash during initial setup call\n  ${error}`);
            return false;
        }
        if (this.reservePtr == 0) {
            // error was already logged from client code, probably
            return false;
        }
        return true;
    }

    async runReceiveGameParams(offset: number): Promise<boolean> {
        return this.exports!.receiveGameParams(offset);
    }

    // "This where the magic happens"
    //    - predefined messages pass swapped back and forth in shared memory
    //        - from the spec in data/messaging.toml
    //    - each side knows how to read what they get based on the spec
    //    - each side knows how to write what the other can read based on the same spec
    //    - I imagine them holding hands and dancing in a circle
    async runTick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
        const rb = this.getReserveBlock();
        rb.fill(0);

        let rbdv = new DataView(rb.buffer, rb.byteOffset + config.writeBlockOffset, rb.byteLength - config.writeBlockOffset);
        circumstances.writeBytes(rbdv, false);

        try {
            this.exports!.tick(config.writeBlockOffset);
        }
        catch (err) {
            const msg = `FATAL ERROR: Crash during tick function:\n  ${err}`;
            this.isShutDown = true;

            const e = new CoreMsg._Error();
            e.description = msg;
            return e;
        }

        // have to get it again because the tick might have grown memory
        rbdv = this.getReserveBlockDV();
        const msgList = CoreMsg.ProcessRawBytes(rbdv);
        if (msgList.length != 1) {
            const err = new CoreMsg._Error();
            err.description = `Unexpected number of submitted player moves: ${msgList}`;
            return err;
        }
        return msgList[0];
    }
}

// "This where another kind of magic happens, I guess."
//   - interfaces with special builds that embed native versions of the bots
//     in a web server
export class TrainerGuestProgram extends GuestProgram {
    private reserveBlock: Uint8Array;

    constructor(rngSeed: number) {
        super(rngSeed);
        this.reserveBlock = new Uint8Array();
    }

    getReserveBlock(): Uint8Array {
        return this.reserveBlock;
        // throw new Error("not implemented"); // want to make sure this isn't surprising me somewhere
    }

    async setupMemory(): Promise<boolean> {
        const res = await fetch("http://localhost:9090/setup", {
            method: "POST",
            body: JSON.stringify({reserve: config.memorySize}),
        });
        if (res.ok) {
            const memBuffer = await res.arrayBuffer();
            if (memBuffer.byteLength != config.memorySize) {
                throw new Error("Trainer did not return properly-sized memory");
            }
            this.reserveBlock = new Uint8Array(memBuffer);
        }
        else {
            const errMsg = await res.text();
            throw new Error(`Could not set up trainer memory: ${errMsg}`);
        }
        return true;
    }

    async runReceiveGameParams(offset: number): Promise<boolean> {
        await sleep(1); // TODO: Zig server seems to not like being hammered; is that universally true?
        const res = await fetch("http://localhost:9090/receiveGameParams", {
            method: "POST",
            body: JSON.stringify({
                offset: offset,
                mem: encodeBase64(new Uint8Array(this.getReserveBlock())),
            }),
        });
        if (res.ok) {
            const result = await res.json();
            return result.success;
        }
        else {
            const errMsg = await res.text();
            throw new Error(`Could not send game parameters: ${errMsg}`);
        }
    }

    async runTick(circumstances: CoreMsg.PresentCircumstances): Promise<CoreMsg.Message> {
        let reserveBlock = new Uint8Array(config.memorySize);
        let writeBlock = new DataView(
            reserveBlock.buffer,
            reserveBlock.byteOffset + config.writeBlockOffset,
            reserveBlock.byteLength - config.writeBlockOffset
        );

        circumstances.writeBytes(writeBlock, false);

        try {
            const res = await fetch("http://localhost:9090/tick", {
                method: "POST",
                body: JSON.stringify({
                    offset: config.writeBlockOffset,
                    mem: encodeBase64(reserveBlock),
                }),
            });
            if (res.ok) {
                const tickResult: { success: boolean, mem: string } = await res.json();
                const newMem = decodeBase64(tickResult.mem);
                reserveBlock.set(new Uint8Array(newMem), 0);
            }
            else {
                const errMsg = await res.text();
                throw new Error(`Could not tick: ${errMsg}`);
            }
        }
        catch (error) {
            const msg = `FATAL ERROR: Crash during tick function:\n  ${error}`;
            this.isShutDown = true;

            const err = new CoreMsg._Error();
            err.description = msg;
            return err;
        }

        const readBlock = new DataView(reserveBlock.buffer, reserveBlock.byteOffset, reserveBlock.byteLength);
        const msgList = CoreMsg.ProcessRawBytes(readBlock);
        if (msgList.length != 1) {
            const err = new CoreMsg._Error();
            err.description = `Unexpected number of submitted player moves: ${msgList}`;
            return err;
        }
        return msgList[0];
    }
}
