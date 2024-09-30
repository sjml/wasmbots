if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

console.log(`Running ${Deno.args[0]}`);
const f = await Deno.readFile(Deno.args[0]);
const programBuffer = f.buffer;

// // give max of one megabyte of memory to each bot (64k per page * 16 pages = 1 Mb)
// const SHARED_MEMORY = new WebAssembly.Memory({initial: 1, maximum: 16});

function log(msgPtr: number, msgLen: number) {
    // const av = new Uint8Array(SHARED_MEMORY.buffer, msgPtr, msgLen);
    const av = new Uint8Array((instance.exports.memory as WebAssembly.Memory).buffer, msgPtr, msgLen);
    const logStr = new TextDecoder("utf-8").decode(av);
    console.log(`${new Date().toISOString()} (${msgPtr}, ${msgLen}):\n    "${logStr}"`);
}

const { instance } = await WebAssembly.instantiate(programBuffer, {
    env: {
        logFunction: log,
        abort(msg: string, file: string, line: number, col: number) {
            console.error(`FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
        }
    }
});

interface WasmBotsExports {
    setup: (requestReserve: number) => number;
    runFib: (offset: number, resultLocation: number) => boolean;
}

const exp = instance.exports as unknown as WasmBotsExports;

const reserveSize = 2048;
const reservePtr = exp.setup(reserveSize);
const reserveArea = new Uint8Array((instance.exports.memory as WebAssembly.Memory).buffer, reservePtr, reserveSize);
reserveArea.fill(0);

if (exp.runFib != undefined) {
    const fibIdx = 42;
    const fibIdxLoc = 128;
    const resultLoc = 1024;
    reserveArea[fibIdxLoc] = fibIdx;
    if (exp.runFib(fibIdxLoc, resultLoc)) {
        const dv = new DataView(reserveArea.buffer, reserveArea.byteOffset, reserveArea.byteLength);
        const result = dv.getBigUint64(resultLoc, true);
        console.log(`        Got result ${result} for Fibonacci index ${fibIdx}.`)
    }
}
