<svelte:options customElement="wasmbots-embed" />

<script lang="ts">
	import { setContext } from "svelte";

	import { Loader, Logger, Player, RNG, WasmCoordinator, World } from "wasmbots";

	import { DefaultWasmBotsState, type WasmBotsState, type SetupInfo } from "../../types.svelte";
	import WorldCanvas from "$lib/ui/WorldCanvas.svelte";

	const gameState: WasmBotsState = $state(structuredClone(DefaultWasmBotsState));
	setContext("gameState", gameState);

	function log(level: Logger.LogLevel, msg: string) {}

	const defaultSetup: SetupInfo = {
		botUrlList: [],
		map: "dynamic:dungeon",
		worldSeed: null,
		mapSeed: null,
		mapOptions: {},
	}

	interface Props {
		setup?: string;
		autoRun?: boolean;
	}
	let { setup = JSON.stringify(defaultSetup), autoRun = false, }: Props = $props();

	async function setupFromProps(setupProperty: string, autoRunProperty: boolean) {
		const setupInfo: SetupInfo = Object.assign(structuredClone(defaultSetup), JSON.parse(setupProperty));
		const w = new World(setupInfo.worldSeed!);
		await w.setMap(setupInfo.map!, new RNG(setupInfo.mapSeed!), setupInfo.mapOptions);
		gameState.world = w;
		await Promise.all(setupInfo.botUrlList!.map(async (burl) => {
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
			if (autoRunProperty !== false) {
				runForever();
			}
		}
	};

	export async function step() {
		await gameState.world?.runTurn();
	}

	async function runForever() {
		while (true) {
			await step();
		}
	}

	$effect(() => {
		setupFromProps(setup, autoRun);
	});
</script>


<WorldCanvas createWorld={false} />



