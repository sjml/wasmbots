if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

const f = await Deno.readFile(Deno.args[0]);
const programBuffer = f.buffer;

function log(msgPtr: number, msgLen: number) {
    const mem = instance.exports.memory as WebAssembly.Memory;
    const av = new Uint8Array(mem.buffer, msgPtr, msgLen);
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

const runner = instance.exports.run as CallableFunction;
runner();
