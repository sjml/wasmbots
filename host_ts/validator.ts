import binaryen from "npm:binaryen@119.0.0";

import { default as expectations } from "./data/guestExpectations.json" with { type: "json" };

const typeMap: { [key: string]: binaryen.Type } = {
    i32: binaryen.i32,
    i64: binaryen.i64,
    f32: binaryen.f32,
    f64: binaryen.f64,
};

function arraysEqual(a: number[], b: number[]): boolean {
    if (a.length != b.length) {
        return false;
    }
    return a.every((v,i) => b[i] == v);
}

// pulled from binaryen.js because const enum exports can be problematic in TypeScript
const enum ExternalKinds {
    Function,
    Table,
    Memory,
    Global,
    Tag
  }

// assuming that the wasm was already able to be compiled;
//   binaryen dies in weird ways if readBinary gets an invalid buffer.
// (even catching the exception changes the process's exit code!)
export function validateWasm(buff: Uint8Array|ArrayBuffer): boolean {
    if (buff instanceof ArrayBuffer) {
        buff = new Uint8Array(buff);
    }
    const wasmModule = binaryen.readBinary(buff as Uint8Array);

    let hasError = false;

    switch (expectations.memory) {
        case "exported": {
            const memRef = wasmModule.getExport("memory");
            if (memRef == 0) {
                console.error(`VALIDATION ERROR: No exported memory`)
                hasError = true;
            }
            break;
        }
        case "imported":
            console.error(`VALIDATION ERROR: Unimplemented memory expectation \`${expectations.memory}\``);
            hasError = true;
            break;
        case "none":
            console.error(`VALIDATION ERROR: Unimplemented memory expectation \`${expectations.memory}\``);
            hasError = true;
            break;
        default:
            console.error(`VALIDATION ERROR: Unexpected memory expectation \`${expectations.memory}\``);
            hasError = true;
    }

    for (const [func, signature] of Object.entries(expectations.functionExports)) {
        const exportRef = wasmModule.getExport(func);
        const exportInfo = binaryen.getExportInfo(exportRef);
        if (exportInfo.name != func || exportInfo.value.length == 0) {
            console.error(`VALIDATION ERROR: No export named ${func}`);
            hasError = true;
            continue;
        }
        if (exportInfo.kind as unknown as ExternalKinds != ExternalKinds.Function) {
            console.error(`VALIDATION ERROR: Export ${func} is not a function`);
            hasError = true;
            continue;
        }
        const functionRef = wasmModule.getFunction(exportInfo.value);
        const functionInfo = binaryen.getFunctionInfo(functionRef);
        const functionParams = binaryen.expandType(functionInfo.params);
        const functionReturn = binaryen.expandType(functionInfo.results);
        const paramTarget = signature.params.map(t => typeMap[t]);
        const returnTarget = signature.return ? [typeMap[signature.return]] : [];
        if (!arraysEqual(functionParams, paramTarget)) {
            console.error(`VALIDATION ERROR: Export ${func} has wrong parameters`);
            hasError = true;
        }
        if (!arraysEqual(functionReturn, returnTarget)) {
            console.error(`VALIDATION ERROR: Export ${func} has wrong return type`);
            hasError = true;
        }
    }
    return !hasError;
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
    if (!validateWasm(wasmBytes)) {
        console.error("WebAssembly binary does not conform to spec")
        Deno.exit(1);
    }
    console.log("✅ WebAssembly binary file appears to be valid and conforms to spec")
}
