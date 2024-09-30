interface WasmBotsExports {
    memory: WebAssembly.Memory,
    setup: (requestReserve: number) => number;
    runFib: (offset: number, resultLocation: number) => boolean;
}
// TODO: can this be derived from the above, somehow?
const funcExpects = {
    setup: 1,
    runFib: 2,
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
        const inst = await WebAssembly.instantiate(programBuffer, {
            env: {
                abort: GuestProgram.abort,
                logFunction: (msgPtr: number, msgLen: number) => {
                    this.log(msgPtr, msgLen);
                }
            }
        });
        this.instance = inst.instance;
        if (!this.validate()) {
            return false;
        }
        this.exports = inst.instance.exports as unknown as WasmBotsExports;
        return true;
    }

    validate(): boolean {
        let hasError = false;
        const exports = this.instance!.exports;
        if (exports.memory === undefined) {
            console.error("VALIDATION ERROR: no exported `memory` object");
            hasError = true;
        }
        if (exports.memory.constructor !== WebAssembly.Memory) {
            console.error("VALIDATION ERROR: exported `memory` object is not WebAssembly.Memory");
            hasError = true;
        }

        for (const [k, v] of Object.entries(funcExpects)) {
            if (exports[k] === undefined) {
                console.error(`VALIDATION ERROR: missing function \`${k}\``);
                hasError = true;
            }
            if (typeof exports[k] != "function") {
                console.error(`VALIDATION ERROR: exported \`${k}\` is not a function`);
                hasError = true;
            }
            if ((exports[k] as CallableFunction).length != v) {
                console.error(`VALIDATION ERROR: \`${k}\` function takes the wrong number of parameters (should be ${v})`);
                hasError = true;
            }
        }
        return !hasError;
    }

    runSetup(reserveMemSize: number) {
        if (!this.exports) {
            console.error("RUNTIME ERROR: calling `runSetup` on uninitialized GuestProgram.");
            return;
        }
        this.reservePtr = this.exports.setup(reserveMemSize);
        this.reserveLength = reserveMemSize;
        this.reserveBlock = new Uint8Array(this.exports.memory.buffer, this.reservePtr, this.reserveLength);

        let offset = this.reservePtr;
        const botName = this.liftString(this.reservePtr, 20);
        offset += 20;
        const versionMajor = this.liftUint32(offset);
        offset += 4;
        const versionMinor = this.liftUint32(offset);
        offset += 4;
        const versionPatch = this.liftUint32(offset);
        offset += 4;
        console.log(`    # program info -- ${botName} v${versionMajor}.${versionMinor}.${versionPatch}`);

        this.reserveBlock.fill(0);
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
