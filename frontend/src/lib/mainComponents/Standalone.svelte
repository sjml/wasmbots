<script lang="ts">
	import { setContext, onMount } from "svelte";

	import { Config, Loader, Logger, Player, RNG, WasmCoordinator, World } from "wasmbots";

	import { DefaultWasmBotsState, type WasmBotsState, type StandaloneSetupInfo, DefaultStandaloneSetupInfo } from "../../types.svelte";
	import WorldCanvas from "$lib/ui/WorldCanvas.svelte";

	const aspectRatio = Config.gameWidth / Config.gameHeight;

	const gameState: WasmBotsState = $state(structuredClone(DefaultWasmBotsState));
	setContext("gameState", gameState);

	function log(level: Logger.LogLevel, msg: string) {}

	interface Props {
		setupInfo?: StandaloneSetupInfo;
		autoRun?: boolean;
	}
	let { setupInfo = DefaultStandaloneSetupInfo, autoRun = false, }: Props = $props();

	let mainDiv: HTMLDivElement;
	export function requestFullscreen() {
		mainDiv.requestFullscreen();
	}

	async function setupFromProps() {
		const setup: StandaloneSetupInfo = Object.assign(structuredClone(DefaultStandaloneSetupInfo), setupInfo);
		autoRun = autoRun !== false;
		const w = new World(setup.worldSeed!);
		await w.setMap(setup.map!, new RNG(setup.mapSeed!), setup.mapOptions);
		w.minimumTurnTime = setup.minimumTurnTime!;
		w.turnTimeBuffer = setup.turnTimeBuffer!;
		gameState.world = w;

		await Promise.all(setup.botUrlList!.map(async (burl) => {
			const wasmBytes = await Loader.readBinaryFile(burl);
			const player = new Player();
			const coord = new WasmCoordinator(
				player,
				log,
				gameState.world!.rng.randInt(0, Number.MAX_SAFE_INTEGER),
				wasmBytes,
			)
			await player.init(coord);
			gameState.world!.registerPlayer(player);
		}));
		if (gameState.world!.isReadyToStart()) {
			gameState.world.startGame();
			if (autoRun) {
				run();
			}
		}
	};

	export async function step() {
		await gameState.world?.runTurn();
	}

	export async function run() {
		autoRun = true;
		while (autoRun) {
			await step();
		}
	}

	export async function pause() {
		autoRun = false;
	}

	onMount(() => {
		setupFromProps();
	});
</script>

<div bind:this={mainDiv} class="worldSizer" style="--aspectRatio: {aspectRatio};">
	<WorldCanvas createWorld={false} />
</div>

<style>
	.worldSizer {
		aspect-ratio: var(--aspectRatio);
		width: 100%;
		max-width: 100%;
		height: auto;
	}
</style>
