import { build } from "vite";

import fs from "fs/promises";
import { execSync } from "child_process";

const embeddedOutputBase = "static/embedded"
const outputDirectory = `${embeddedOutputBase}/wasmbots`;
const zipOutput = "wasmbots-embed.tar.gz";

await build({
	configFile: "vite.component.config.js",
	build: {
		outDir: outputDirectory,
	}
});


// these parts could probably be done with the vite config
//   but not sure why they aren't already happening and don't
//   feel like tracking it down
await fs.cp(
	"static/rsc",
	`${outputDirectory}/rsc`,
	{dereference: true, preserveTimestamps: true, recursive: true}
);

const iifeFilename = `${embeddedOutputBase}/wasmbots/wasmbots-embedded.iife.js`;
let iifeSrc = await fs.readFile(iifeFilename, {encoding: "utf-8"});
iifeSrc = iifeSrc.replaceAll('new URL("/wasmbot.worker-', 'new URL("./wasmbot.worker-');
// const iifeBytes = new TextEncoder().encode(iifeSrc);
// const hashBuffer = await crypto.subtle.digest("SHA-256", iifeBytes);
// const hashArray = Array.from(new Uint8Array(hashBuffer));
// const base62chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
// const hashBase62 = hashArray.map(b => base62chars[b % base62chars.length]).join("");
// const shortHash = hashBase62.slice(0,8);
// const outputFilename = iifeFile.replace("wasmbots-embedded.iife.js", `wasmbots-embedded.iife-${shortHash}.js`);
const outputFilename = iifeFilename;
await fs.writeFile(outputFilename, iifeSrc);


// make the actual distribution
process.chdir(embeddedOutputBase);
execSync(`tar -czf ${zipOutput} ./wasmbots/*`);
