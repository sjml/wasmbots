<script lang="ts">
    import BotSelector from "./BotSelector.svelte";
    import BotConsole from "./BotConsole.svelte";

    import { Player } from "../engine/game/player";

    import { globalState } from "../state.svelte";

    interface Props {
        side: string;
        isOpened: boolean;
    }
    let { side, isOpened }: Props = $props();
    let isLoading: boolean = $state(false);
    function setLoading(val: boolean) {
        isLoading = val;
    }

    function newPlayerObj(p: Player) {
        if (side == "left") {
            if (globalState.leftPlayer != null) {
                globalState.world?.dropPlayer(globalState.leftPlayer);
            }
            globalState.leftPlayer = p;
        }
        else {
            if (globalState.rightPlayer != null) {
                globalState.world?.dropPlayer(globalState.rightPlayer);
            }
            globalState.rightPlayer = p;
        }
        globalState.world?.registerPlayer(p);
    }

    let selectedBotFile: string = $state("");
</script>


<div class="botPanel {side}Panel" class:panelOpened={isOpened}>
    <div class="loadingOverlay" class:loading={isLoading}>
        <div class="spinner"></div>
    </div>
    <div class="botChoice">
        <BotSelector bind:chosen={selectedBotFile}/>
        <BotConsole selectedFile={selectedBotFile} newPlayerObj={newPlayerObj} reportLoading={setLoading}/>
    </div>
</div>

<style>
    .botPanel {
        position: fixed;
        top: 0;
        height: 100%;
        width: 450px;
        max-width: calc(100% - 60px);
        background-color: rgb(0, 0, 0, 0.7);
        color: white;
        padding-top: 70px;

        transition: transform 0.3s ease;
        overflow-y: hidden;
        font-size: calc(15px + 0.5vw);

        z-index: 15;
    }

    .loadingOverlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(144, 144, 144, 0.547);
        z-index: 100;
        pointer-events: none;
        opacity: 0.0;

        display: flex;
        align-items: center;
        justify-content: center;

        transition: opacity .6s ease-in-out;
    }
    .loadingOverlay.loading {
        opacity: 1.0;
    }

    .spinner {
        color: white;
        display: inline-block;
        position: relative;
    }
    .spinner:after {
        content: " ";
        display: block;
        border-radius: 50%;
        width: 0;
        height: 0;
        margin: 8px;
        box-sizing: border-box;
        border: 50px solid currentColor;
        border-color: currentColor transparent currentColor transparent;
        animation: spinner 1.8s infinite;
    }
    @keyframes spinner {
        0% {
            transform: rotate(0);
            animation-timing-function: cubic-bezier(0.55, 0.055, 0.675, 0.19);
        }
        50% {
            transform: rotate(900deg);
            animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
        }
        100% {
            transform: rotate(1800deg);
        }
    }

    .leftPanel {
        left: 0;
        transform: translateX(-100%);
        padding-right: 20px;
    }
    .rightPanel {
        right: 0;
        transform: translateX(100%);
        padding-left: 20px;
    }
    .botPanel.panelOpened {
        transform: translateX(0);
    }

    .botChoice {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }
</style>
