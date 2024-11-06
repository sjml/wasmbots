<script lang="ts">
    import { getContext } from "svelte";
    import { Loader, WasmCoordinator, Logger } from "wasmbots";
    import { UIPlayerData, type BotInfo } from "../types.svelte";

    import { type WasmBotsState } from "../types.svelte";
    const gameState: WasmBotsState = getContext("gameState");

    interface Props {
        slotIdx: number;
        exampleBotInfo: BotInfo;
        newBotCallback: (uipd: UIPlayerData) => void;
    }
    let { slotIdx, exampleBotInfo, newBotCallback }: Props = $props();

    async function makeNewPlayer(rawWasm: Uint8Array) {
        const uipd = UIPlayerData.makingNewPlayer(gameState.world!);
        const rngSeed = gameState.world!.rng.randInt(0, Number.MAX_SAFE_INTEGER);
        const coord = new WasmCoordinator(uipd.playerObject, uipd.selfLog, rngSeed, rawWasm);
        await uipd.playerObject.init(coord);
        newBotCallback(uipd);
        resetUI();
    }

    async function handleExampleBotSelect(evt: Event) {
        const fpath = `$rsc/../example_bots/${(evt.target as HTMLSelectElement).value}`;
        const wasmBytes = await Loader.readBinaryFile(fpath);
        await makeNewPlayer(wasmBytes);
    }

    let botSelector: HTMLSelectElement;
    function resetUI() {
        botSelector.value = "blank";
    }
</script>


<div class="botSlot">
    <div class="slotNumber">#{slotIdx}</div>
    <div class="botLoading">
        <select
            class="botSelector"
            onchange={handleExampleBotSelect}
            bind:this={botSelector}
        >
            <option disabled selected value="blank">— Example Bots —</option>
            {#each Object.entries(exampleBotInfo) as [botFilename, botData]}
                <option value={botFilename}>{botData.name}</option>
            {/each}
        </select>
        <input type="file" name="botUpload" id="botUpload" disabled>
    </div>
</div>

<style>
    .botSlot {
        background-color: rgb(30, 30, 30);
        min-height: 60px;
        border-top: 1px solid black;

        display: flex;
        flex-direction: row;

    }

    .slotNumber {
        margin-top: 15px;
        margin-left: 5px;
        margin-right: 15px;
        font-size: 20px;
    }

    .botLoading {
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
    }
</style>
