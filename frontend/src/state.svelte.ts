import { World } from "./engine/game/world";
import { Player } from "./engine/game/player";

import { WasmBotsVisualizer } from "./vis/game";

export interface WasmBotsState {
    world: World|null;
    players: Player[];

    vis: WasmBotsVisualizer|null;
}
