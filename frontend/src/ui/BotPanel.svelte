<script lang="ts">
    import BotSelector from "./BotSelector.svelte";
    import BotConsole from "./BotConsole.svelte";

    import { Player } from "../engine/game/player";

    import { global } from "../state.svelte";

    interface Props {
        side: string;
        isOpened: boolean;
    }
    let { side, isOpened }: Props = $props();

    function newPlayerObj(p: Player) {
        if (side == "left") {
            if (global.leftPlayer != null) {
                global.world?.dropPlayer(global.leftPlayer);
            }
            global.leftPlayer = p;
        }
        else {
            if (global.rightPlayer != null) {
                global.world?.dropPlayer(global.rightPlayer);
            }
            global.rightPlayer = p;
        }
        global.world?.registerPlayer(p);
    }

    let selectedBotFile: string = $state("");
</script>


<div class="botPanel {side}Panel" class:panelOpened={isOpened}>
    <div class="botChoice">
        <BotSelector bind:chosen={selectedBotFile}/>
        <BotConsole selectedFile={selectedBotFile} newPlayerObj={newPlayerObj} />
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
