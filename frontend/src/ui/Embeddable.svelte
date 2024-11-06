<svelte:options customElement="wasmbots-embed" />

<script lang="ts">
    import { onMount, setContext } from "svelte";
    import { Loader, Logger, Player, WasmCoordinator } from "wasmbots";

    import WorldCanvas from "./WorldCanvas.svelte";
    import { type WasmBotsState } from "../types.svelte";


    const gameState: WasmBotsState = $state({
        world: null,
        vis: null,
    });
    setContext("gameState", gameState);

    function log(level: Logger.LogLevel, msg: string) {}

    type SetupInfo = {
        botUrlList: string[],
    };
    const defaultSetup: SetupInfo = {
        botUrlList: [],
    }

    interface Props {
        setup: string;
        autoRun: boolean;
    }
    let { setup = JSON.stringify(defaultSetup), autoRun = false, }: Props = $props();
    async function setupFromProps() {
        const setupInfo: SetupInfo = JSON.parse(setup);
        for (const botUrl of setupInfo.botUrlList) {
            const wasmBytes = await Loader.readBinaryFile(botUrl);
            const player = new Player();
            const coord = new WasmCoordinator(
                player,
                log,
                gameState.world!.rng.randInt(0, Number.MAX_SAFE_INTEGER),
                wasmBytes,
            )
            await player.init(coord);
            gameState.world?.registerPlayer(player);
        }
        if (gameState.world?.isReadyToStart()) {
            gameState.world.startGame();
            if (autoRun) {
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

    onMount(() => {
        setupFromProps();
    });
</script>


<WorldCanvas/>



