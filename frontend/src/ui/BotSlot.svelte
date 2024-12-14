<script lang="ts">
	import { getContext, onMount, tick as svelteTick } from "svelte";
	import { type LogEntry, type UIPlayerData } from "../types.svelte";

	import { type WasmBotsState } from "../types.svelte";
    import { GameState, Loader } from "wasmbots";
	const gameState: WasmBotsState = getContext("gameState");

	interface Props {
		playerUI: UIPlayerData;
		slotIdx: number;
		zoomChangeCallback: (slotIdx: number, zoom: boolean) => void;
	}
	let { playerUI = $bindable(), slotIdx, zoomChangeCallback }: Props = $props();

	let deleteEnabled = $state(true);
	onMount(() => {
		const removal = gameState.world!.on("gameStateChange", (evt) => {
			deleteEnabled = evt.detail.newState < GameState.Running;
		});

		return () => {
			removal();
		}
	});

	let consoleExpanded: boolean = $state(false);

	let consoleDiv: HTMLDivElement;
	let displayLines: LogEntry[] = $state([]);
	$effect(() => {
		displayLines = playerUI.consoleLines;
		deferScroll();
	});
	async function deferScroll() {
		await svelteTick();
		consoleDiv.scroll({
			top: consoleDiv.scrollHeight,
			behavior: "smooth",
		});
	}

	function copyLogs() {
		const output = playerUI.consoleLines.map(l => l.msg).join("\n");
		navigator.clipboard.writeText(output);
	}

	function dropPlayer() {
		if (playerUI) {
			gameState.world!.dropPlayer(playerUI.playerObject);
		}
	}
</script>

<div class="botSlot">
	<button
		class="botNumberAndSprite"
		class:zoomed={playerUI.isZoomed}
		onclick={() => { zoomChangeCallback(slotIdx, !playerUI.isZoomed); }}
	>
		<div class="slotNumber">#{slotIdx}</div>
		{#if playerUI.visPlayer !== null }
			<img
				src="{Loader.getRscPath()}/img/kenny_tiny-dungeon_tiles/tile_{String(playerUI.visPlayer.imageIndex).padStart(4, "0")}.png"
				alt="sprite for player #{slotIdx}"
				class="playerSprite"
			>
		{/if}
	</button>
	<div class="botStuffs">
		<div class="botInfo">
			<div class="name">
				{playerUI.playerObject.name}
				<div class="version">
					{playerUI.playerObject.version.join(".")}
				</div>
			</div>
			<button class="delete" onclick={dropPlayer} aria-label="delete this bot" disabled={!deleteEnabled}>
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M216,48H176V40a24,24,0,0,0-24-24H104A24,24,0,0,0,80,40v8H40a8,8,0,0,0,0,16h8V208a16,16,0,0,0,16,16H192a16,16,0,0,0,16-16V64h8a8,8,0,0,0,0-16ZM96,40a8,8,0,0,1,8-8h48a8,8,0,0,1,8,8v8H96Zm96,168H64V64H192ZM112,104v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Zm48,0v64a8,8,0,0,1-16,0V104a8,8,0,0,1,16,0Z"></path></svg>
			</button>
		</div>
		<div class="consoleContainer" class:expanded={consoleExpanded}>
			<div class="controls">
				<button class="disclosure" onclick={() => {consoleExpanded = !consoleExpanded; deferScroll();}} aria-label="Toggle expanded console">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M181.66,133.66l-80,80A8,8,0,0,1,88,208V48a8,8,0,0,1,13.66-5.66l80,80A8,8,0,0,1,181.66,133.66Z"></path></svg>
				</button>
				{#if consoleExpanded}
				<button class="copyLog" onclick={copyLogs} aria-label="copy logs to clipboard">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 256 256"><path d="M216,32H88a8,8,0,0,0-8,8V80H40a8,8,0,0,0-8,8V216a8,8,0,0,0,8,8H168a8,8,0,0,0,8-8V176h40a8,8,0,0,0,8-8V40A8,8,0,0,0,216,32ZM160,208H48V96H160Zm48-48H176V88a8,8,0,0,0-8-8H96V48H208Z"></path></svg>
				</button>
				{/if}
			</div>
			<div class="console" bind:this={consoleDiv}>
				{#each displayLines as log}
				<div class={log.level}>{log.msg}</div>
				{/each}
			</div>
		</div>
	</div>
</div>

<style>
	.botSlot {
		background-color: rgb(62, 62, 62, 0.6);
		min-height: 60px;
		border-top: 1px solid black;

		display: flex;
		flex-direction: row;
	}

	.botNumberAndSprite {
		display: flex;
		cursor: zoom-in;

		border: none;
		background-color: #00000000;
		color: white;
	}

	.botNumberAndSprite.zoomed {
		background-color: rgb(31, 75, 73);
		cursor: zoom-out;
	}

	.slotNumber {
		margin-top: 15px;
		margin-left: 5px;
		margin-right: 5px;
		font-size: 20px;
	}

	img.playerSprite {
		image-rendering: pixelated;
		image-rendering: -moz-crisp-edges;
		image-rendering: crisp-edges;
		margin: 5px 5px;
		width: 50px;
		height: auto;
		align-self: flex-start;
	}

	.botStuffs {
		flex-grow: 1;
		padding-top: 5px;
		min-width: 0;
	}

	.botInfo {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.botInfo .name {
		display: flex;
		align-items: baseline;
	}

	.botInfo .version {
		font-size: 70%;
		margin-left: 10px;
	}

	.consoleContainer {
		display: flex;
		flex-direction: row;
		opacity: 0.6;
	}

	.botStuffs button {
		border: none;
		background-color: transparent;
		color: white;
		display: flex;
		cursor: pointer;
	}

	.delete svg {
		width: 25px;
	}

	.delete:disabled {
		opacity: 0.3;
		cursor: not-allowed;
	}

	.consoleContainer .controls {
		display: flex;
		justify-content: space-between;
	}

	.consoleContainer .controls button {
		height: 24px;
	}

	.consoleContainer .controls button svg {
		height: 20px;
	}

	.console {
		background-color: rgb(0, 0, 0, 0.7);
		color: white;
		font-family: 'Courier New', Courier, monospace;
		font-size: small;
		white-space: pre;

		height: 20px;
		overflow-x: hidden;
		overflow-y: visible;

		width: 100%;

		padding: 1px 10px;
	}

	.consoleContainer.expanded button.disclosure {
		transform: rotate(90deg);
	}

	.consoleContainer.expanded .console {
		height: 150px;
		overflow-y: auto;
		overflow-x: auto;
	}

	.consoleContainer.expanded {
		flex-direction: column;
	}

	.console .error {
		font-weight: bold;
	}
	.console .error::before {
		content: "❌ ";
	}

	.console .info {
		color: rgb(180, 180, 180);
	}
	.console .info::before {
		content: "ⓘ ";
	}

	.console .log::before {
		content: "";
	}

	.console .warn::before {
		content: "⚠️ ";
	}

	.console .debug::before {
		content: "👾 ";
	}

	.console .error::before,
	.console .info::before,
	.console .log::before,
	.console .warn::before,
	.console .debug::before {
		font-family: "Apple Color Emoji", "Segoe UI Emoji", "Noto Color Emoji", sans-serif;
	}
</style>
