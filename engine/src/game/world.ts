import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { WorldMap, type Point } from "./map.ts";

// trying to build with the idea that these numbers might change,
//   but not testing that at all, so probably some lurking bugs
//   for > 2 players.
const MIN_PLAYERS = 2;
const MAX_PLAYERS = 2;

export class World {
    private _gameRunning: boolean = false;
    private _players: Player[] = Array(MAX_PLAYERS).fill(null);
    private _rng: RNG;
    private _currentMap: WorldMap | null;

    constructor(randomSeed: string | null) {
        this._rng = new RNG(randomSeed);
        this._currentMap = null;
    }

    get isRunning(): boolean {
        return this._gameRunning;
    }

    registerPlayer(newPlayer: Player): boolean {
        if (this._players.includes(newPlayer)) {
            throw new Error("Player already registered!");
        }
        let registered = false;
        for (let i=0; i < MAX_PLAYERS; i++) {
            if (this._players[i] == null) {
                this._players[i] = newPlayer;
                registered = true;
                break;
            }
        }
        if (!registered) {
            throw new Error("Cannot register more than two players!");
        }

        if (this.playerCount < MIN_PLAYERS) {
            return false;
        }

        return true;
    }

    get playerCount(): number {
        return this._players.filter(p => p != null).length;
    }

    setMap(map: WorldMap) {
        if (this._gameRunning) {
            throw new Error("Cannot change map during running game!");
        }
        this._currentMap = map;
    }

    isReadyToStart(): boolean {
        return (this.playerCount >= MIN_PLAYERS) && (this._currentMap != null);
    }

    startGame() {
        if (!this.isReadyToStart()) {
            throw new Error("Game is not ready yet");
        }

        this._gameRunning = true;
        this._rng.shuffle(this._players); // randomizes both turn order and spawn point placement

        let spawnDeck = new Deck<Point>(this._currentMap!.spawnPoints, this._rng);
        for (const p of this._players) {
            if (p == null) { continue; }
            const loc = spawnDeck.drawNoReshuffle();
            if (loc == null) {
                throw new Error(`Not enough spawn points in map for ${this.playerCount} players!`)
            }
            p.location = loc;
        }
    }

    async runTurn(): Promise<void> {
        if (!this._gameRunning) {
            console.error("ERROR: Trying to process turn on non-running game");
            return;
        }

        for (const player of this._players) {
            if (player == null) { continue; }
            if (player.hitPoints > 0) {
                await player.processTurn();
            }
        }

        const playersAlive = this._players.filter(p => p.hitPoints > 0);
        if (playersAlive.length == 1) {
            // winner winner
            // TODO: report winners and losers
            this._gameRunning = false;
        }
    }
}
