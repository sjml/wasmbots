import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { WorldMap, type Point } from "./map.ts";

// trying to build with the idea that these numbers might change,
//   but not testing that at all, so probably some lurking bugs
//   for > 2 players.
const MIN_PLAYERS = 2;
const MAX_PLAYERS = 2;

type WorldEvents = {
    readinessChange: { isReady: boolean };
    playerAdded: { newPlayer: Player };
    playerDropped: { leavingPlayer: Player };
}

enum GameState {
    Setup,
    Ready,
    Running,
    Shutdown,
}

export class World extends EventTarget {
    private _gameState: GameState = GameState.Setup;
    private _players: (Player|null)[] = Array(MAX_PLAYERS).fill(null);
    private _currentMap: WorldMap | null;
    rng: RNG;
    private _spawnPointDeck: Deck<Point>;

    constructor(randomSeed: string | null) {
        super();
        this.rng = new RNG(randomSeed);
        this._spawnPointDeck = new Deck([{x: -1, y: -1}], this.rng);
        this._currentMap = null;
    }

    emit<K extends keyof WorldEvents>(
        type: K, detail: WorldEvents[K]
    ) {
        this.dispatchEvent(new CustomEvent(type, { detail }));
    }

    on<K extends keyof WorldEvents>(
        type: K,
        callback: (evt: CustomEvent<WorldEvents[K]>) => void
    ) {
        this.addEventListener(type, callback as EventListener);
    }

    get isRunning(): boolean {
        return this._gameState == GameState.Running;
    }

    registerPlayer(newPlayer: Player) {
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

        const loc = this._spawnPointDeck.drawNoReshuffle();
        if (loc == null) {
            throw new Error(`Not enough spawn points in map for ${this.playerCount} players!`)
        }
        newPlayer.location = loc;

        console.log("Registered player", this.playerCount);
        this.emit("playerAdded", {newPlayer});
        this.checkReady();
    }

    dropPlayer(leavingPlayer: Player) {
        const idx = this._players.indexOf(leavingPlayer);
        if (idx == -1) {
            throw new Error("Player not registered!");
        }

        console.log("Dropping player", idx+1);
        this._players[idx] = null;

        this.emit("playerDropped", {leavingPlayer});
        this.checkReady();
    }

    get playerCount(): number {
        return this._players.filter(p => p != null).length;
    }

    setMap(map: WorldMap) {
        if (this._gameState >= GameState.Running) {
            throw new Error("Cannot change map during running game!");
        }
        this._currentMap = map;
        this._spawnPointDeck = new Deck(this._currentMap.spawnPoints, this.rng);

        this.checkReady();
    }

    checkReady() {
        if (this.isReadyToStart()) {
            this._gameState = GameState.Ready;
        }
        else {
            this._gameState = GameState.Setup;
        }
        this.emit("readinessChange", {isReady: this._gameState == GameState.Ready});
    }

    isReadyToStart(): boolean {
        return (this.playerCount >= MIN_PLAYERS) && (this._currentMap != null);
    }

    startGame() {
        if (!this.isReadyToStart()) {
            throw new Error("Game is not ready yet");
        }
        console.log("starting game!");

        this._gameState = GameState.Running;
        this.rng.shuffle(this._players); // randomizes turn order
    }

    async runTurn(): Promise<void> {
        if (this._gameState != GameState.Running) {
            console.error("ERROR: Trying to process turn on non-running game");
            return;
        }

        for (const player of this._players) {
            if (player == null) { continue; }
            if (player.hitPoints > 0) {
                await player.processTurn();
            }
        }

        const playersAlive = this._players.filter(p => p && p.hitPoints > 0);
        if (playersAlive.length == 1) {
            // winner winner
            // TODO: report winners and losers
            this._gameState = GameState.Shutdown;
        }
    }
}
