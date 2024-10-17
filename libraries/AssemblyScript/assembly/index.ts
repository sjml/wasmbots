import { HostReserve } from "./hostReserve";
export { HostReserve };
export { BotMetadata, GameParameters, receiveGameParams, registerClientSetup } from "./params";


// @ts-ignore: decorator
@external("env", "logFunction")
declare function logFunction(logLevel: usize, msgPtr: usize, msgLen: usize): void;

export type TickFunction = () => void;
let CLIENT_TICK: TickFunction = () => {};

export function as_abort(msg: usize, file: usize, line: u32, col: u32): void {
    logErr(`FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
    unreachable();
}

export function log(msg: string): void {
    const msg8 = String.UTF8.encode(msg);
    logFunction(2, changetype<usize>(msg8), msg8.byteLength);
}

export function logErr(msg: string): void {
    const msg8 = String.UTF8.encode(msg);
    logFunction(0, changetype<usize>(msg8), msg8.byteLength);
}

export function setup(requestReserve: usize): usize {
    HostReserve.reserveHostMemory(requestReserve);

    return HostReserve.rawPtr;
}

export function setTickCallback(cb: TickFunction): boolean {
    CLIENT_TICK = cb;
    return true;
}

export function tick(offset: usize): void {
    CLIENT_TICK();
}
