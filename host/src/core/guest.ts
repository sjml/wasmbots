import { writegameParameters, writeCircumstances } from "./circumstances.ts";
import { type ILogger } from "./logger.ts";

interface WasmBotsExports {
    memory: WebAssembly.Memory;
    setup: (requestReserve: number) => number;
    receiveGameParams: (offset: number) => boolean;
    tick: (offset: number) => void;
    runFib: (offset: number, resultLocation: number) => boolean;
}

export class GuestProgram {
    instance: WebAssembly.Instance|null = null;
    exports: WasmBotsExports|null = null;
    private logger: ILogger;
    private reservePtr: number = 0;
    private reserveLength: number = 0;
    private reserveBlock = new Uint8Array();

    constructor(logger?: ILogger) {
        logger ||= console;
        this.logger = logger;
    }

    private abort(msg: string, file: string, line: number, col: number) {
        this.logger.error(`FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
    }

    private liftString(msgPtr: number, msgLen: number): string {
        const av = new Uint8Array((this.instance!.exports.memory as WebAssembly.Memory).buffer, msgPtr, msgLen);
        return new TextDecoder("utf-8").decode(av);
    }

    private liftUint16(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getUint16(ptr, true);
    }

    private liftUint32(ptr: number): number {
        const dv = new DataView(this.exports!.memory.buffer);
        return dv.getUint32(ptr, true);
    }

    private log(logLevel: number, msgPtr: number, msgLen: number) {
        const logStr = this.liftString(msgPtr, msgLen);
        const output = `${new Date().toISOString()} (${msgPtr}, ${msgLen}):\n    ${logStr}`;
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
    }

    runSetup(reserveMemSize: number): boolean {
        if (!this.exports) {
            this.logger.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
            return false;
        }
        this.reservePtr = this.exports.setup(reserveMemSize);
        this.reserveLength = reserveMemSize;
        this.reserveBlock = new Uint8Array(this.exports.memory.buffer, this.reservePtr, this.reserveLength);

        let offset = this.reservePtr;
        const botName = this.liftString(this.reservePtr, 26);
        offset += 26;
        const versionMajor = this.liftUint16(offset);
        offset += 2;
        const versionMinor = this.liftUint16(offset);
        offset += 2;
        const versionPatch = this.liftUint16(offset);
        offset += 2;
        this.logger.log(`### program info -- ${botName} v${versionMajor}.${versionMinor}.${versionPatch} ###`);

        this.reserveBlock.fill(0);

        writegameParameters(this.reserveBlock, 0);
        const ready = this.exports.receiveGameParams(0);
        return ready;
    }

    runTick(lastTickDuration: number) {
        this.reserveBlock.fill(0);
        const circOffset = 0;
        writeCircumstances(this.reserveBlock, circOffset, lastTickDuration);
        this.exports!.tick(circOffset);
    }

    runTestFib() {
        if (!this.exports) {
            this.logger.error("RUNTIME ERROR: calling `runTestFib` on uninitialized GuestProgram.");
            return;
        }
        const fibIdx = 42;
        const fibIdxLoc = 128;
        const resultLoc = 1024;
        this.reserveBlock[fibIdxLoc] = fibIdx;
        if (this.exports.runFib(fibIdxLoc, resultLoc)) {
            const dv = new DataView(this.reserveBlock.buffer, this.reserveBlock.byteOffset, this.reserveBlock.byteLength);
            const result = dv.getBigUint64(resultLoc, true);
            this.logger.log(`    Got result ${result} (${result == 267914296n ? "correct" : "WRONG"}) for Fibonacci index ${fibIdx}.`)
        }
    }
}
