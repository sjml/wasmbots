<script lang="ts">
    import { type Snippet } from "svelte";
    interface Props {
        side: string;
        isOpened: boolean;
        children?: Snippet;
    }
    let { side, isOpened, children }: Props = $props();
</script>


<div class="drawerPanel {side}Panel" class:panelOpened={isOpened}>
    {@render children?.()}
</div>

<style>
    .drawerPanel {
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
    .drawerPanel.panelOpened {
        transform: translateX(0);
    }
</style>
