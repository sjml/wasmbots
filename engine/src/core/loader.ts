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
		const resp = await fetch(filepath, {cache: "no-cache"});
		if (!resp.ok) {
			throw new Error(`Failed to fetch ${filepath}: (${resp.status}) ${resp.statusText}`);
		}
		return await resp.text();
	} catch(err) {
		console.error(`ERROR: Could not read file: ${err}`);
		throw err;
	}
}

export async function readJsonFile(filepath: string): Promise<any> {
	const text = await readTextFile(filepath);
	return JSON.parse(text);
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
		const resp = await fetch(filepath, {cache: "no-cache"});
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



export function getRscPath(): string {
	if (config.environment == "Deno") {
		const filename = new URL('', import.meta.url).pathname;
		const dirname = pathDirname(filename);
		return pathJoin(dirname, "..", "..", "rsc");
	}
	// @ts-ignore
	else if (__IIFE_BUILD__) {
		if (typeof self !== "undefined" && self.constructor.name === "DedicatedWorkerGlobalScope") {
			return new URL("rsc", self.location.href).pathname;
		}

		const script = document.querySelector<HTMLScriptElement>("script[data-script-id='wasmbotsEmbedScript']");
		if (!script || !script.src) {
			throw new Error("Could not find script with data-script-id='wasmbotsEmbedScript'. Make sure to add that attribute to your script tag!");
		}

		return new URL("rsc", script.src).pathname;
	}
	// @ts-ignore
	return __RSC_PATH__;
}
