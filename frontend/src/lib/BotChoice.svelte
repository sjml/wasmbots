<script lang="ts">
    import BotSelector from "./BotSelector.svelte";
    import BotConsole from "./BotConsole.svelte";

    let selectedBotFile: string;
</script>

<div class="botChoice">
    <BotSelector bind:chosen={selectedBotFile}/>
    <BotConsole selectedFile={selectedBotFile}/>
</div>

<style>
    .botChoice {
        width: 700px;

        /* opacity: 80%; */
    }
</style>
