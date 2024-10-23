<script lang="ts">
    interface Props {
        side: string;
        isOpened: boolean;
        toggle: (side: string) => void;
    }
    let { side, isOpened = $bindable(), toggle }: Props = $props();
</script>

<button onclick={() => toggle(side)}>
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

<style>
    button {
        width: 40px;
        height: 40px;
        background-color: #000000;
        color: rgb(218, 218, 218);
        border: none;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 11px;
    }
    button svg {
        width: 30px;
        height: 30px;
        flex-shrink: 0;
    }
</style>
