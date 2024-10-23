<script lang="ts">
    import BotSelector from "./BotSelector.svelte";
    import BotConsole from "./BotConsole.svelte";

    interface Props {
        side: string;
        isOpened: boolean;
        toggle: () => void;
    }
    let { side, isOpened, toggle }: Props = $props();

    let selectedBotFile: string = $state("");
</script>


<button id="{side}Toggle" class="toggleButton" onclick={toggle}>
    {#if isOpened}
        {#if side == "left"}
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M232,112a64.07,64.07,0,0,1-64,64H88v40a8,8,0,0,1-13.66,5.66l-48-48a8,8,0,0,1,0-11.32l48-48A8,8,0,0,1,88,120v40h80a48,48,0,0,0,0-96H80a8,8,0,0,1,0-16h88A64.07,64.07,0,0,1,232,112Z"></path></svg>
        {:else}
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M229.66,173.66l-48,48A8,8,0,0,1,168,216V176H88A64,64,0,0,1,88,48h88a8,8,0,0,1,0,16H88a48,48,0,0,0,0,96h80V120a8,8,0,0,1,13.66-5.66l48,48A8,8,0,0,1,229.66,173.66Z"></path></svg>
        {/if}
    {:else}
        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M88,111.31l48,48V220a4,4,0,0,1-4,4H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32H68a4,4,0,0,1,4,4V153.38a24,24,0,1,0,16,0ZM80,184a8,8,0,1,0-8-8A8,8,0,0,0,80,184Zm104-80a8,8,0,1,0-8,8A8,8,0,0,0,184,104Zm24-72H156a4,4,0,0,0-4,4V68.69l13.66,13.66a24,24,0,1,1-11.31,11.31l-16-16A8,8,0,0,1,136,72V36a4,4,0,0,0-4-4H92a4,4,0,0,0-4,4V88.69l61.66,61.65A8,8,0,0,1,152,156v64a4,4,0,0,0,4,4h52a16,16,0,0,0,16-16V48A16,16,0,0,0,208,32Z"></path></svg>
    {/if}
</button>

<div class="botPanel {side}Panel" class:panelOpened={isOpened}>
    <div class="botChoice">
        <BotSelector bind:chosen={selectedBotFile}/>
        <BotConsole selectedFile={selectedBotFile}/>
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
        padding: 60px 20px 20px 20px;

        transition: transform 0.3s ease;
        overflow-y: hidden;
        font-size: calc(15px + 0.5vw);

        z-index: 50;
    }

    .leftPanel {
        left: 0;
        transform: translateX(-100%);
    }
    .rightPanel {
        right: 0;
        transform: translateX(100%);
    }
    .botPanel.panelOpened {
        transform: translateX(0);
    }

    .toggleButton {
        position: fixed;
        top: 10px;
        width: 40px;
        height: 40px;
        background-color: #000000;
        color: rgb(218, 218, 218);
        border: none;
        cursor: pointer;
        font-size: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;

        z-index: 100;
    }
    .toggleButton svg {
        width: 25px;
        height: 25px;
        flex-shrink: 0;
    }

    #leftToggle {
        left: 10px;
    }
    #rightToggle {
        right: 10px;
    }

    .botChoice {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
    }
</style>
