import { svelte, vitePreprocess } from "@sveltejs/vite-plugin-svelte";
import { defineConfig } from "vite";
import base from "./vite.config";

export default Object.assign(base, defineConfig({
	plugins: [svelte({
		preprocess: vitePreprocess(),
		compilerOptions: {
			customElement: true,
		},
	})],

	build: {
		lib: {
			entry: "src/lib/component.ts",
			name: "WasmBotsComponent",
			fileName: "wasmbots-embedded",
			formats: ["iife"],
		},
		assetsDir: ".",
	},
	define: {
		'__IIFE_BUILD__': 'true',
	}
}));
