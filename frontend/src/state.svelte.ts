import { World } from "./engine/game/world";
import { Player } from "./engine/game/player";

import { WasmBotsVisualizer } from "./vis/game";

interface WasmBotsUIState {
    world: World|null;
    leftPlayer: Player|null;
    rightPlayer: Player|null;

    vis: WasmBotsVisualizer|null;
}

export const globalState: WasmBotsUIState = $state({
    world: null,
    leftPlayer: null,
    rightPlayer: null,
    vis: null,
});

