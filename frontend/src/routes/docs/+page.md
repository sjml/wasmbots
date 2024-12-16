<script lang="ts">
    import Standalone from "$lib/mainComponents/Standalone.svelte";
</script>

# WasmBots

Playing with [mdxsvex](https://mdsvex.pngwn.io/). Eventually some docs or something will go here? In the meantime I am enjoying the fact that I can import a Svelte component in Markdown. 

<Standalone autoRun={true} setupInfo={{
    botUrlList: [
        "../example_bots/wanderer.wasm",
        "../example_bots/explorer.wasm",
        "../example_bots/wallflower.wasm",
        "../example_bots/explorer.wasm",
    ],
    minimumTurnTime: 50,
    turnTimeBuffer: 3,
}} />
