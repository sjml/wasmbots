<svelte:options customElement="wasmbots-embed" />

<script lang="ts">
    import { onMount, setContext } from "svelte";

    import WorldCanvas from "./WorldCanvas.svelte";
    import { type WasmBotsState } from "../state.svelte";

    import { Loader, Logger } from "../engine";
    import { Player } from "../engine/game/player";


    const gameState: WasmBotsState = $state({
        world: null,
        players: [],
        selectedMapName: "arena",
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
            const p = new Player(log, gameState.world!.rng.randInt(0, Number.MAX_SAFE_INTEGER));
            await p.init(wasmBytes);
            gameState.world?.registerPlayer(p)
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



