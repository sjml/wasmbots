<script lang="ts">
	import { onMount, getContext } from "svelte";

	import { Play, Pause, SkipForward, Stop, ArrowCounterClockwise } from "phosphor-svelte";

	import { GameState } from "wasmbots";

	import { type WasmBotsState } from "../../types.svelte";

	const BUTTON_SIZE = 27;

	let currentGameState: GameState = $state(GameState.Setup);
	const gameState: WasmBotsState = getContext("gameState");

	let playButtonVisible: boolean = $state(true);
	let playPauseEnabled: boolean = $state(false);
	let stepEnabled: boolean = $state(false);
	let stopEnabled: boolean = $state(false);
	let resetEnabled: boolean = $state(false);

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
				resetEnabled = false;

				runningContinuous = gameIsTicking = false;
				break;
			case GameState.Ready:
				playButtonVisible = true;
				playPauseEnabled = true;
				stepEnabled = true;
				stopEnabled = false;
				resetEnabled = false;

				runningContinuous = gameIsTicking = false;
				break;
			case GameState.Running:
				if (runningContinuous) {
					playButtonVisible = false;
					playPauseEnabled = true;
					stepEnabled = false;
					stopEnabled = true;
					resetEnabled = true;
				}
				else {
					playButtonVisible = true;
					playPauseEnabled = true;
					stepEnabled = true;
					stopEnabled = true;
					resetEnabled = true;
				}
				break;
			case GameState.Shutdown:
				playButtonVisible = true;
				playPauseEnabled = false;
				stepEnabled = false;
				stopEnabled = false;
				resetEnabled = true;

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
		<button class="flowControlButton" onclick={runGameContinuous} disabled={gameIsTicking || !playPauseEnabled} aria-label="Run" title="Run">
			<Play weight="fill" size={BUTTON_SIZE} />
		</button>
	{:else}
		<button class="flowControlButton" onclick={pauseGame} disabled={(gameIsTicking && !runningContinuous) || !playPauseEnabled} aria-label="Pause" title="Pause">
			<Pause weight="fill" size={BUTTON_SIZE} />
		</button>
	{/if}

	<button class="flowControlButton" onclick={stepGame} disabled={gameIsTicking || !stepEnabled} aria-label="Step" title="Step">
		<SkipForward weight="fill" size={BUTTON_SIZE} />
	</button>
	<button class="flowControlButton" onclick={haltGame} disabled={(gameIsTicking && !runningContinuous) || !stopEnabled} aria-label="Stop" title="Stop">
		<Stop weight="fill" size={BUTTON_SIZE} />
	</button>
	<button class="flowControlButton" onclick={resetGame} disabled={gameIsTicking || !resetEnabled} aria-label="Reset" title="Reset">
		<ArrowCounterClockwise size={BUTTON_SIZE} />
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
		padding: 0 5px;
	}
	.flowControlButton:disabled {
		opacity: 0.3;
		cursor: not-allowed;
	}
</style>
