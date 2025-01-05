import path from "node:path";

export const repoWebUrl = "https://github.com/sjml/wasmbots";
export const repoBranch = "main";
export const projectRoot = path.resolve("..");
export const docsDir = path.join(projectRoot, "docs");
export const ignoreDirectories = [
	path.join(docsDir, "notes"),
	path.join(docsDir, "img"),
];
export const indexBasename = "_index";
export const indexFile = `${indexBasename}.md`;
