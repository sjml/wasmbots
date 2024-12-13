import { CoreMsg, log, logErr } from ".";
import { HostReserve } from "./hostReserve";

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: i32 = 26; // should be usize, but this causes fewer complaints

export class BotMetadata {
	name: string;
	botVersion: StaticArray<u16>;

	constructor(name: string, botVersion: u16[]) {
		this.name = name;
		if (botVersion.length != 3) {
			throw new Error("RUNTIME ERROR: Invalid bot version; must match semver major.minor.patch");
		}
		this.botVersion = StaticArray.fromArray(botVersion);
	}
}

export type ClientSetupFunction = () => BotMetadata;
let CLIENT_SETUP: ClientSetupFunction = () => {
	return new BotMetadata("[INVALID]", [0,0,0]);
};

export function registerClientSetup(setup: ClientSetupFunction): void {
	CLIENT_SETUP = setup;
}

export function setup(requestReserve: usize): usize {
	HostReserve.reserveHostMemory(requestReserve);

	const botData = CLIENT_SETUP();

	let offset = 0;
	const name8 = String.UTF8.encode(botData.name);
	const name8a = Uint8Array.wrap(name8);
	const reserveBytes = HostReserve.byteArray
	reserveBytes.set(name8a, offset);
	offset += name8.byteLength;
	while (offset < MAX_NAME_LEN) {
		reserveBytes[offset] = 0;
		offset += 1;
	}
	const reserveDV = HostReserve.dataView;
	for (let vei = 0; vei < botData.botVersion.length; vei++) {
		reserveDV.setUint16(offset, botData.botVersion[vei], true);
		offset += 2;
	}

	return HostReserve.rawPtr;
}


export type ClientReceiveGameParamsFunction = (initParams: CoreMsg.InitialParameters) => boolean;
let CLIENT_RECEIVE_GAME_PARAMS: ClientReceiveGameParamsFunction = (_: CoreMsg.InitialParameters) => {
	logErr("no ClientReceiveGameParamsFunction set!");
	return true;
};

export function registerClientReceiveGameParams(cb: ClientReceiveGameParamsFunction): void {
	CLIENT_RECEIVE_GAME_PARAMS = cb;
}

export function receiveGameParams(offset: usize): boolean {
	const readDV = new DataView(HostReserve.arrayBuffer, offset as u32, (HostReserve.length - offset) as u32);
	const initParams = CoreMsg.InitialParameters.fromBytes(readDV);

	if (initParams.paramsVersion != GP_VERSION) {
		logErr(`ERROR: Can't parse GameParams v${initParams.paramsVersion}; only prepared for v${GP_VERSION}`);
		return false;
	}

	return CLIENT_RECEIVE_GAME_PARAMS(initParams);
}
