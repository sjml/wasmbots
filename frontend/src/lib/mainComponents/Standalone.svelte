<script lang="ts">
	import { type SetupInfo } from "../../types.svelte.ts";
	import Embeddable from "$lib/mainComponents/Embeddable.svelte";

	interface Props {
		setupInfo: SetupInfo;
		autoRun: boolean;
	}
	let { setupInfo = {
		botUrlList: [],
		map: "dynamic:dungeon",
		mapSeed: null,
		worldSeed: null,
		mapOptions: {},
	}, autoRun = false }: Props = $props();

	let setupString = $derived(JSON.stringify(setupInfo));
</script>

<div class="standalone">
	<Embeddable
		setup={setupString}
		autoRun={autoRun}
	/>
</div>

<style>
	.standalone {
		max-width: 900px;
		margin: auto;
	}
</style>
