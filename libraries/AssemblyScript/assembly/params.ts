import { log, logErr } from ".";
import { HostReserve } from "./hostReserve";

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: i32 = 26; // should be usize, but this causes fewer complaints

export class GameParameters {
	paramsVersion: u16;
	engineVersion: StaticArray<u16>;

	constructor(paramsVersion: u16, engineVersion: u16[]) {
		if (engineVersion.length != 3) {
			throw new Error("RUNTIME ERROR: Invalid engine version; must match semver major.minor.patch");
		}
		this.paramsVersion = paramsVersion;
		this.engineVersion = StaticArray.fromArray(engineVersion);
	}
};

export class BotMetadata {
	name: StaticArray<u8>;
	botVersion: StaticArray<u16>;
	ready: boolean;

	constructor(name: string, botVersion: u16[], ready: boolean) {
		if (botVersion.length != 3) {
			throw new Error("RUNTIME ERROR: Invalid bot version; must match semver major.minor.patch");
		}
		this.botVersion = StaticArray.fromArray(botVersion);

		this.name = new StaticArray<u8>(MAX_NAME_LEN as i32);
		const name8 = String.UTF8.encode(name);
		const name8a = Uint8Array.wrap(name8);
		const nameLen = name8.byteLength > MAX_NAME_LEN ? MAX_NAME_LEN : name8.byteLength;
		for (let i = 0; i < nameLen; i++) {
			this.name[i] = name8a[i];
		}
		this.name.fill(0, nameLen);

		this.ready = ready;
	}
}



export type ClientSetupFunction = (params: GameParameters) => BotMetadata;
let CLIENT_SETUP: ClientSetupFunction | null = null;

export function registerClientSetup(setup: ClientSetupFunction): void {
	CLIENT_SETUP = setup;
}

export function receiveGameParams(offset: usize, infoOffset: usize): boolean {
	const gpVersion = HostReserve.read_u16(offset);
	offset += 2;
	if (gpVersion != GP_VERSION) {
		logErr(`ERROR: Can't parse GameParams v${gpVersion}; only prepared for v${GP_VERSION}`);
		return false;
	}

	const engineVersion: u16[] = [];
	engineVersion.push(HostReserve.read_u16(offset));
	offset += 2;
	engineVersion.push(HostReserve.read_u16(offset));
	offset += 2;
	engineVersion.push(HostReserve.read_u16(offset));
	offset += 2;

	const gp = new GameParameters(gpVersion, engineVersion);

	if (CLIENT_SETUP != null) {
		const botData = CLIENT_SETUP(gp);

		for (let idx = 0; idx < botData.name.length; idx++) {
			infoOffset = HostReserve.write_u8(infoOffset, botData.name[idx]);
		}
		for (let idx = 0; idx < botData.botVersion.length; idx++) {
			infoOffset = HostReserve.write_u16(infoOffset, botData.botVersion[idx]);
		}

		return botData.ready;
	}
	else {
		return false;
	}

}
