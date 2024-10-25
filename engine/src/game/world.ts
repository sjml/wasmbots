import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { WorkerStatus } from "../worker/coordinator.ts";
import { WorldMap, type Point } from "./map.ts";

// trying to build with the idea that these numbers might change,
//   but not testing that at all, so probably some lurking bugs
//   for > 2 players.
const MIN_PLAYERS = 2;
const MAX_PLAYERS = 2;

type WorldEvents = {
    gameStateChange: { newState: GameState, oldState: GameState };
    playerAdded: { newPlayer: Player };
    playerDropped: { leavingPlayer: Player };
}

export enum GameState {
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

    get gameState(): GameState {
        return this._gameState;
    }

    private setState(gs: GameState) {
        const old = this._gameState;
        this._gameState = gs;
        if (gs != old) {
            this.emit("gameStateChange", { newState: gs, oldState: old });
        }
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
            throw new Error(`Not enough spawn points in map for ${this.playerCount} players!`);
        }
        newPlayer.location = loc;

        this.emit("playerAdded", {newPlayer});
        this.checkReady();
    }

    dropPlayer(leavingPlayer: Player) {
        const idx = this._players.indexOf(leavingPlayer);
        if (idx == -1) {
            throw new Error("Player not registered!");
        }

        this._players[idx] = null;

        this.emit("playerDropped", {leavingPlayer});
        this.checkReady();
    }

    get playerCount(): number {
        return this._players.filter(p => p != null).length;
    }

    setMap(map: WorldMap) {
        if (this._gameState > GameState.Setup) {
            throw new Error("Cannot change map after game start!");
        }
        this._currentMap = map;
        this._spawnPointDeck = new Deck(this._currentMap.spawnPoints, this.rng);

        this.checkReady();
    }

    checkReady() {
        if (this.isReadyToStart()) {
            this.setState(GameState.Ready);
        }
        else {
            this.setState(GameState.Setup);
        }
    }

    isReadyToStart(): boolean {
        return (this.playerCount >= MIN_PLAYERS) && (this._currentMap != null);
    }

    startGame() {
        if (!this.isReadyToStart()) {
            throw new Error("Game is not ready yet");
        }

        this.rng.shuffle(this._players); // randomizes turn order

        this.setState(GameState.Running);
    }

    stopGame() {
        this.setState(GameState.Shutdown);
    }

    resetGame() {
        this.setState(GameState.Setup);
        this._spawnPointDeck.reset();
        for (const p of this._players) {
            if (p != null) {
                p.reset();
                const loc = this._spawnPointDeck.drawNoReshuffle();
                if (loc == null) {
                    throw new Error(`Not enough spawn points in map for ${this.playerCount} players!`);
                }
                p.location = loc;
            }
        }
        this.checkReady();
    }

    private static _playerIsValid(p: Player|null): boolean {
        return (
                p != null
            &&  (
                       p.coordinator.workerStatus == WorkerStatus.Ready
                    || p.coordinator.workerStatus == WorkerStatus.Running
                )
            && p.hitPoints > 0
        );
    }

    async runTurn(): Promise<void> {
        if (this._gameState != GameState.Running) {
            console.error("ERROR: Trying to process turn on non-running game");
            return;
        }

        for (const player of this._players) {
            if (player == null) { continue; }
            if (World._playerIsValid(player)) {
                await player.processTurn();
            }
        }

        const playersAlive = this._players.filter(p => World._playerIsValid(p));
        if (playersAlive.length == 1) {
            // winner winner
            // TODO: report winners and losers
            this.setState(GameState.Shutdown);
        }
        else if (playersAlive.length == 0) {
            // errybody dead
            this.setState(GameState.Shutdown);
        }
    }
}
