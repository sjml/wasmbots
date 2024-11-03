<script lang="ts">
    import { getContext, onMount } from "svelte";

    import { Loader } from "../engine";
    import { type WasmBotsState } from "../types.svelte";
    import type { Player } from "../engine/game/player";
    import type { WorldMap } from "../engine";
    import BotSlot from "./BotSlot.svelte";
    import { UIPlayerData, type BotInfo } from "../types.svelte";
    import BotSlotLoader from "./BotSlotLoader.svelte";
    import { GameState } from "../engine/game/world";

    const gameState: WasmBotsState = getContext("gameState");

    let playerList: UIPlayerData[] = $state([]);

    function handleMapChange(newMap: WorldMap) {
        if (playerList.length > newMap.maxPlayers) {
            // the world should have handled this before
            //   changing the map
            throw new Error("Max player miscount!");
        }
    }

    function handlePlayerDrop(leavingPlayer: Player) {
        let idx = playerList.findIndex(uip => uip.playerObject === leavingPlayer);
        if (idx < 0) {
            console.info("WEIRD: Dropped player UI wasn't aware of");
            return;
        }
        playerList.splice(idx, 1);
    }

    $effect(() => {
        if (gameState.world === null) return;

        gameState.world.on("mapChanged", (evt) => {
            handleMapChange(evt.detail.newMap);
            maxPlayersAllowed = evt.detail.newMap.maxPlayers;
        });

        gameState.world.on("playerDropped", (evt) => {
            handlePlayerDrop(evt.detail.leavingPlayer);
        })

        gameState.world.on("playerRegisterError", (evt) => {
            console.error(`Player registration error: ${evt.detail.reason}`);
            const idx = playerList.findIndex(uipd => uipd.playerObject === evt.detail.rejectedPlayer);
            if (idx < 0) {
                throw new Error("But also it wasn't from us?!");
            }
            playerList.splice(idx, 1);
        });

        gameState.world.on("gameStateChange", (evt) => {
            gameInSetup = evt.detail.newState <= GameState.Ready;
        });
    });

    let exampleBotInfo: BotInfo = $state({});
    onMount(async () => {
        exampleBotInfo = await Loader.readJsonFile("$rsc/../example_bots/bots.json");
    });

    let gameInSetup = $state(true);
    let maxPlayersAllowed = $state(1024);

    function newBotCallback(uipd: UIPlayerData) {
        playerList.push(uipd);
        gameState.world?.registerPlayer(uipd.playerObject);
    }
</script>

<div class="botList">
    {#each playerList as _, pidx}
        <BotSlot slotIdx={pidx+1} bind:playerUI={playerList[pidx]} />
    {/each}
    {#if gameInSetup && playerList.length < maxPlayersAllowed}
        <BotSlotLoader slotIdx={playerList.length+1} {exampleBotInfo} {newBotCallback} />
    {/if}
</div>

<style>
    .botList {
        display: flex;
        flex-direction: column;
    }
</style>
