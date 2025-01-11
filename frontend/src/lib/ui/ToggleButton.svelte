<script lang="ts">
	import { type Snippet } from "svelte";

	import { ArrowUDownLeft, ArrowUDownRight } from "phosphor-svelte";

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
			<ArrowUDownLeft weight="fill" />
		{:else}
			<ArrowUDownRight weight="fill" />
		{/if}
	{:else}
		{@render children?.()}
	{/if}
</button>

<style>
	button {
		width: 40px;
		height: 40px;
		background-color: hsl(221, 10%, 15%);
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
