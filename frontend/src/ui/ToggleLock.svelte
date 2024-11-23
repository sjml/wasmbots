<script lang="ts">
	interface Props {
		locked: boolean;
	}
	let { locked = $bindable(false) }: Props = $props();
</script>


<button class="toggleLock" onclick={() => { locked = !locked; }}>
	{#if locked}
		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M208,80H176V56a48,48,0,0,0-96,0V80H48A16,16,0,0,0,32,96V208a16,16,0,0,0,16,16H208a16,16,0,0,0,16-16V96A16,16,0,0,0,208,80ZM96,56a32,32,0,0,1,64,0V80H96Z"></path></svg>
	{:else}
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><rect width="256" height="256" fill="none"/><rect x="40" y="88" width="176" height="128" rx="8" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><path d="M88,88V56a40,40,0,0,1,40-40c19.35,0,36.29,13.74,40,32" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/></svg>
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
