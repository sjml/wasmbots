import config from "./config.ts";
import { type ILogger } from "./logger.ts";
import { writeGameParameters } from "../game/circumstances.ts";
import * as CoreMsg from "./messages.ts";
import { RNG } from "../game/random.ts";

const MIN_NAME_LEN = 4;

interface WasmBotsExports {
    memory: WebAssembly.Memory;
    setup: (requestReserve: number) => number;
    receiveGameParams: (offset: number, resultLocation: number) => boolean;
    tick: (offset: number) => void;
    clientInitialize?: () => void;
    _initialize?: () => void;
    _start?: () => void;
}

export class GuestProgram {
    instance: WebAssembly.Instance|null = null;
    exports: WasmBotsExports|null = null;
    private logger: ILogger;
    private reservePtr: number = 0;
    private reserveBlock = new Uint8Array();
    private reserveReadBlock!: CoreMsg.DataAccess;
    private reserveWriteBlock!: CoreMsg.DataAccess;
    isShutDown: boolean = false;
    botName: string = "";
    localRng: RNG;

    constructor(logger: ILogger | null, rngSeed: number) {
        logger ||= console;
        this.logger = logger;
        this.localRng = new RNG(rngSeed);
    }

    private readString(msgPtr: number, msgLen: number): string {
        const av = new Uint8Array((this.instance!.exports.memory as WebAssembly.Memory).buffer, msgPtr, msgLen);
        return new TextDecoder("utf-8").decode(av);
    }

    private readUint16(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getUint16(ptr, true);
    }
    private readInt16(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getInt16(ptr, true);
    }

    private readUint32(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getUint32(ptr, true);
    }
    private readInt32(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getInt32(ptr, true);
    }

    private readUint64(ptr: number): BigInt {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getBigUint64(ptr, true);
    }
    private readInt64(ptr: number): BigInt {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getBigInt64(ptr, true);
    }

    private readFloat32(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getFloat32(ptr, true);
    }
    private readFloat64(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getFloat64(ptr, true);
    }

    private log(logLevel: number, msgPtr: number, msgLen: number) {
        const logStr = this.readString(msgPtr, msgLen);
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
                // put to the "real" console
                console.error("ERROR: Invalid log level");
                break;
        }
    }

    shutdown() {
        console.info(`Shutting down ${this.botName} on request`)
        this.isShutDown = true;
    }

    // have to do a separate init function because can't have async constructor
    async init(module: WebAssembly.Module): Promise<boolean> {
        const instPromise = WebAssembly.instantiate(module, {
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

        try {
            this.instance = await instPromise;

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

    runSetup(): boolean {
        if (!this.exports) {
            this.logger.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
            this.isShutDown = true;
            return false;
        }
        try {
            this.reservePtr = this.exports.setup(config.memorySize);
        } catch (error) {
            this.logger.error(`RUNTIME ERROR: Crash during initial setup call\n  ${error}`);
            this.isShutDown = true;
            return false;
        }
        if (this.reservePtr == 0) {
            // was already logged from client code, probably
            this.isShutDown = true;
            return false;
        }
        this.reserveBlock = new Uint8Array(
            this.exports.memory.buffer,
            this.reservePtr,
            config.memorySize
        );
        this.reserveReadBlock = new CoreMsg.DataAccess(
            new DataView(
                this.reserveBlock.buffer,
                this.reserveBlock.byteOffset,
                this.reserveBlock.byteLength
            )
        );
        this.reserveWriteBlock = new CoreMsg.DataAccess(
            new DataView(
                this.reserveBlock.buffer,
                this.reserveBlock.byteOffset + config.writeBlockOffset,
                this.reserveBlock.byteLength - config.writeBlockOffset
            )
        );

        this.reserveBlock.fill(0);

        writeGameParameters(this.reserveBlock, 0);

        const resultOffset = 1024;
        let ready: boolean;
        try {
            ready = this.exports.receiveGameParams(0, resultOffset);
        }
        catch (error) {
            this.logger.error(`FATAL ERROR: Crash during client setup:\n  ${error}`);
            this.isShutDown = true;
            return false;
        }

        let offset = this.reservePtr + resultOffset;
        let botName = this.readString(offset, 26);
        let nullTermIdx = botName.indexOf("\0");
        if (nullTermIdx >= 0) {
            botName = botName.substring(0, nullTermIdx);
        }

        if (botName.length < MIN_NAME_LEN) {
            this.logger.error(`CLIENT ERROR: Bot name "${botName}" is too short (minimum length: ${MIN_NAME_LEN})`);
            this.isShutDown = true;
            return false;
        }
        offset += 26;
        const versionMajor = this.readUint16(offset);
        offset += 2;
        const versionMinor = this.readUint16(offset);
        offset += 2;
        const versionPatch = this.readUint16(offset);
        offset += 2;
        this.botName = `${botName} v${versionMajor}.${versionMinor}.${versionPatch}`;
        this.logger.info(`### ${this.botName} ###`);

        if (this.isShutDown) {
            return false;
        }

        this.isShutDown = !ready;
        return ready;
    }

    // "This where the magic happens"
    //    - predefined messages pass swapped back and forth in shared memory
    //        - from the spec in data/messaging.toml
    //    - each side knows how to read what they get based on the spec
    //    - each side knows how to write what the other can read based on the same spec
    //    - I imagine them holding hands and dancing in a circle
    runTick(circumstances: CoreMsg.PresentCircumstances): CoreMsg.Message {
        // wipe the shared block before every tick
        this.reserveBlock.fill(0);

        this.reserveWriteBlock.currentOffset = 0;
        circumstances.writeBytes(this.reserveWriteBlock, false);

        try {
            this.exports!.tick(config.writeBlockOffset);
        } catch (error) {
            const msg = `FATAL ERROR: Crash during tick function:\n  ${error}`;
            this.logger.error(msg);
            this.isShutDown = true;

            const err = new CoreMsg._Error();
            err.description = msg;
            return err;
        }

        this.reserveReadBlock.currentOffset = 0;
        const msgList = CoreMsg.ProcessRawBytes(this.reserveReadBlock.buffer);
        if (msgList.length != 1) {
            const err = new CoreMsg._Error();
            err.description = `Unexpected number of submitted player moves: ${msgList}`;
            return err;
        }
        return msgList[0];
    }
}
