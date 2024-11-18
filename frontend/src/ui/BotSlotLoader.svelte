<script lang="ts">
	import { getContext } from "svelte";
	import { Loader, WasmCoordinator } from "wasmbots";
	import { UIPlayerData, type BotInfo } from "../types.svelte";

	import { type WasmBotsState } from "../types.svelte";
    import Spinner from "./Spinner.svelte";
	const gameState: WasmBotsState = getContext("gameState");

	interface Props {
		slotIdx: number;
		exampleBotInfo: BotInfo;
		newBotCallback: (uipd: UIPlayerData) => void;
	}
	let { slotIdx, exampleBotInfo, newBotCallback }: Props = $props();

	let isLoading = $state(false);

	async function makeNewPlayer(rawWasm: Uint8Array) {
		const uipd = new UIPlayerData();
		const rngSeed = gameState.world!.rng.randInt(0, Number.MAX_SAFE_INTEGER);
		const coord = new WasmCoordinator(uipd.playerObject, uipd.selfLog, rngSeed, rawWasm);
		await uipd.playerObject.init(coord);
		newBotCallback(uipd);
		resetUI();
	}

	async function handleExampleBotSelect(evt: Event) {
		isLoading = true;
		const fpath = `$rsc/../example_bots/${(evt.target as HTMLSelectElement).value}`;
		const wasmBytes = await Loader.readBinaryFile(fpath);
		await makeNewPlayer(wasmBytes);
	}

	async function handleFileUpload(file: File|null) {
		if (file === null) {
			console.error("Null file passed to upload handler");
			return;
		}
		isLoading = true;
		const wasmBuffer = await file.arrayBuffer();
		const wasmBytes = new Uint8Array(wasmBuffer);
		await makeNewPlayer(wasmBytes);
	}

	let botSelector: HTMLSelectElement;
	let uploaderElement: HTMLInputElement;
	let uploadedFiles: FileList|null = $state(null);
	function resetUI() {
		isLoading = false;
		botSelector.value = "blank";
		uploaderElement.value = "";
	}
	$effect(() => {
		if (uploadedFiles) {
			handleFileUpload(uploadedFiles.item(0));
		}
	});

</script>


<div class="botSlot">
	{#if isLoading}
		<Spinner />
	{/if}
	<div class="slotNumber">#{slotIdx}</div>
	<div class="botLoading">
		<select
			class="botSelector"
			onchange={handleExampleBotSelect}
			bind:this={botSelector}
			disabled={isLoading}
		>
			<option disabled selected value="blank">— Example Bots —</option>
			{#each Object.entries(exampleBotInfo) as [botFilename, botData]}
				<option value={botFilename}>{botData.name}</option>
			{/each}
		</select>
		<input type="file" name="botUpload" id="botUpload" bind:files={uploadedFiles} bind:this={uploaderElement} >
	</div>
</div>

<style>
	.botSlot {
		background-color: rgb(30, 30, 30);
		min-height: 60px;
		border-top: 1px solid black;

		display: flex;
		flex-direction: row;
		position: relative;
	}

	.slotNumber {
		margin-top: 15px;
		margin-left: 5px;
		margin-right: 15px;
		font-size: 20px;
	}

	.botLoading {
		display: flex;
		align-items: center;
		justify-content: space-between;
		width: 100%;
	}
</style>
