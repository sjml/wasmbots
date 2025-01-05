import fs from "node:fs";
import path from "node:path";

import { redirect, error } from "@sveltejs/kit";

import { unified } from "unified";
import { visit } from "unist-util-visit";
import type { Root as MRoot, Node as MNode, Link, Image } from "mdast";
import type { Root as HRoot, Node as HNode, Element } from "hast";
import remarkParse from "remark-parse";
import remarkFrontmatter from "remark-frontmatter";
import remarkSmartypants from "remark-smartypants";
import remarkRehype from "remark-rehype";
import rehypeStringify from "rehype-stringify";
import { toString as rNodeToString } from "hast-util-to-string";
import GitHubSlugger from "github-slugger";

import { trailingSlash } from "../../+layout.ts";
import * as docs from "$lib/docs.ts";


function makeGHLink(absolute: string): string {
	if (!absolute.startsWith(docs.projectRoot)) {
		throw new Error("Can't make GitHub link to file outside project directory");
	}
	const repoPath = absolute.substring(docs.projectRoot.length);
	return `${docs.repoWebUrl}/blob/${docs.repoBranch}${repoPath}`;

}

function fixMdLinks(params: {fpathAbsolute: string}) {
	const isIndex = path.basename(params.fpathAbsolute) === docs.indexFile;
	const effectivePath = (isIndex && trailingSlash !== "always")
		? params.fpathAbsolute
		: path.dirname(params.fpathAbsolute)
	;

	return (tree: MRoot) => {
		const linkNodes: Link[] = [];
		visit(tree, (node: MNode) => {
			if (node.type === "link") {
				linkNodes.push(node as Link);
			}
		});

		linkNodes.map((link) => {
			if (link.url.startsWith("http://") || link.url.startsWith("https://")) {
				return;
			}

			const parts = link.url.split("#");
			if (parts.length > 2) {
				throw new Error(`Invalid link "${link.url}"`);
			}
			const [rawLink, anchor] = parts;
			const suffix = anchor ? `#${anchor}` : "";

			const absoluteLinkPath = path.resolve(effectivePath, rawLink);

			if (!fs.existsSync(absoluteLinkPath)) {
				throw new Error(`"${absoluteLinkPath}" does not exist`);
			}

			if (   !absoluteLinkPath.startsWith(docs.docsDir)
				|| docs.ignoreDirectories.some(ig => absoluteLinkPath.startsWith(ig))
			) {
				link.url = `${makeGHLink(absoluteLinkPath)}${suffix}`;
				return;
			}

			let relativePath = path.relative(effectivePath, absoluteLinkPath);
			if (relativePath.endsWith(".md")) {
				relativePath = relativePath.slice(0, -3);
			}

			if (trailingSlash === "always" && !isIndex) {
				relativePath = path.join("..", relativePath);
			}

			relativePath = relativePath.split(path.sep).join("/");
			if (!relativePath.startsWith(".")) {
				relativePath = `./${relativePath}`;
			}

			link.url = `${relativePath}${suffix}`;
		});
	};
}

function fixImgPaths(params: {fpathAbsolute: string}) {
	const isIndex = path.basename(params.fpathAbsolute) === docs.indexFile;
	const effectivePath = (isIndex && trailingSlash !== "always")
		? params.fpathAbsolute
		: path.dirname(params.fpathAbsolute)
	;

	return (tree: MRoot) => {
		const imgNodes: Image[] = [];
		visit(tree, (node: MNode) => {
			if (node.type === "image") {
				imgNodes.push(node as Image);
			}
		});

		const docsImgDir = path.join(docs.docsDir, "img");
		const baseUrl = params.fpathAbsolute.substring(docs.projectRoot.length);
		const relUrl = path.relative(baseUrl, "/img/docs");
		imgNodes.map((img) => {
			if (img.url.startsWith("http://") || img.url.startsWith("https://")) {
				throw new Error("Don't hotlink images directly.");
			}

			const absoluteImgPath = path.resolve(effectivePath, img.url);

			if (!fs.existsSync(absoluteImgPath)) {
				throw new Error(`"${absoluteImgPath}" does not exist`);
			}
			if (!absoluteImgPath.startsWith(docsImgDir)) {
				throw new Error(`"${absoluteImgPath}" is not in docs/img`);
			}

			const relImgPath = path.join(relUrl, absoluteImgPath.substring(docsImgDir.length));
			img.url = relImgPath;
		});
	};
}

function classifyLinks(params: object) {
	return (tree: HRoot) => {
		const linkNodes: Element[] = [];
		visit(tree, (node: HNode) => {
			const elNode = node as Element;
			if (elNode.tagName === "a") {
				linkNodes.push(elNode);
			}
		});

		linkNodes.map((link) => {
			const url = link.properties["href"] as string;
			const classList = (link.properties["className"] as string[]) ?? [];
			if (url.startsWith("http://") || url.startsWith("https://")) {
				classList.push("external");
			}
			if (url.startsWith(docs.repoWebUrl)) {
				classList.push("github");
			}
			if (classList.length > 0) {
				link.properties["target"] = "_blank";
				link.properties["className"] = classList;
			}
		});
	};
}

function anchorifyAndIncrementHeaders(_params: object) {
	const slugger = new GitHubSlugger();

	return (tree: HRoot) => {
		const headerNodes: Element[] = [];
		visit(tree, (node: HNode) => {
			const elNode = node as Element;
			if (["h1", "h2", "h3", "h4", "h5", "h6"].some(tag => elNode.tagName === tag)) {
				headerNodes.push(elNode);
			}
		});

		headerNodes.map((header) => {
			const currentLevel = parseInt(header.tagName.substring(1));
			header.tagName = `h${currentLevel+1}`;
			const slug = slugger.slug(rNodeToString(header));
			header.properties.id = slug;
			header.children.push({
				type: "element",
				tagName: "a",

				properties: {
					href: `#${slug}`,
					className: ["header-anchor"],
					ariaHidden: "true",
					tabIndex: -1,
				},
				children: [{type: "text", value: "§"}],
			});
		});
	};
}

async function renderMarkdown(md: string, fpathAbsolute: string): Promise<string> {
	return String(await unified()
		.use(remarkParse)
		.use(remarkFrontmatter, ["yaml"])
		.use(fixMdLinks, {fpathAbsolute})
		.use(fixImgPaths, {fpathAbsolute})
		.use(remarkSmartypants, {
			dashes: "oldschool"
		})
		.use(remarkRehype)
		.use(classifyLinks, {})
		.use(anchorifyAndIncrementHeaders, {})
		.use(rehypeStringify)
		.process(md));
}

export async function load({params}) {
	let filename;
	if (params.docpath?.endsWith(docs.indexBasename)) {
		redirect(307, "./");
	}
	else if (params.docpath === undefined) {
		filename = docs.indexFile;
	}
	else {
		filename = params.docpath;
	}

	let fpath = path.resolve(docs.docsDir, filename);
	if (fs.existsSync(fpath) && fs.lstatSync(fpath).isDirectory()) {
		fpath = path.join(fpath, docs.indexFile);
	}
	else if (!fpath.endsWith(".md")) {
		fpath += ".md";
	}

	if (docs.ignoreDirectories.some(ig => fpath.startsWith(ig))) {
		error(404, "Ignored file");
	}
	if (!fs.existsSync(fpath)) {
		error(404, "no such file: " + fpath);
	}
	const content = fs.readFileSync(fpath, {encoding: "utf-8"});
	const md = await renderMarkdown(content, fpath);
	return {
		content: md,
		githubPath: makeGHLink(fpath),
	}
}
