import { validateWasm } from "./validator.ts";
import { writegameParameters } from "./circumstances.ts";

interface WasmBotsExports {
    memory: WebAssembly.Memory,
    setup: (requestReserve: number) => number;
    receiveGameParams: (offset: number) => boolean;
    runFib: (offset: number, resultLocation: number) => boolean;
}

export class GuestProgram {
    instance: WebAssembly.Instance|null = null;
    exports: WasmBotsExports|null = null;
    private reservePtr: number = 0;
    private reserveLength: number = 0;
    private reserveBlock = new Uint8Array();

    private static abort(msg: string, file: string, line: number, col: number) {
        console.error(`FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
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

    private log(msgPtr: number, msgLen: number) {
        const logStr = this.liftString(msgPtr, msgLen);
        console.log(`${new Date().toISOString()} (${msgPtr}, ${msgLen}):\n    ${logStr}`);
    }

    // TODO: error handling, reject promise
    // have to do a separate init function because can't have async constructor
    async init(programBuffer: ArrayBuffer): Promise<boolean> {
        let mod: WebAssembly.Module;
        try {
            mod = await WebAssembly.compile(programBuffer);
        }
        catch (err) {
            console.error(`PROGRAM ERROR: Buffer is not valid WebAssembly\n${err}`);
            return false;
        }
        if (!validateWasm(programBuffer)) {
            // errors output by validation function
            return false;
        }
        this.instance = await WebAssembly.instantiate(mod, {
            env: {
                abort: GuestProgram.abort,
                logFunction: (msgPtr: number, msgLen: number) => {
                    this.log(msgPtr, msgLen);
                }
            }
        });

        this.exports = this.instance.exports as unknown as WasmBotsExports;
        return true;
    }

    runSetup(reserveMemSize: number): boolean {
        if (!this.exports) {
            console.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
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
        console.log(`    # program info -- ${botName} v${versionMajor}.${versionMinor}.${versionPatch}`);

        this.reserveBlock.fill(0);

        writegameParameters(this.reserveBlock, 0);
        const ready = this.exports.receiveGameParams(0);
        return ready;
    }

    runTestFib() {
        if (!this.exports) {
            console.error("RUNTIME ERROR: calling `runTestFib` on uninitialized GuestProgram.");
            return;
        }
        const fibIdx = 42;
        const fibIdxLoc = 128;
        const resultLoc = 1024;
        this.reserveBlock[fibIdxLoc] = fibIdx;
        if (this.exports.runFib(fibIdxLoc, resultLoc)) {
            const dv = new DataView(this.reserveBlock.buffer, this.reserveBlock.byteOffset, this.reserveBlock.byteLength);
            const result = dv.getBigUint64(resultLoc, true);
            console.log(`    Got result ${result} (${result == 267914296n ? "correct" : "WRONG"}) for Fibonacci index ${fibIdx}.`)
        }
    }
}
