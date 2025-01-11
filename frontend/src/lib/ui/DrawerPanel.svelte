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
		background-color: hsla(221, 10%, 5%, 0.8);
		color: white;
		padding-top: 50px;

		transition: transform 0.3s ease;
		overflow-y: auto;
		overflow-x: hidden;

		z-index: 15;
	}

	.leftPanel {
		left: 0;
		transform: translateX(-100%);
		border-right: 1px solid hsla(221, 10%, 5%, 0.8);
	}
	.rightPanel {
		right: 0;
		transform: translateX(100%);
		border-left: 1px solid hsla(221, 10%, 5%, 0.8);
	}
	.drawerPanel.panelOpened {
		transform: translateX(0);
	}
</style>
