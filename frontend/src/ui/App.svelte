<script lang="ts">
    import { onMount } from "svelte";

    import WorldCanvas from "./WorldCanvas.svelte";
    import BotPanel from "./BotPanel.svelte";
    import Navbar from "./Navbar.svelte";
    import ToggleButton from "./ToggleButton.svelte";
    import FlowControl from "./FlowControl.svelte";

    import { globalState } from "../state.svelte";

    let leftPanelVisible = $state(false);
    let rightPanelVisible = $state(false);


    onMount(() => {
        if (!isSmallScreen) {
            leftPanelVisible = true;
            rightPanelVisible = true;
        }

        window.addEventListener("resize", updatePanelState);

        return () => {
            window.removeEventListener("resize", updatePanelState);
        };
    });

    let windowWidth: number = $state(window.innerWidth);
    let isSmallScreen: boolean = $derived(windowWidth < 900)

    function togglePanel(targetPanel: string) {
        if (targetPanel == "left") {
            leftPanelVisible = !leftPanelVisible;
        }
        else {
            rightPanelVisible = !rightPanelVisible;
        }
        if (isSmallScreen) {
            // if it's a small screen, close the other
            if (targetPanel == "left" && leftPanelVisible) {
                rightPanelVisible = false;
            }
            else if (rightPanelVisible) {
                leftPanelVisible = false;
            }
        }
    }

    function updatePanelState() {
        if (isSmallScreen && leftPanelVisible && rightPanelVisible) {
            rightPanelVisible = false;
        }
    }
</script>

<svelte:window bind:innerWidth={windowWidth} />

<div class="appContainer">
    <Navbar>
        <ToggleButton side="left"  isOpened={leftPanelVisible } toggle={togglePanel} />
        <div class="spacer"></div>
        {#if !isSmallScreen}
            {#if leftPanelVisible && rightPanelVisible}
                <button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = false;}} aria-label="Close both side panels">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M136,40V216a8,8,0,0,1-16,0V40a8,8,0,0,1,16,0ZM96,120H35.31l18.35-18.34A8,8,0,0,0,42.34,90.34l-32,32a8,8,0,0,0,0,11.32l32,32a8,8,0,0,0,11.32-11.32L35.31,136H96a8,8,0,0,0,0-16Zm149.66,2.34-32-32a8,8,0,0,0-11.32,11.32L220.69,120H160a8,8,0,0,0,0,16h60.69l-18.35,18.34a8,8,0,0,0,11.32,11.32l32-32A8,8,0,0,0,245.66,122.34Z"></path></svg>
                </button>
            {:else}
                <button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = true;}} aria-label="Open both side panels">
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M136,40V216a8,8,0,0,1-16,0V40a8,8,0,0,1,16,0ZM69.66,90.34a8,8,0,0,0-11.32,11.32L76.69,120H16a8,8,0,0,0,0,16H76.69L58.34,154.34a8,8,0,0,0,11.32,11.32l32-32a8,8,0,0,0,0-11.32ZM240,120H179.31l18.35-18.34a8,8,0,0,0-11.32-11.32l-32,32a8,8,0,0,0,0,11.32l32,32a8,8,0,0,0,11.32-11.32L179.31,136H240a8,8,0,0,0,0-16Z"></path></svg>
                </button>
            {/if}
            <div class="divider"></div>
        {/if}
        {#if globalState.world }
            <FlowControl />
        {/if}
        <div class="divider"></div>
        <div class="navLink">
            <a href="https://github.com/sjml/wasmbots" target="_blank" aria-label="Link to GitHub project source for WasmBots">
                <svg fill="currentColor" viewBox="0 0 98 96" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"/></svg>
            </a>
        </div>
        <div class="spacer"></div>
        <ToggleButton side="right" isOpened={rightPanelVisible} toggle={togglePanel} />
    </Navbar>
    <BotPanel side="left"  isOpened={leftPanelVisible } />
    <BotPanel side="right" isOpened={rightPanelVisible} />
    <WorldCanvas/>
</div>

<style>
    .appContainer {
        position: relative;
        height: 100%;
        overflow: hidden;
    }

    .spacer {
        flex-grow: 1;
    }

    .divider {
        border-left: 1px rgb(100, 100, 100) solid;
        margin-left: 5px;
        margin-right: 10px;
    }

    .navLink {
        width: 40px;
        height: 40px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .navLink svg {
        width: 38px;
        height: 38px;
        flex-shrink: 0;
    }
    .navLink a {
        color: rgb(218, 218, 218);
    }

    .navBarButton {
        color: rgb(218, 218, 218);
        background-color: #00000000;
        border: none;
        cursor: pointer;
        display: flex;
        align-items: center;
    }
    .navBarButton svg {
        width: 32px;
        height: 32px;
        flex-shrink: 0;
    }
    .navBarButton:disabled {
        opacity: 0.3;
        cursor: not-allowed;
    }
</style>
