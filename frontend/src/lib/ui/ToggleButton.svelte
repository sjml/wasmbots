<script lang="ts">
	import { type Snippet } from "svelte";

	interface Props {
		side: string;
		isOpened: boolean;
		label?: string;
		toggle: (side: string) => void;
		children: Snippet;
	}
	let { side, isOpened = $bindable(), label = "", toggle, children }: Props = $props();
</script>

<button class="toggle" onclick={() => toggle(side)} title={label.length > 0 ? label : null}>
	{#if isOpened}
		{#if side == "left"}
			<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M232,112a64.07,64.07,0,0,1-64,64H88v40a8,8,0,0,1-13.66,5.66l-48-48a8,8,0,0,1,0-11.32l48-48A8,8,0,0,1,88,120v40h80a48,48,0,0,0,0-96H80a8,8,0,0,1,0-16h88A64.07,64.07,0,0,1,232,112Z"></path></svg>
		{:else}
			<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M229.66,173.66l-48,48A8,8,0,0,1,168,216V176H88A64,64,0,0,1,88,48h88a8,8,0,0,1,0,16H88a48,48,0,0,0,0,96h80V120a8,8,0,0,1,13.66-5.66l48,48A8,8,0,0,1,229.66,173.66Z"></path></svg>
		{/if}
	{:else}
		{@render children?.()}
	{/if}
</button>

<style>
	button {
		width: 40px;
		height: 40px;
		background-color: hsl(204, 10%, 15%);
		border: 1px solid rgba(218, 218, 218, 0.1);
		border-radius: 11px;
		color: rgb(218, 218, 218);
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	:global(button.toggle svg) {
		width: 30px;
		height: 30px;
		flex-shrink: 0;
	}
</style>
