import config from "../core/config.ts";

type GameParameters = {
    version: number;
    sizes: { [key: string]: number },
    layout: { doc: string, type: string }[],
}

import { default as __rawGP } from "../data/gameParameters.json" with { type: "json" };
const gameParameters: GameParameters = __rawGP;

export function writeGameParameters(buff: Uint8Array, offset: number): number {
    const origOffset = offset;
    const dv = new DataView(buff.buffer, buff.byteOffset, buff.byteLength);
    dv.setUint16(offset, gameParameters.version, true);
    offset += 2;
    dv.setUint16(offset, config.version[0], true);
    offset += 2;
    dv.setUint16(offset, config.version[1], true);
    offset += 2;
    dv.setUint16(offset, config.version[2], true);
    offset += 2;

    return offset - origOffset;
}

export function writeCircumstances(buff: Uint8Array, offset: number, lastTickDuration: number, lastMoveSucceeded: boolean) {
    const dv = new DataView(buff.buffer, buff.byteOffset, buff.byteLength);
    dv.setUint32(offset, lastTickDuration, true);
    offset += 4;
    dv.setUint8(offset, lastMoveSucceeded ? 1 : 0);
    offset += 1;
}

export function readMoveBuffer(buff: Uint8Array, offset: number): number {
    const dv = new DataView(buff.buffer, buff.byteOffset, buff.byteLength);
    const moveByte = dv.getUint8(offset);
    offset += 1;

    return moveByte;
}
