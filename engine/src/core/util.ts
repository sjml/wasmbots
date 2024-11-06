import config from "./config.ts";

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

export async function encodeBase64(arr: Uint8Array): Promise<string> {
    const binaryStr = String.fromCharCode(...arr);
    return btoa(binaryStr);
}

export async function decodeBase64(str: string): Promise<Uint8Array> {
    const binaryStr = atob(str);
    return Uint8Array.from(binaryStr, char => char.charCodeAt(0));
}
