<svelte:options customElement="wasmbots-embed" />

<script lang="ts">
	import { type StandaloneSetupInfo, DefaultStandaloneSetupInfo } from "../../types.svelte.ts";
	import Standalone from "$lib/mainComponents/Standalone.svelte";

	interface Props {
		setup: string;
		autoRun: boolean;
	}
	let { setup = JSON.stringify(DefaultStandaloneSetupInfo), autoRun = false }: Props = $props();

	let setupInfo: StandaloneSetupInfo = $derived(JSON.parse(setup));

	let childComponent: Standalone;

	export async function step() {
		await childComponent.step();
	}

	export async function run() {
		await childComponent.run();
	}

	export function pause() {
		childComponent.pause();
	}

</script>

<Standalone
	setupInfo={setupInfo}
	autoRun={autoRun}
	bind:this={childComponent}
/>
