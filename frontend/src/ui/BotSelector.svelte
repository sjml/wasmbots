<script lang="ts">
    import { onMount } from "svelte";
    import { Loader } from "wasmbots";

    interface Props {
        chosen?: string;
    }
    let { chosen = $bindable("") }: Props = $props();

    let botInfo: { [key: string]: any } = $state({});
    onMount(async () => {
        const res = await fetch("../example_bots/bots.json", {cache: "no-cache"});
        if (!res.ok) {
            console.error(`ERROR: Could not load bot list!: ${res.status} - ${res.statusText}`);
            return;
        }
        botInfo = await res.json();
    });

    let botData = $derived(chosen in botInfo ? botInfo[chosen] : null);
</script>

<select class="botSelector" bind:value={chosen} disabled={chosen.length > 0}>
    {#if chosen.length == 0}
        <option disabled selected value>— Choose a Bot —</option>
    {/if}
    {#each Object.entries(botInfo) as [botFilename, botData]}
        <option value="{botFilename}">{botData.name}</option>
    {/each}
</select>

<style>
    .botSelector {
        margin-bottom: 10px;
    }
</style>
