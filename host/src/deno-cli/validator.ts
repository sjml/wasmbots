import { validateWasm } from "../core/validator.ts";


if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

const wasmBytes = await Deno.readFile(Deno.args[0]);

try {
    const _ = await WebAssembly.compile(wasmBytes);
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
