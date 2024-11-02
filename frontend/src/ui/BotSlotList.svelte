<script lang="ts">
    import { getContext, onMount } from "svelte";

    import { Loader } from "../engine";
    import { type WasmBotsState } from "../types.svelte";
    import type { Player } from "../engine/game/player";
    import type { WorldMap } from "../engine";
    import BotSlot from "./BotSlot.svelte";
    import { type BotInfo, type UIPlayerData } from "../types.svelte";

    const gameState: WasmBotsState = getContext("gameState");

    let playerList: (UIPlayerData|null)[] = $state([]);

    function handleMapChange(newMap: WorldMap) {
        // compress just to make sure
        const newPlayerList: (UIPlayerData|null)[] = playerList.filter(pd => pd != null);

        const maxPlayerCount = newMap.spawnPoints.length;
        if (newPlayerList.length > maxPlayerCount) {
            // the world should have handled this before
            //   changing the map
            throw new Error("Max player miscount!");
        }
        playerList = newPlayerList.concat(Array(maxPlayerCount - newPlayerList.length).fill(null));
    }

    function handlePlayerAdd(newPlayer: Player) {
        let found = false;
        for (const p of playerList) {
            if (p && p.playerObject === newPlayer) {
                found = true;
                break;
            }
        }
        if (found) {
            // one of ours; don't worry
            return;
        }
        else {
            for (let idx = 0; idx < playerList.length; idx++) {
                if (playerList[idx] === null) {
                    playerList[idx] = {
                        playerObject: newPlayer,
                        consoleLines: [],
                        visPlayer: null,
                    };
                    return;
                }
            }
        }
        // uh oh --- should be unreachable
        throw new Error("Adding player that doesn't fit?!");
    }

    function handlePlayerDrop(leavingPlayer: Player) {
        let found = false;
        for (let idx = 0; idx < playerList.length; idx++) {
            if (playerList[idx]?.playerObject === leavingPlayer) {
                playerList.splice(idx, 1);
                playerList.push(null);
                found = true;
                break;
            }
        }
        if (!found) {
            console.info("WEIRD: Dropped player UI wasn't aware of");
        }
    }

    $effect(() => {
        if (gameState.world === null) return;

        gameState.world.on("mapChanged", (evt) => {
            handleMapChange(evt.detail.newMap);
        });

        gameState.world.on("playerAdded", (evt) => {
            handlePlayerAdd(evt.detail.newPlayer);
        });

        gameState.world.on("playerDropped", (evt) => {
            handlePlayerDrop(evt.detail.leavingPlayer);
        })
    });

    let exampleBotInfo: BotInfo = $state({});
    onMount(async () => {
        exampleBotInfo = await Loader.readJsonFile("$rsc/../example_bots/bots.json");
    });
</script>

<div class="botList">
    {#each playerList as _, pidx}
        <BotSlot slotIdx={pidx+1} bind:playerUI={playerList[pidx]} exampleBotInfo={exampleBotInfo} />
    {/each}
</div>

<style>
    .botList {
        display: flex;
        flex-direction: column;
    }
</style>
