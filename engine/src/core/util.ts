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
