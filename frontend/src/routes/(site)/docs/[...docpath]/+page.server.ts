import fs from "node:fs";
import path from "node:path";

import * as docs from "$lib/docs.ts";

async function* walk(dir: string): AsyncGenerator<string> {
	for await (const d of await fs.promises.opendir(dir)) {
		if (d.name.startsWith(".")) {
			continue;
		}
		const entry = path.join(dir, d.name);
		if (d.isDirectory()) yield* walk(entry);
		else if (d.isFile() ) yield entry;
	}
}

export async function entries() {
	const output = [];
	for await (const f of walk(docs.docsDir)) {
		if (!docs.ignoreDirectories.some(ig => f.startsWith(ig))) {
			let rel = f.substring(docs.docsDir.length+1);
			if (rel.endsWith(".md")) {
				rel = rel.slice(0,-3);
			}
			output.push({docpath: rel});
		}
	}
	return output;
}
