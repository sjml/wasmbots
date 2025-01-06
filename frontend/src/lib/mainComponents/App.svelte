<script lang="ts">
	import { onMount, setContext } from "svelte";
	import { base } from "$app/paths";

	import {
		Circuitry,
		ArrowsInLineHorizontal,
		ArrowsOutLineHorizontal,
		House,
		Gear,
	} from "phosphor-svelte";

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
			<Circuitry weight="fill"/>
		</ToggleButton>
		<div class="spacer"></div>
		{#if !isSmallScreen}
			{#if leftPanelVisible && rightPanelVisible}
				<button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = false;}} aria-label="Close both side panels" title="Close both side panels (Up Arrow)">
					<ArrowsInLineHorizontal size={30} />
				</button>
			{:else}
				<button class="navBarButton" onclick={() => {leftPanelVisible = rightPanelVisible = true;}} aria-label="Open both side panels" title="Open both side panels (Up Arrow)">
					<ArrowsOutLineHorizontal size={30} />
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
				<House weight="fill" size={30} />
			</a>
		</button>
		<div class="spacer"></div>

		<ToggleButton side="right" isOpened={rightPanelVisible} toggle={togglePanel} label={"Toggle Settings Panel (Right Arrow)"}>
			<Gear />
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
