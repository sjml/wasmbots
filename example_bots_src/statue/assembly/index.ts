export { setup, tick, receiveGameParams } from "wasmbot_client/assembly";
import * as wasmbots from "wasmbot_client/assembly";

// as with zig, would be nice to be able to pull from
//   the build config, but alack
const BOT_NAME = "statue";
const VERSION: u16[] = [0, 1, 0];


export function clientInitialize(): void {
	wasmbots.registerClientSetup(clientSetup);
	wasmbots.registerClientReceiveGameParams(receiveGameParams);
	wasmbots.registerTickCallback(tick);
}

function clientSetup(): wasmbots.BotMetadata {
	const botMeta = new wasmbots.BotMetadata(BOT_NAME, VERSION);
	return botMeta;
}

function receiveGameParams(_: wasmbots.CoreMsg.InitialParameters): boolean {
	return true; // just happy to be here
}

const idleThoughts: string[] = [
	"Just waiting around.",
	"Hangin’ out.",
	"Contemplating.",
	"Watching life go by.",
	"Peak stillness achieved.",
	"#lifegoals",
	"Won the staring contest again.",
];

let turnsSinceThought = 0;
let turnCount = 0;

function tick(pc: wasmbots.CoreMsg.PresentCircumstances): wasmbots.CoreMsg.Message {
	turnCount += 1;
	turnsSinceThought += 1;
	const dieRoll = wasmbots.getRandomInt(0, 200);
	if (dieRoll < (turnsSinceThought * turnsSinceThought) / 300) {
		turnsSinceThought = 0;
		const thoughtIdx = wasmbots.getRandomInt(0, idleThoughts.length);
		wasmbots.log(`Turn ${turnCount}: ${idleThoughts[thoughtIdx]}`);
	}
	return new wasmbots.CoreMsg.Wait();
}
