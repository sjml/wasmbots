import { GuestProgram } from "./guest.ts";

if (Deno.args.length == 0) {
    console.error("Give a file path.")
    Deno.exit(1);
}

const f = await Deno.readFile(Deno.args[0]);
const programBuffer = f.buffer;

const gp = new GuestProgram();
const valid = await gp.init(programBuffer);
if (!valid) {
    console.error("Invalid guest program; exiting.");
    Deno.exit(1);
}

const ready = gp.runSetup(2048);
if (!ready) {
    Deno.exit(1);
}
gp.runTestFib();

Deno.exit(0);
