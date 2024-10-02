import * as path from "jsr:@std/path";

export async function readTextFile(filepath: string): Promise<string> {
    return await Deno.readTextFile(path.join(getRscPath(), filepath));
}

export async function readBinaryFile(filepath: string): Promise<Uint8Array> {
    return await Deno.readFile(path.join(getRscPath(), filepath));
}

function getRscPath(): string {
    const filename = new URL('', import.meta.url).pathname;
    const dirname = path.dirname(filename);
    return path.join(dirname, "..", "rsc");
}
