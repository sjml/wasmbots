<script lang="ts">
	import { type Snippet } from "svelte";
	interface Props {
		children: Snippet;
	};
	let { children }: Props = $props();
</script>

<nav>
	{@render children?.()}
</nav>

<style>
	nav {
		height: 50px;
		flex-shrink: 0;
		background-color: rgb(37, 37, 37);
		display: flex;
		justify-content: space-between;
		padding: 5px;

		z-index: 20;
	}
	:global(.spacer) {
		flex-grow: 1;
	}
	:global(.divider) {
		border-left: 1px rgb(100, 100, 100) solid;
		margin-left: 5px;
		margin-right: 10px;
	}

	:global(.navLink) {
		width: 40px;
		height: 40px;
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	:global(.navLink svg) {
		width: 38px;
		height: 38px;
		flex-shrink: 0;
	}
	:global(.navLink a) {
		color: rgb(218, 218, 218);
	}

	:global(.navBarButton) {
		color: rgb(218, 218, 218);
		background-color: #00000000;
		border: none;
		cursor: pointer;
		display: flex;
		align-items: center;
	}
	:global(.navBarButton:disabled) {
		opacity: 0.3;
		cursor: not-allowed;
	}
	:global(.navBarButton svg) {
		width: 32px;
		height: 32px;
		flex-shrink: 0;
	}
</style>
