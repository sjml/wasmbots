import { GuestProgram } from "./guest.ts";

if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

console.log(`Running ${Deno.args[0]}`);
const f = await Deno.readFile(Deno.args[0]);
const programBuffer = f.buffer;

const gp = new GuestProgram();
const valid = await gp.init(programBuffer);
if (!valid) {
    console.error("Invalid guest program; exiting.");
    Deno.exit(1);
}

gp.runSetup(2048);
gp.runTestFib();

Deno.exit(0);
