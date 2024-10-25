// I know stores are deprecated but this feels better than passing objects and
//   functions all the way up and down the UI chain.
//   .......... for now.

import { writable } from "svelte/store";

import { World } from "./engine/game/world";

export const globalWorld = writable<World>();
