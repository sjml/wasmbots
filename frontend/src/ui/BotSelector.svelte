<script lang="ts">
    import rawBotInfo from "../../static/example_bots/bots.json";
    const botInfo: { [key: string]: any } = rawBotInfo;

    interface Props {
        chosen?: string;
    }

    let { chosen = $bindable("") }: Props = $props();
    let botData = $derived(chosen in botInfo ? botInfo[chosen] : null);
</script>

<select class="botSelector" bind:value={chosen}>
    {#if chosen.length == 0}
        <option disabled selected value>— Choose a Bot —</option>
    {/if}
    {#each Object.entries(botInfo) as [botFilename, botData]}
        <option value="{botFilename}">{botData.name}</option>
    {/each}
</select>

<div class="botInfo">
    {#if botData}
        <strong>Bot Name:</strong> {botData.name} (<a href={botData.source} target="_blank">src</a>)
    {:else}
        <br>
    {/if}
</div>

<style>
    .botSelector {
        margin-bottom: 10px;
    }
    .botInfo   {
        margin-bottom: 10px;
    }
</style>
