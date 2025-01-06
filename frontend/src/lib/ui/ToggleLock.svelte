<script lang="ts">
	import { LockSimple, LockSimpleOpen } from "phosphor-svelte";

	interface Props {
		locked: boolean;
	}
	let { locked = $bindable(false) }: Props = $props();
</script>


<button class="toggleLock" onclick={() => { locked = !locked; }}>
	{#if locked}
		<LockSimple weight="fill" size={40} />
	{:else}
		<LockSimpleOpen size={40}/>
	{/if}
</button>

<style>
	button {
		width: 40px;
		height: 40px;
		background-color: transparent;
		color: rgb(218, 218, 218);
		border: none;
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 11px;
	}
</style>
