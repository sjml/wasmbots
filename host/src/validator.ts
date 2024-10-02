import { readTextFile, readBinaryFile } from "./loader.ts";

let validatorProgramBytes: Uint8Array = new Uint8Array(0);
let validatorProgram: WebAssembly.Module|null = null;
let expectationsJson: string = "";

// assuming that the wasm was already able to be compiled;
export async function validateWasm(buff: Uint8Array|ArrayBuffer): Promise<boolean> {
    const ab: Uint8Array = new Uint8Array(buff);

    if (validatorProgram == null) {
        validatorProgramBytes = await readBinaryFile("/lib/wasmbots_validator.wasm");
        validatorProgram = await WebAssembly.compile(validatorProgramBytes);
    }
    if (expectationsJson.length == 0) {
        expectationsJson = await readTextFile("/data/guestExpectations.json");
    }
    const jsonBuff = new TextEncoder().encode(expectationsJson);
    const validator = await WebAssembly.instantiate(validatorProgram, {
        env: {
            validatorError: (ptr: number, len: number) => {
                const av = new Uint8Array((validator.exports.memory as WebAssembly.Memory).buffer, ptr, len);
                const msg = new TextDecoder("utf-8").decode(av);
                console.error(`VALIDATION ERROR: ${msg}`);
            }
        }
    });
    const wasmPointer = (validator.exports.request_allocation as CallableFunction)(ab.length);
    const jsonPointer = (validator.exports.request_allocation as CallableFunction)(jsonBuff.length);

    const memTarget = new Uint8Array((validator.exports.memory as WebAssembly.Memory).buffer);
    memTarget.set(ab, wasmPointer);
    memTarget.set(jsonBuff, jsonPointer);

    const result = (validator.exports.validate_wasm as CallableFunction)(wasmPointer, ab.length, jsonPointer, jsonBuff.length);
    return result == 0;
}

if (import.meta.main) {
    if (Deno.args.length == 0) {
        console.error("Give a file path.")
        Deno.exit(1);
    }

    const wasmBytes = await Deno.readFile(Deno.args[0]);

    try {
        const _mod = await WebAssembly.compile(wasmBytes);
    }
    catch (err) {
        console.error(`PROGRAM ERROR: Buffer is not valid WebAssembly\n${err}`);
        Deno.exit(1);
    }
    if (!await validateWasm(wasmBytes)) {
        console.error("WebAssembly binary does not conform to spec")
        Deno.exit(1);
    }
    console.log("✅ WebAssembly binary file appears to be valid and conforms to spec")
}