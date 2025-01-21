import config from "./config.ts";

export function getGitRevision(): string {
	if (config.environment == "Deno") {
		// @ts-ignore
		const process = new Deno.Command("git", {
			args: ["rev-parse", "HEAD"],
			stdout: "piped",
		});
		const { stdout } = process.outputSync();
		return new TextDecoder().decode(stdout).trim();
	}
	try {
		// @ts-ignore
		return __GIT_REVISION__;
	} catch {
		return "[unknown]";
	}
}

export async function sleep(ms: number): Promise<void> {
	return new Promise(resolve => setTimeout(resolve, ms));
}

export function pathJoin(...parts: string[]): string {
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

export function pathDirname(filepath: string): string {
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

export function pathBasename(filepath: string): string {
	filepath = filepath.replace(/\/+/g, "/");
	const segments = filepath.split("/");
	if (segments.length === 0 || (segments.length === 1 && segments[0].length === 0)) {
		return "/";
	}

	const lastSegment = segments.pop() || "";

	// if path ends with slash, return last segment
	if (lastSegment.length === 0 && segments.length > 0) {
		return segments.pop()!;
	}

	return lastSegment;
}

export function stringToNumericEnum<T extends number>(enumObject: { [key: string]: T | string }, value: string): T | undefined {
	const key = Object.keys(enumObject).find(k => k.toLowerCase() === value.toLowerCase());
	return key !== undefined ? enumObject[key] as T : undefined;
}

export function encodeBase64(arr: Uint8Array): string {
	const binaryStr = String.fromCharCode(...arr);
	return btoa(binaryStr);
}

export function decodeBase64(str: string): Uint8Array {
	const binaryStr = atob(str);
	return Uint8Array.from(binaryStr, char => char.charCodeAt(0));
}

export function debugDataView(dataView: DataView): string {
	const hexArray: string[] = [];
	for (let i = 0; i < dataView.byteLength; i++) {
		const byte = dataView.getUint8(i);
		hexArray.push(byte.toString(16).padStart(2, '0'));
	}
	return hexArray.join(' ');
}

// I've gotten spoiled by Python's defaultdict
export class DefaultMap<K, V> extends Map<K, V> {
	private readonly defaultFactory: () => V;

	constructor(defaultValue: V | (() => V)) {
		super();
		this.defaultFactory = typeof defaultValue === 'function'
			? defaultValue as () => V
			: this.createDefaultFactory(defaultValue as V)
		;
	}

	private createDefaultFactory(value: V): () => V {
		if (value === null) {
			return () => value;
		}

		if (Array.isArray(value) || (typeof value === "object" && value.constructor === Object)) {
			return () => structuredClone(value);
		}

		return () => value;
	}

	get(key: K): V {
		if (!super.has(key)) {
			const value = this.defaultFactory();
			super.set(key, value);
		}
		return super.get(key)!;
	}

	set(key: K, value: V): this {
		if (value === undefined) {
			throw new Error("DefaultMap cannot contain undefined values.");
		}
		return super.set(key, value);
	}
}
