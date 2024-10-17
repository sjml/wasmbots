import { writeGameParameters, writeCircumstances } from "./circumstances.ts";
import { type ILogger } from "./logger.ts";

const MIN_NAME_LEN = 4;

interface WasmBotsExports {
    memory: WebAssembly.Memory;
    setup: (requestReserve: number) => number;
    receiveGameParams: (offset: number, resultLocation: number) => boolean;
    tick: (offset: number) => void;
    _start?: () => void;
    _initialize?: () => void;
}

export class GuestProgram {
    instance: WebAssembly.Instance|null = null;
    exports: WasmBotsExports|null = null;
    private logger: ILogger;
    private reservePtr: number = 0;
    private reserveLength: number = 0;
    private reserveBlock = new Uint8Array();
    isShutDown: boolean = false;

    constructor(logger?: ILogger) {
        logger ||= console;
        this.logger = logger;
    }

    private abort(msg: string, file: string, line: number, col: number) {
        this.logger.error(`FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
        this.isShutDown = true;
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
        const output = `${new Date().toISOString()}: ${logStr}`;
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

    // TODO: expose this to the modules
    private shutdown() {
        this.isShutDown = true;
    }

    // TODO: error handling, reject promise
    // have to do a separate init function because can't have async constructor
    async init(module: WebAssembly.Module) {
        this.instance = await WebAssembly.instantiate(module, {
            env: {
                abort: this.abort,
                logFunction: (logLevel: number, msgPtr: number, msgLen: number) => {
                    this.log(logLevel, msgPtr, msgLen);
                }
            }
        });

        this.exports = this.instance.exports as unknown as WasmBotsExports;

        // Emscripten setup functions
        if (this.exports?._start) {
            this.exports._start();
        }
        if (this.exports?._initialize) {
            this.exports._initialize();
        }
    }

    runSetup(reserveMemSize: number): boolean {
        if (!this.exports) {
            this.logger.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
            this.isShutDown = true;
            return false;
        }
        try {
            this.reservePtr = this.exports.setup(reserveMemSize);
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
        this.reserveLength = reserveMemSize;
        this.reserveBlock = new Uint8Array(this.exports.memory.buffer, this.reservePtr, this.reserveLength);

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
        const botName = this.readString(offset, 26);
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
        this.logger.log(`### program info -- ${botName} v${versionMajor}.${versionMinor}.${versionPatch} ###`);

        this.isShutDown = !ready;
        return ready;
    }

    runTick(lastTickDuration: number) {
        this.reserveBlock.fill(0);
        const circOffset = 0;
        writeCircumstances(this.reserveBlock, circOffset, lastTickDuration);
        try {
            this.exports!.tick(circOffset);
        } catch (error) {
            this.logger.error(`FATAL ERROR: Crash during tick function:\n  ${error}`);
            this.isShutDown = true;
        }
    }
}
