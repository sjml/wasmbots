<script lang="ts">
	import { onMount, setContext } from "svelte";
	import { base } from "$app/paths";

	import { type WasmBotsState, DefaultWasmBotsState } from "../../types.svelte";
	import Navbar from "$lib/ui/Navbar.svelte";
	import ToggleButton from "$lib/ui/ToggleButton.svelte";
	import FlowControl from "$lib/ui/FlowControl.svelte";
	import MapSelector from "$lib/ui/MapSelector.svelte";
	import WorldCanvas from "$lib/ui/WorldCanvas.svelte";
	import DrawerPanel from "$lib/ui/DrawerPanel.svelte";
	import BotSlotList from "$lib/ui/BotSlotList.svelte";
	import SettingsList from "$lib/ui/SettingsList.svelte";

	const gameState: WasmBotsState = $state(structuredClone(DefaultWasmBotsState));
	setContext("gameState", gameState);

	let leftPanelVisible = $state(false);
	let rightPanelVisible = $state(false);


	onMount(() => {
		if (!isSmallScreen) {
			leftPanelVisible = true;
			rightPanelVisible = false;
		}

		window.addEventListener("resize", updatePanelState);
		window.addEventListener("keydown", handleKeyDown);

		return () => {
			window.removeEventListener("resize", updatePanelState);
			window.removeEventListener("keydown", handleKeyDown);
		};
	});

	function handleKeyDown(evt: KeyboardEvent) {
		if (evt.code === "ArrowLeft") {
			evt.preventDefault();
			togglePanel("left");
			return;
		}
		if (evt.code === "ArrowRight") {
			evt.preventDefault();
			togglePanel("right");
			return;
		}
		if (evt.code === "ArrowUp") {
			if (isSmallScreen) {
				return;
			}
			evt.preventDefault();
			if (leftPanelVisible && rightPanelVisible) {
				leftPanelVisible = rightPanelVisible = false;
			}
			else {
				leftPanelVisible = rightPanelVisible = true;
			}
			return;
		}
	}

	let windowWidth: number = $state(window.innerWidth);
	let isSmallScreen: boolean = $derived(windowWidth < 900);

	function togglePanel(targetPanel: string) {
		if (targetPanel == "left") {
			leftPanelVisible = !leftPanelVisible;
		}
		else {
			rightPanelVisible = !rightPanelVisible;
		}
		if (isSmallScreen) {
			// if it's a small screen, close the other
			if (targetPanel == "left" && leftPanelVisible) {
				rightPanelVisible = false;
			}
			else if (rightPanelVisible) {
				leftPanelVisible = false;
			}
		}
	}

	function updatePanelState() {
		if (isSmallScreen && leftPanelVisible && rightPanelVisible) {
			rightPanelVisible = false;
		}
	}
</script>

<svelte:window bind:innerWidth={windowWidth} />

<DrawerPanel side="left" isOpened={leftPanelVisible}>
	<BotSlotList />
</DrawerPanel>
<DrawerPanel side="right" isOpened={rightPanelVisible}>
	<SettingsList/>
</DrawerPanel>
<div class="appContainer">
	<Navbar>
		<ToggleButton side="left"  isOpened={leftPanelVisible} toggle={togglePanel} label={"Toggle Bot Panel (Left Arrow)"}>
			<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256"><path d="M88,111.31l48,48V220a4,4,0,0,1-4,4H48a16,16,0,0,1-16-16V48A16,16,0,0,1,48,32H68a4,4,0,0,1,4,4V153.38a24,24,0,1,0,16,0ZM80,184a8,8,0,1,0-8-8A8,8,0,0,0,80,184Zm104-80a8,8,0,1,0-8,8A8,8,0,0,0,184,104Zm24-72H156a4,4,0,0,0-4,4V68.69l13.66,13.66a24,24,0,1,1-11.31,11.31l-16-16A8,8,0,0,1,136,72V36a4,4,0,0,0-4-4H92a4,4,0,0,0-4,4V88.69l61.66,61.65A8,8,0,0,1,152,156v64a4,4,0,0,0,4,4h52a16,16,0,0,0,16-16V48A16,16,0,0,0,208,32Z"></path></svg>
		</ToggleButton>
		<div class="spacer"></div>
		{#if !isSmallScreen}
			{#if leftPanelVisible && rightPanelVisible}
				<button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = false;}} aria-label="Close both side panels" title="Close both side panels (Up Arrow)">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M136,40V216a8,8,0,0,1-16,0V40a8,8,0,0,1,16,0ZM96,120H35.31l18.35-18.34A8,8,0,0,0,42.34,90.34l-32,32a8,8,0,0,0,0,11.32l32,32a8,8,0,0,0,11.32-11.32L35.31,136H96a8,8,0,0,0,0-16Zm149.66,2.34-32-32a8,8,0,0,0-11.32,11.32L220.69,120H160a8,8,0,0,0,0,16h60.69l-18.35,18.34a8,8,0,0,0,11.32,11.32l32-32A8,8,0,0,0,245.66,122.34Z"></path></svg>
				</button>
			{:else}
				<button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = true;}} aria-label="Open both side panels" title="Open both side panels (Up Arrow)">
					<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M136,40V216a8,8,0,0,1-16,0V40a8,8,0,0,1,16,0ZM69.66,90.34a8,8,0,0,0-11.32,11.32L76.69,120H16a8,8,0,0,0,0,16H76.69L58.34,154.34a8,8,0,0,0,11.32,11.32l32-32a8,8,0,0,0,0-11.32ZM240,120H179.31l18.35-18.34a8,8,0,0,0-11.32-11.32l-32,32a8,8,0,0,0,0,11.32l32,32a8,8,0,0,0,11.32-11.32L179.31,136H240a8,8,0,0,0,0-16Z"></path></svg>
				</button>
			{/if}
			<div class="divider"></div>
		{/if}
		{#if gameState.world }
			<MapSelector />
			<div class="divider"></div>
			<FlowControl />
		{/if}
		<div class="divider"></div>
		<button class="navLink" aria-label="Home Page" title="Return to home page">
			<a href="{base}/" aria-label="Link to WasmBots home page">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 256 256"><path d="M224,120v96a8,8,0,0,1-8,8H160a8,8,0,0,1-8-8V164a4,4,0,0,0-4-4H108a4,4,0,0,0-4,4v52a8,8,0,0,1-8,8H40a8,8,0,0,1-8-8V120a16,16,0,0,1,4.69-11.31l80-80a16,16,0,0,1,22.62,0l80,80A16,16,0,0,1,224,120Z"></path></svg>
			</a>
		</button>
		<div class="spacer"></div>

		<ToggleButton side="right" isOpened={rightPanelVisible} toggle={togglePanel} label={"Toggle Settings Panel (Right Arrow)"}>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><rect width="256" height="256" fill="none"/><circle cx="128" cy="128" r="40" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/><path d="M41.43,178.09A99.14,99.14,0,0,1,31.36,153.8l16.78-21a81.59,81.59,0,0,1,0-9.64l-16.77-21a99.43,99.43,0,0,1,10.05-24.3l26.71-3a81,81,0,0,1,6.81-6.81l3-26.7A99.14,99.14,0,0,1,102.2,31.36l21,16.78a81.59,81.59,0,0,1,9.64,0l21-16.77a99.43,99.43,0,0,1,24.3,10.05l3,26.71a81,81,0,0,1,6.81,6.81l26.7,3a99.14,99.14,0,0,1,10.07,24.29l-16.78,21a81.59,81.59,0,0,1,0,9.64l16.77,21a99.43,99.43,0,0,1-10,24.3l-26.71,3a81,81,0,0,1-6.81,6.81l-3,26.7a99.14,99.14,0,0,1-24.29,10.07l-21-16.78a81.59,81.59,0,0,1-9.64,0l-21,16.77a99.43,99.43,0,0,1-24.3-10l-3-26.71a81,81,0,0,1-6.81-6.81Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="16"/></svg>
		</ToggleButton>
	</Navbar>
	<WorldCanvas/>
</div>

<style>
	.appContainer {
		height: 100%;
		overflow: hidden;
		display: flex;
		flex-direction: column;
	}
</style>
