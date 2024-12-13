import { HostReserve } from "./hostReserve";
export { HostReserve };
export * from "./params";
import * as CoreMsg from "./wasmbot_messages";
export { CoreMsg };

// @ts-ignore: decorator
@external("env", "logFunction")
declare function hostLogFunction(logLevel: usize, msgPtr: usize, msgLen: usize): void;

// @ts-ignore: decorator
@external("env", "getRandomInt")
declare function hostGetRandomInt(min: i32, max: i32): i32;


export type TickFunction = (pc: CoreMsg.PresentCircumstances) => CoreMsg.Message;
let CLIENT_TICK: TickFunction = (_: CoreMsg.PresentCircumstances): CoreMsg.Message => {
	const err = new CoreMsg._Error();
	err.description = "No client tick function registered";
	return err;
};

export function as_abort(msg: usize, file: usize, line: u32, col: u32): void {
	logErr(`ASSEMBLYSCRIPT FATAL ERROR: ${file}:${line}:${col}\n${msg}`);
	unreachable();
}

export function log(msg: string): void {
	const msg8 = String.UTF8.encode(msg);
	hostLogFunction(2, changetype<usize>(msg8), msg8.byteLength);
}

export function logErr(msg: string): void {
	const msg8 = String.UTF8.encode(msg);
	hostLogFunction(0, changetype<usize>(msg8), msg8.byteLength);
}

export function getRandomInt(min: i32, max:i32): i32 {
	return hostGetRandomInt(min, max);
}

export function registerTickCallback(cb: TickFunction): boolean {
	CLIENT_TICK = cb;
	return true;
}

export function tick(offset: u32): void {
	const readDV = new DataView(HostReserve.arrayBuffer, offset as u32, (HostReserve.length - offset) as u32);
	const pc = CoreMsg.PresentCircumstances.fromBytes(readDV);

	const submittedMove = CLIENT_TICK(pc);

	const writeDV = HostReserve.dataView;
	submittedMove.writeBytes(writeDV, true);
}
