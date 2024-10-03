<script lang="ts">
    import BotSelector from "./lib/BotSelector.svelte";
    import BotConsole from "./lib/BotConsole.svelte";

    let selectedBotFile: string;
</script>

<main>
    <BotSelector bind:chosen={selectedBotFile}/>
    <BotConsole selectedFile={selectedBotFile}/>
</main>

<style>
</style>
