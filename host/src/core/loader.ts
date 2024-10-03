import config from "./config.ts";

export async function readTextFile(filepath: string): Promise<string> {
    if (filepath.startsWith("$rsc/")) {
        filepath = pathJoin(getRscPath(), filepath.substring(4));
    }
    try {
        if (config.environment == "Deno") {
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



function pathJoin(...parts: string[]): string {
    const stack: string[] = [];
    for (let part of parts) {
        part = part.replace(/\/+/g, "/");
        const segments = part.split("/");
        for (const seg of segments) {
            if (seg.length == 0 || seg == ".") {
                continue;
            }
            else if (seg == "..") {
                if (stack.length > 0) {
                    stack.pop();
                }
            }
            else {
                stack.push(seg);
            }
        }
    }
    return `${parts[0].startsWith("/") ? "/" : ""}${stack.join("/")}`;
}

function pathDirname(filepath: string): string {
    filepath = filepath.replace(/\/+/g, "/");
    const segments = filepath.split("/");
    if (segments.length == 0 || (segments.length == 1 && segments[0].length == 0)) {
        return ".";
    }
    segments.pop();
    if (segments.length == 0) {
        return "/";
    }
    return segments.join("/");
}

function getRscPath(): string {
    if (config.environment == "Deno") {
        const filename = new URL('', import.meta.url).pathname;
        const dirname = pathDirname(filename);
        return pathJoin(dirname, "..", "..", "rsc");
    }
    return pathJoin(config.webRoot, "rsc");
}
