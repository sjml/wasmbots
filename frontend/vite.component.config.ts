import { svelte, vitePreprocess } from "@sveltejs/vite-plugin-svelte";
import base from "./vite.config";

const conf = Object.assign(base, {
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
});

export default conf;
