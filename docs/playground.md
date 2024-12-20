<script lang="ts">
    import Standalone from "$lib/mainComponents/Standalone.svelte";
</script>

<div class="botWorld">
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
</div>

<style>
    .botWorld {
        max-width: 800px;
        margin: 20px auto;
    }
</style>
