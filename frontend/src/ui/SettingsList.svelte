<script lang="ts">
	import { getContext } from "svelte";
	import { Config } from "wasmbots";
	import LogSlider from "./LogSlider.svelte";
	import ToggleLock from "./ToggleLock.svelte";
	import { type WasmBotsState } from "../types.svelte";
	const gameState: WasmBotsState = getContext("gameState");


	let minTurnTime = $state(Config.minimumTurnTime);
	$effect(() => {
		Config.minimumTurnTime = minTurnTime;
	});

	let turnBuffer = $state(Config.turnTimeBuffer);
	$effect(() => {
		Config.turnTimeBuffer = turnBuffer;
	});


	$effect(() => {
		if (gameState.world === null) return;

		gameState.world.on("mapChanged", (evt) => {
			gameState.mapSeed = evt.detail.newMap.randomSeed;
		});
	});
</script>

<div class="settings">
	<h2>Simulation Settings</h2>
	<LogSlider
		bind:value={minTurnTime}
		min={0}
		max={5000}
		name={"minimumTurnTime"}
	/>
	<div class="description">
		Controls the minimum amount of time that it takes
		for all bots to take their turn. (If some bots are
		ticking slowly, it could go longer.) The default of
		200ms gives them an urgent look without it feeling
		like <a href="https://www.youtube.com/watch?v=ZnHmskwqCCQ&t=4s"
		target="_blank">“Yakety Sax”</a> should be playing.
		(Note the slider above is logarithmic, going from
		0ms to 5000ms.)
	</div>

	<LogSlider
		bind:value={turnBuffer}
		min={0}
		max={500}
		name={"turnTimeBuffer"}
	/>
	<div class="description">
		A little harder to describe, but this is the amount
		of slop time given between the <code>minimumTurnTime</code>
		and the next bot starting its turn. Setting it to zero
		makes for very fluid movement when everyone is staying
		in their tick budgets.
	</div>

	<hr>
	<h2>Map Generation</h2>
	<div class="mapSeed">
		<div class="name">Random Seed</div>
		<input
			type="text" name="mapSeed"
			class="mapSeedInput"
			maxlength="50"
			readonly={gameState.mapSeedLocked}
			bind:value={gameState.mapSeed}
		>
		<ToggleLock bind:locked={gameState.mapSeedLocked} />
	</div>
	<div class="caveat"><em>(will put some more knobs here eventually, along with a button to download the generated map)</em></div>
</div>

<style>
	.settings {
		margin: 15px;
	}

	.description {
		margin-top: 10px;
		margin-bottom: 20px;
		font-size: small;
	}

	.description code {
		font-size: 110%;
	}

	.mapSeed {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	.mapSeedInput {
		flex-grow: 1;
		max-width: 50%;
		text-align: center;
		font-size: larger;
		max-height: 30px;
	}

	.mapSeedInput:read-only {
		background-color: rgb(87, 87, 87);
		color: white;
		border: none;
	}

	.name {
		margin-right: 10px;
		display: flex;
		align-items: center;
	}

	.caveat {
		margin: 20px 50px;
	}
</style>
