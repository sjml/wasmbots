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

const iifeFile = `${embeddedOutputBase}/wasmbots/wasmbots-embedded.iife.js`;
let iifeSrc = await fs.readFile(iifeFile, {encoding: "utf-8"});
iifeSrc = iifeSrc.replaceAll('new URL("/wasmbot.worker-', 'new URL("./wasmbot.worker-');
await fs.writeFile(iifeFile, iifeSrc);


// make the actual distribution
process.chdir(embeddedOutputBase);
execSync(`tar -czf ${zipOutput} ./wasmbots/*`);
