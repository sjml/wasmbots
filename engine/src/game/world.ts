import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { WorkerStatus } from "../worker/coordinator.ts";
import { TileType, WorldMap, type Point } from "./map.ts";
import * as CoreMsg from "../core/messages.ts";

// trying to build with the idea that these numbers might change,
//   but not testing that at all, so probably some lurking bugs
//   for > 2 players.
const MIN_PLAYERS = 1;
const MAX_PLAYERS = 10;

export enum Direction {
    East,
    Southeast,
    South,
    Southwest,
    West,
    Northwest,
    North,
    Northeast,
}

const OFFSETS: Map<Direction, Point> = new Map([
    [Direction.East,      { x:  1, y:  0 }],
    [Direction.Southeast, { x:  1, y:  1 }],
    [Direction.South,     { x:  0, y:  1 }],
    [Direction.Southwest, { x: -1, y:  1 }],
    [Direction.West,      { x: -1, y:  0 }],
    [Direction.Northwest, { x: -1, y: -1 }],
    [Direction.North,     { x:  0, y: -1 }],
    [Direction.Northeast, { x:  1, y: -1 }],
]);

export enum GameState {
    Setup,
    Ready,
    Running,
    Shutdown,
}

type WorldEvents = {
    gameStateChange: { newState: GameState, oldState: GameState };
    playerAdded: { newPlayer: Player };
    playerDropped: { leavingPlayer: Player };
    mapChanged: { newMap: WorldMap };
}

export class World extends EventTarget {
    private _gameState: GameState = GameState.Setup;
    private _players: (Player|null)[] = Array(MAX_PLAYERS).fill(null);
    currentMap: WorldMap | null;
    rng: RNG;
    private _spawnPointDeck: Deck<Point>;

    constructor(randomSeed: string | null) {
        super();
        this.rng = new RNG(randomSeed);
        this._spawnPointDeck = new Deck([{x: -1, y: -1}], this.rng);
        this.currentMap = null;
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

    async setMap(mapName: string) {
        if (this._gameState > GameState.Ready) {
            throw new Error("Cannot change map after game start!");
        }

        this.currentMap = await WorldMap.loadTiled(mapName);
        this.emit("mapChanged", { newMap: this.currentMap });

        this._spawnPointDeck = new Deck(this.currentMap.spawnPoints, this.rng);
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
        return (this.playerCount >= MIN_PLAYERS) && (this.currentMap != null);
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
                const circumstances = new CoreMsg.PresentCircumstances();

                const move = await player.tickTurn(circumstances);

                player.lastMoveSucceeded = this.processMove(player, move);
            }
        }

        // const playersAlive = this._players.filter(p => World._playerIsValid(p));
        // if (playersAlive.length == 1) {
        //     // winner winner
        //     // TODO: report winners and losers
        //     this.setState(GameState.Shutdown);
        // }
        // else if (playersAlive.length == 0) {
        //     // errybody dead
        //     this.setState(GameState.Shutdown);
        // }
    }

    processMove(player: Player, move: CoreMsg.Message): boolean {
        switch (move.getMessageType()) {
            case CoreMsg.MessageType._ErrorType:
                const errMsg = move as CoreMsg._Error;
                console.error(`Invalid move from player ${player}: ${errMsg.description}`);
                break;
            case CoreMsg.MessageType.MoveType:
                const playerMove = move as CoreMsg.Move;
                const direction = playerMove.direction as Direction;
                const offset = OFFSETS.get(direction)!;
                const peekLoc = {
                    x: player.location.x + offset.x,
                    y: player.location.y + offset.y,
                };
                const peek = this.currentMap!.getTile(peekLoc.x, peekLoc.y);
                if (peek == TileType.Wall) {
                    return false;
                }
                player.location = peekLoc;
                break;
            default:
                throw new Error("Invalid player move! (Should be unreachable.)");
        }
        return true;
    }
}
