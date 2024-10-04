import config from "../core/config.ts";

type GameParameters = {
    version: number;
    sizes: { [key: string]: number },
    layout: { doc: string, type: string }[],
}

import { default as __rawGP } from "../../rsc/data/circumstances.json" with { type: "json" };
const gameParameters: GameParameters = __rawGP;

export function writegameParameters(buff: Uint8Array, offset: number) {
    const dv = new DataView(buff.buffer, buff.byteOffset, buff.byteLength);
    dv.setUint16(offset, gameParameters.version, true);
    offset += 2;
    dv.setUint16(offset, config.version[0], true);
    offset += 2;
    dv.setUint16(offset, config.version[1], true);
    offset += 2;
    dv.setUint16(offset, config.version[2], true);
    offset += 2;
}

export function writeCircumstances(buff: Uint8Array, offset: number, lastTickDuration: number) {
    const dv = new DataView(buff.buffer, buff.byteOffset, buff.byteLength);
    dv.setUint32(offset, lastTickDuration, true);
    offset += 4;
}
