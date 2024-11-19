<script lang="ts">
	import { onMount, getContext } from "svelte";
	import { GameState } from "wasmbots";

	let currentGameState: GameState = $state(GameState.Setup);

	import { type WasmBotsState } from "../types.svelte";
	const gameState: WasmBotsState = getContext("gameState");

	let playButtonVisible: boolean = $state(true);
	let playPauseEnabled: boolean = $state(false);
	let stepEnabled: boolean = $state(false);
	let stopEnabled: boolean = $state(false);
	let refreshEnabled: boolean = $state(false);

	let runningContinuous: boolean = $state(false);
	let gameIsTicking: boolean = $state(false);

	/*
		Setup --> play visible, no buttons enabled
		Ready --> play and step enabled, stop and refresh disabled
		Running -->
			local.continuous --> play becomes pause (enabled), step disabled, stop and refresh enabled
			else --> pause becomes play (enabled), step, stop, and refresh enabled
		Shutdown --> everything disabled except refresh
	*/
	// more clever ways to do this probably but explicit is better than implicit
	onMount(() => {
		gameState.world!.on("gameStateChange", (evt) => {
			currentGameState = evt.detail.newState;
			updateButtonStates();
		});
	});

	function updateButtonStates() {
		switch(currentGameState) {
			case GameState.Setup:
				playButtonVisible = true;
				playPauseEnabled = false;
				stepEnabled = false;
				stopEnabled = false;
				refreshEnabled = false;

				runningContinuous = gameIsTicking = false;
				break;
			case GameState.Ready:
				playButtonVisible = true;
				playPauseEnabled = true;
				stepEnabled = true;
				stopEnabled = false;
				refreshEnabled = false;

				runningContinuous = gameIsTicking = false;
				break;
			case GameState.Running:
				if (runningContinuous) {
					playButtonVisible = false;
					playPauseEnabled = true;
					stepEnabled = false;
					stopEnabled = true;
					refreshEnabled = true;
				}
				else {
					playButtonVisible = true;
					playPauseEnabled = true;
					stepEnabled = true;
					stopEnabled = true;
					refreshEnabled = true;
				}
				break;
			case GameState.Shutdown:
				playButtonVisible = true;
				playPauseEnabled = false;
				stepEnabled = false;
				stopEnabled = false;
				refreshEnabled = true;

				runningContinuous = gameIsTicking = false;
				break;
			default:
				throw new Error("Unexpected game state!");
		}
	}

	async function runGameContinuous() {
		runningContinuous = true;
		gameIsTicking = true;
		if (gameState.world?.gameState == GameState.Ready) {
			gameState.world?.startGame();
		}
		updateButtonStates();
		while (runningContinuous && currentGameState == GameState.Running) {
			await stepGame();
		}
		gameIsTicking = false;
	}

	async function stepGame() {
		if (!runningContinuous) {
			gameIsTicking = true;
		}
		if (gameState.world?.gameState == GameState.Ready) {
			gameState.world?.startGame();
		}
		await gameState.world?.runTurn();
		if (!runningContinuous) {
			gameIsTicking = false;
		}
	}

	async function resetGame() {
		await gameState.world?.resetGame();
	}

	async function haltGame() {
		gameState.world?.stopGame();
	}

	async function pauseGame() {
		runningContinuous = false;
		updateButtonStates();
	}
</script>

<div class="flowControl">
	{#if playButtonVisible}
	<button class="flowControlButton" onclick={runGameContinuous} disabled={gameIsTicking || !playPauseEnabled} aria-label="Play WasmBots Game">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M240,128a15.74,15.74,0,0,1-7.6,13.51L88.32,229.65a16,16,0,0,1-16.2.3A15.86,15.86,0,0,1,64,216.13V39.87a15.86,15.86,0,0,1,8.12-13.82,16,16,0,0,1,16.2.3L232.4,114.49A15.74,15.74,0,0,1,240,128Z"></path></svg>
	</button>
	{:else}
	<button class="flowControlButton" onclick={pauseGame} disabled={(gameIsTicking && !runningContinuous) || !playPauseEnabled} aria-label="Pause WasmBots Game">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M216,48V208a16,16,0,0,1-16,16H160a16,16,0,0,1-16-16V48a16,16,0,0,1,16-16h40A16,16,0,0,1,216,48ZM96,32H56A16,16,0,0,0,40,48V208a16,16,0,0,0,16,16H96a16,16,0,0,0,16-16V48A16,16,0,0,0,96,32Z"></path></svg>
	</button>
	{/if}

	<button class="flowControlButton" onclick={stepGame} disabled={gameIsTicking || !stepEnabled} aria-label="Step WasmBots Game">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M208,40V216a8,8,0,0,1-16,0V146.77L72.43,221.55A15.95,15.95,0,0,1,48,208.12V47.88A15.95,15.95,0,0,1,72.43,34.45L192,109.23V40a8,8,0,0,1,16,0Z"></path></svg>
	</button>
	<button class="flowControlButton" onclick={haltGame} disabled={(gameIsTicking && !runningContinuous) || !stopEnabled} aria-label="Stop WasmBots Game">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M216,56V200a16,16,0,0,1-16,16H56a16,16,0,0,1-16-16V56A16,16,0,0,1,56,40H200A16,16,0,0,1,216,56Z"></path></svg>
	</button>
	<button class="flowControlButton" onclick={resetGame} disabled={gameIsTicking || !refreshEnabled} aria-label="Refresh WasmBots Game">
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M224,128a96,96,0,0,1-94.71,96H128A95.38,95.38,0,0,1,62.1,197.8a8,8,0,0,1,11-11.63A80,80,0,1,0,71.43,71.39a3.07,3.07,0,0,1-.26.25L60.63,81.29l17,17A8,8,0,0,1,72,112H24a8,8,0,0,1-8-8V56A8,8,0,0,1,29.66,50.3L49.31,70,60.25,60A96,96,0,0,1,224,128Z"></path></svg>
	</button>
</div>

<style>
	.flowControl {
		display: flex;
	}
	.flowControlButton {
		color: rgb(218, 218, 218);
		background-color: #00000000;
		border: none;
		cursor: pointer;
		display: flex;
		align-items: center;
	}
	.flowControlButton svg {
		width: 27px;
		height: 27px;
		flex-shrink: 0;
	}
	.flowControlButton:disabled {
		opacity: 0.3;
		cursor: not-allowed;
	}
</style>
