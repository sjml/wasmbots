<script lang="ts">
    import WorldCanvas from "./WorldCanvas.svelte";
    import BotPanel from "./BotPanel.svelte";
    import { onMount } from "svelte";

    let leftPanelVisible = false;
    let rightPanelVisible = false;

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
    <BotPanel side="left"  isOpened={leftPanelVisible } on:toggle={() => togglePanel("left")}/>
    <WorldCanvas/>
    <BotPanel side="right" isOpened={rightPanelVisible} on:toggle={() => togglePanel("right")}/>
</div>

<style>
    .appContainer {
        position: relative;
        height: 100%;
        overflow: hidden;
    }
</style>
