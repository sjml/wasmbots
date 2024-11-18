<script lang="ts">
	import { getContext, onMount } from "svelte";

	import { Loader, Player, WorldMap, GameState } from "wasmbots";
	import { type WasmBotsState } from "../types.svelte";
	import BotSlot from "./BotSlot.svelte";
	import { UIPlayerData, type BotInfo } from "../types.svelte";
	import BotSlotLoader from "./BotSlotLoader.svelte";
	import { VisEventBus } from "../vis/events";
	import { VisPlayer } from "../vis/player";

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

		VisEventBus.on("player-vis-assigned", (data: { player: Player, vis: VisPlayer }) => {
			const idx = playerList.findIndex(uipd => uipd.playerObject === data.player);
			if (idx >= 0) {
				playerList[idx].visPlayer = data.vis;
			}
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

	function zoomChangeCallback(slotIdx: number, zoom: boolean) {
		if (!zoom) {
			console.log("zooming out");
			VisEventBus.emit("zoom-out");
			for (const uipd of playerList) {
				uipd.isZoomed = false;
			}
		}
		else {
			for (const [idx, uipd] of playerList.entries()) {
				if (slotIdx === idx + 1) {
					console.log("zooming in on", idx + 1);
					uipd.isZoomed = true;
					VisEventBus.emit("zoom-in", { target: uipd.visPlayer });
				}
				else {
					console.log("clearing zoom on", idx + 1)
					uipd.isZoomed = false;
				}
			}
		}
	}
</script>

<div class="botList">
	{#each playerList as _, pidx}
		<BotSlot slotIdx={pidx+1} bind:playerUI={playerList[pidx]} {zoomChangeCallback} />
	{/each}
	{#if gameInSetup && (playerList.length < maxPlayersAllowed)}
		<BotSlotLoader slotIdx={playerList.length+1} {exampleBotInfo} {newBotCallback} />
	{/if}
</div>

<style>
	.botList {
		display: flex;
		flex-direction: column;
	}
</style>
