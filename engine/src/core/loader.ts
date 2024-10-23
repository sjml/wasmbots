import config from "./config.ts";
import { pathJoin, pathDirname } from "./util.ts";

export async function readTextFile(filepath: string): Promise<string> {
    if (filepath.startsWith("$rsc/")) {
        filepath = pathJoin(getRscPath(), filepath.substring(4));
    }
    try {
        if (config.environment == "Deno") {
            // @ts-ignore
            return await Deno.readTextFile(filepath);
        }
        const resp = await fetch(filepath);
        if (!resp.ok) {
            throw new Error(`Failed to fetch ${filepath}: (${resp.status}) ${resp.statusText}`);
        }
        return await resp.text();
    } catch(err) {
        console.error(`ERROR: Could not read file: ${err}`);
        throw err;
    }
}

export async function readBinaryFile(filepath: string): Promise<Uint8Array> {
    if (filepath.startsWith("$rsc/")) {
        filepath = pathJoin(getRscPath(), filepath.substring(4));
    }
    try {
        if (config.environment == "Deno") {
            // @ts-ignore
            return await Deno.readFile(filepath);
        }
        const resp = await fetch(filepath);
        if (!resp.ok) {
            throw new Error(`Failed to fetch ${filepath}: (${resp.status}) ${resp.statusText}`);
        }
        const buff = await resp.arrayBuffer();
        return new Uint8Array(buff);
    } catch(err) {
        console.error(`ERROR: Could not read file: ${err}`);
        throw err;
    }
}



function getRscPath(): string {
    if (config.environment == "Deno") {
        const filename = new URL('', import.meta.url).pathname;
        const dirname = pathDirname(filename);
        return pathJoin(dirname, "..", "..", "rsc");
    }
    // @ts-ignore
    return pathJoin("/", __APP_BASE_PATH__, "rsc");
}
