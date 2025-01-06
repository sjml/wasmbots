<script lang="ts">
	import { setContext } from "svelte";

	import { Player, CoreMsg } from "wasmbots";

	import { type WasmBotsState, DefaultWasmBotsState } from "../../types.svelte";
	import Navbar from "$lib/ui/Navbar.svelte";
	import WorldCanvas from "$lib/ui/WorldCanvas.svelte";
	import FlowControl from "$lib/ui/FlowControl.svelte";


	const gameState: WasmBotsState = $state(structuredClone(DefaultWasmBotsState));
	setContext("gameState", gameState);

	let player: Player|null = $state(null);
</script>

<Navbar>
	<div class="spacer"></div>
	{#if gameState.world }
		<FlowControl />
	{/if}
	<div class="spacer"></div>
</Navbar>

<div class="trainer">
	<div class="gameRow">
		<div class="playerInfo">
			{#if player}
				<ul>
					<!-- <li><strong>Hit Points:</strong>{player.hitPoints}</li> -->
				</ul>
			{:else}
			<div class="emptyPlayer">
				[No player loaded]
			</div>
			{/if}
		</div>
		<div class="gameView">
			<WorldCanvas/>
		</div>
	</div>
	<div class="memRow">
		<div class="msgPane">
			<h2>🚧⚠️🚧🏗️</h2>
			<ul>
				<li><strong>Clearly this whole interface is in-progress.</strong></li>
				<li>Idea is that you can step through with your bot, seeing the messages that it will receive, editing them if you want, and then seeing the messages it produced and editing them if you want before sending to the system.</li>
				<li>You become a human <a href="https://github.com/sjml/wasmbots/blob/main/engine/src/worker/coordinator.ts"><code>WasmCoordinator</code></a>, just like you always dreamed.</li>
				<li>Needs some work in the guts of the engine before this works, tho</li>
			</ul>
		</div>
		<div class="memory">
			<h2>Types of Messages:</h2>
			<ul>
				{#each [...CoreMsg.MessageTypeMap] as [key, value]}
					<li>{`${CoreMsg.MessageType[key].slice(0, -4)}`}</li>
				{/each}
			</ul>
		</div>
	</div>
</div>

<style>
	.trainer {
		width: 100vw;
		height: 100%;
	}
	a, a:visited {
		color: white;
	}
	.gameRow {
		height: 50vh;
		width: 100%;

		display: flex;
		justify-content: center;
	}
	.playerInfo {
		width: 300px;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.emptyPlayer {
		font-size: x-large;
	}
	.gameView {
		flex-shrink: 1;
		max-width: 75%;
	}

	.memRow {
		background-color: white;
		display: flex;
		width: 100%;
		height: 100%;
	}

	.msgPane {
		padding: 10px;
		width: 50%;
		background-color: rgb(68, 72, 81);
		color: white;
	}

	.memory {
		padding: 10px;
		width: 50%;
		background-color: rgb(81, 70, 68);
		color: white;
	}
</style>
