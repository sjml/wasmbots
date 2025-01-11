import { createHash } from "crypto";
import { promises as fs } from "fs";
import path from "path";

import { phaserAssetKeys } from "../src/vis/assets";

export default function hashAssetsPlugin() {
	const assetsDir = "static/rsc";
	const updatedAssetKeys: {[key:string]: string} = {};

	return {
		name: "hash-phaser-assets",
		async buildStart() {
			for (const [key, value] of Object.entries(phaserAssetKeys)) {
				const assetPath = path.resolve(assetsDir, value);
				const fileContent = await fs.readFile(assetPath);
				const fileHash = createHash("md5").update(fileContent).digest("hex").slice(0, 8);
				updatedAssetKeys[key] = `${value}?v=${fileHash}`;
			}
		},
		async transform(code: string, id: string) {
			if (id.endsWith("frontend/src/vis/assets.ts")) {
				return code.replace(
					/export const phaserAssetKeys = .*;/s,
					`export const phaserAssetKeys = ${JSON.stringify(updatedAssetKeys, null, 2)};`
				);
			}
		}
	};
}
