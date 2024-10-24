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
            // leftPanelVisible = true;
            // rightPanelVisible = true;
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
                <!-- <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M216,104v8a56.06,56.06,0,0,1-48.44,55.47A39.8,39.8,0,0,1,176,192v40a8,8,0,0,1-8,8H104a8,8,0,0,1-8-8V216H72a40,40,0,0,1-40-40A24,24,0,0,0,8,152a8,8,0,0,1,0-16,40,40,0,0,1,40,40,24,24,0,0,0,24,24H96v-8a39.8,39.8,0,0,1,8.44-24.53A56.06,56.06,0,0,1,56,112v-8a58.14,58.14,0,0,1,7.69-28.32A59.78,59.78,0,0,1,69.07,28,8,8,0,0,1,76,24a59.75,59.75,0,0,1,48,24h24a59.75,59.75,0,0,1,48-24,8,8,0,0,1,6.93,4,59.74,59.74,0,0,1,5.37,47.68A58,58,0,0,1,216,104Z"></path></svg> -->
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
</style>
