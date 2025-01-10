<script lang="ts">
	import { getContext, onMount, tick as svelteTick } from "svelte";

	import { CaretRight, Trash, Copy } from "phosphor-svelte";

	import { GameState, type Point } from "wasmbots";
	import { type LogEntry, type UIPlayerData, type WasmBotsState } from "../../types.svelte";

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

	let portraitOffset: Point = $state({x: -1, y: -1});
	$effect(() => {
		if (!playerUI.visPlayer) {
			portraitOffset = {x: -1, y: -1};
			return;
		}
		const portraitIdx = playerUI.visPlayer.imageIndex;
		const tilesPerRow = 192 / 16;
		const x = (portraitIdx % tilesPerRow) * 16;
		const y = Math.floor(portraitIdx / tilesPerRow) * 16;
		console.log(portraitIdx, "=>", x, y);
		portraitOffset = {x, y};
	});

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
		 	<div class="playerSprite"
				style={`background-position: -${portraitOffset.x*3}px -${portraitOffset.y*3}px`}
			>
			</div>
		{/if}
	</button>
	<div class="botStuffs">
		<div class="botInfo">
			<div class="name">
				{playerUI.playerObject.name}
				<div class="version">
					{#if playerUI.srcLink !== undefined && playerUI.srcLink.length >0 }
						<a href={playerUI.srcLink} target="_blank">{playerUI.playerObject.version.join(".")}</a>
					{:else}
						{playerUI.playerObject.version.join(".")}
					{/if}
				</div>
			</div>
			<button class="delete" onclick={dropPlayer} aria-label="delete this bot" disabled={!deleteEnabled}>
				<Trash size={20} />
			</button>
		</div>
		<div class="consoleContainer" class:expanded={consoleExpanded}>
			<div class="controls">
				<button class="disclosure" onclick={() => {consoleExpanded = !consoleExpanded; deferScroll();}} aria-label="Toggle expanded console">
					<CaretRight weight="fill" size={20} />
				</button>
				{#if consoleExpanded}
				<button class="copyLog" onclick={copyLogs} aria-label="copy logs to clipboard">
					<Copy size={20} />
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
		background-color: hsl(204, 10%, 15%);
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

	div.playerSprite {
		background-image: url("/rsc/img/kenny_tiny-dungeon_tilemap.png");
		background-origin: border-box;
		background-size: 576px;
		image-rendering: pixelated;
		image-rendering: -moz-crisp-edges;
		image-rendering: crisp-edges;
		width: 48px;
		height: 48px;
		margin: 5px;
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
		margin: 3px 0;
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
		align-items: center;
		opacity: 0.6;
	}

	.botStuffs button {
		border: none;
		background-color: transparent;
		color: white;
		display: flex;
		cursor: pointer;
	}

	.delete:disabled {
		opacity: 0.3;
		cursor: not-allowed;
	}

	.consoleContainer .controls {
		display: flex;
		justify-content: space-between;
	}

	.consoleContainer.expanded .controls {
		width: 100%;
	}

	.consoleContainer .controls button {
		height: 24px;
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
