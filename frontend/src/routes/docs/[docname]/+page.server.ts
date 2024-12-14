import * as fs from "node:fs";
import * as path from "node:path";

export function entries() {
	return [
		{ docname: "introduction" },
	];
}

export async function load({ params }) {
	if (params.docname.length == 0) {
		params.docname = "introduction";
	}
	let fileContents: string;
	try {
		fileContents = fs.readFileSync(path.join(`../docs/${params.docname}.md`), {encoding: "utf-8"});
	} catch(e) {
		return {
			exists: false,
			contents: `${e}`,
		}
	}
	return {
		exists: true,
		contents: fileContents,
	}
}
