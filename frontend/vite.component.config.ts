import { svelte, vitePreprocess } from "@sveltejs/vite-plugin-svelte";
import { defineConfig } from "vite";
import base from "./vite.config";
import { execSync } from "child_process";

export default Object.assign(base, defineConfig({
	plugins: [svelte({
		preprocess: vitePreprocess(),
		compilerOptions: {
			customElement: true,
		},
	})],

	resolve: {
		alias: {
			$lib: "src/lib",
		}
	},

	build: {
		lib: {
			entry: "src/lib/embeddableWasmBots.ts",
			name: "WasmBotsComponent",
			fileName: "wasmbots-embedded",
			formats: ["iife"],
		},
		assetsDir: ".",
	},
	define: {
		'__IIFE_BUILD__': 'true',
		'__GIT_REVISION__': `'${execSync('git rev-parse HEAD').toString().trim()}'`,
	}
}));
