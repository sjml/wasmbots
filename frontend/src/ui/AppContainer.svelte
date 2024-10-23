<script lang="ts">
    import WorldCanvas from "./WorldCanvas.svelte";
    import BotPanel from "./BotPanel.svelte";
    import Navbar from "./Navbar.svelte";
    import ToggleButton from "./ToggleButton.svelte";

    import { onMount } from "svelte";

    let leftPanelVisible = $state(false);
    let rightPanelVisible = $state(false);

    onMount(() => {
        if (!isSmallScreen()) {
            leftPanelVisible = true;
            rightPanelVisible = true;
        }

        window.addEventListener("resize", updatePanelState);

        return () => {
            window.removeEventListener("resize", updatePanelState);
        };
    });

    function isSmallScreen(): boolean {
        return window.innerWidth < 900;
    }

    function togglePanel(targetPanel: string) {
        if (targetPanel == "left") {
            leftPanelVisible = !leftPanelVisible;
        }
        else {
            rightPanelVisible = !rightPanelVisible;
        }
        if (isSmallScreen()) {
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
        if (isSmallScreen() && leftPanelVisible && rightPanelVisible) {
            rightPanelVisible = false;
        }
    }

</script>

<div class="appContainer">
    <Navbar>
        <ToggleButton side="left"  isOpened={leftPanelVisible } toggle={togglePanel} />
        <div class="spacer"></div>
        <div class="navLink">
            <a href="https://github.com/sjml/wasmbots" target="_blank" aria-label="Link to GitHub project source for WasmBots">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M216,104v8a56.06,56.06,0,0,1-48.44,55.47A39.8,39.8,0,0,1,176,192v40a8,8,0,0,1-8,8H104a8,8,0,0,1-8-8V216H72a40,40,0,0,1-40-40A24,24,0,0,0,8,152a8,8,0,0,1,0-16,40,40,0,0,1,40,40,24,24,0,0,0,24,24H96v-8a39.8,39.8,0,0,1,8.44-24.53A56.06,56.06,0,0,1,56,112v-8a58.14,58.14,0,0,1,7.69-28.32A59.78,59.78,0,0,1,69.07,28,8,8,0,0,1,76,24a59.75,59.75,0,0,1,48,24h24a59.75,59.75,0,0,1,48-24,8,8,0,0,1,6.93,4,59.74,59.74,0,0,1,5.37,47.68A58,58,0,0,1,216,104Z"></path></svg>
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

    /* TODO: this is mostly copied from the ToggleButton; can consolidate? */
    .navLink {
        width: 40px;
        height: 40px;
        color: black;
        background-color: rgb(218, 218, 218);
        border: none;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
    }
    .navLink svg {
        width: 32px;
        height: 32px;
        flex-shrink: 0;
    }
    .navLink a {
        color: black;
    }
</style>
