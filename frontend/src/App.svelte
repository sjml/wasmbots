<script lang="ts">
    import BotChoice from "./lib/BotChoice.svelte";
</script>

<main>
    <div class="choiceOverlay">
        <BotChoice />
        <BotChoice />
    </div>
</main>

<style>
    .choiceOverlay {
        display: flex;
        justify-content: space-between;
    }
</style>
