import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { CoordinatorStatus } from "../core/coordinator.ts";
import { WorldMap } from "./map.ts";
import { type Point } from "../core/math.ts";
import * as CoreMsg from "../core/messages.ts";


function isCardinal(d: CoreMsg.Direction): boolean {
    return d == CoreMsg.Direction.East || d == CoreMsg.Direction.South || d == CoreMsg.Direction.West || d == CoreMsg.Direction.North;
}

const OFFSETS: Map<CoreMsg.Direction, Point> = new Map([
    [CoreMsg.Direction.East,      { x:  1, y:  0 }],
    [CoreMsg.Direction.Southeast, { x:  1, y:  1 }],
    [CoreMsg.Direction.South,     { x:  0, y:  1 }],
    [CoreMsg.Direction.Southwest, { x: -1, y:  1 }],
    [CoreMsg.Direction.West,      { x: -1, y:  0 }],
    [CoreMsg.Direction.Northwest, { x: -1, y: -1 }],
    [CoreMsg.Direction.North,     { x:  0, y: -1 }],
    [CoreMsg.Direction.Northeast, { x:  1, y: -1 }],
]);

export enum GameState {
    Setup,
    Ready,
    Running,
    Shutdown,
}

type WorldEvents = {
    gameStateChange: { newState: GameState, oldState: GameState };
    playerRegisterError: { rejectedPlayer: Player, reason: string; };
    playerAdded: { newPlayer: Player };
    playerDropped: { leavingPlayer: Player };
    mapChanged: { newMap: WorldMap };
}

export class World extends EventTarget {
    private _gameState: GameState = GameState.Setup;
    players: Player[] = [];
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
        if (this.currentMap == null) {
            this.emit("playerRegisterError", {
                rejectedPlayer: newPlayer,
                reason: "Need to set map before registering players!",
            });
            return;
        }

        if (this.players.includes(newPlayer)) {
            this.emit("playerRegisterError", {
                rejectedPlayer: newPlayer,
                reason: "Player already registered!",
            });
            return;
        }

        if (this.players.length >= this.currentMap.maxPlayers) {
            this.emit("playerRegisterError", {
                rejectedPlayer: newPlayer,
                reason: `Max player count for '${this.currentMap.name}' map!`,
            });
            return;
        }

        const loc = this._spawnPointDeck.drawNoReshuffle();
        if (loc == null) {
            this.emit("playerRegisterError", {
                rejectedPlayer: newPlayer,
                reason: `Not enough spawn points in map for ${this.players.length} players!`,
            });
            return;
        }
        newPlayer.spawnPoint = loc;
        newPlayer.location = newPlayer.spawnPoint;

        this.players.push(newPlayer);

        this.emit("playerAdded", {newPlayer});
        this.checkReady();
    }

    dropPlayer(leavingPlayer: Player) {
        const idx = this.players.indexOf(leavingPlayer);
        if (idx == -1) {
            throw new Error("Player not registered!");
        }

        this.players.splice(idx, 1);
        this._spawnPointDeck.restoreItem(leavingPlayer.spawnPoint);

        this.emit("playerDropped", {leavingPlayer});
        this.checkReady();
    }

    async setMap(mapName: string) {
        if (this._gameState > GameState.Ready) {
            throw new Error("Cannot change map after game start!");
        }

        const newMap = await WorldMap.loadTiled(mapName);

        // handle potential player changes
        if (this.currentMap) {
            const diff = this.players.length - newMap.maxPlayers;
            if (diff > 0) {
                console.log(`dropping ${diff} players...`);
                const booted = this.rng.pick(this.players, diff);
                for (const b of booted) {
                    this.dropPlayer(b);
                }
            }
        }

        this._spawnPointDeck = new Deck(newMap.spawnPoints, this.rng);

        for (const p of this.players) {
            p.reset();
            const loc = this._spawnPointDeck.drawNoReshuffle();
            if (loc == null) {
                throw new Error(`Not enough spawn points in map for ${this.players.length} players!`);
            }
            p.location = loc;
        }

        this.currentMap = newMap;
        this.emit("mapChanged", { newMap: this.currentMap });

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
        return (this.currentMap != null) && (this.players.length >= this.currentMap.minPlayers);
    }

    startGame() {
        if (!this.isReadyToStart()) {
            throw new Error("Game is not ready yet");
        }

        this.rng.shuffle(this.players); // randomize turn order

        this.setState(GameState.Running);
    }

    stopGame() {
        this.setState(GameState.Shutdown);
    }

    resetGame() {
        this.setState(GameState.Setup);
        this._spawnPointDeck.reset();
        for (const p of this.players) {
            if (p != null) {
                p.reset();
                const loc = this._spawnPointDeck.drawNoReshuffle();
                if (loc == null) {
                    throw new Error(`Not enough spawn points in map for ${this.players.length} players!`);
                }
                p.location = loc;
            }
        }
        this.checkReady();
    }

    private static _playerIsValid(p: Player): boolean {
        return (
                (
                       p.coordinator.status == CoordinatorStatus.Ready
                    || p.coordinator.status == CoordinatorStatus.Running
                )
            && p.hitPoints > 0
        );
    }

    async runTurn(): Promise<void> {
        if (this._gameState != GameState.Running) {
            console.error("ERROR: Trying to process turn on non-running game");
            return;
        }

        for (const player of this.players) {
            if (World._playerIsValid(player)) {
                const circumstances = new CoreMsg.PresentCircumstances();
                circumstances.currentHitPoints = player.hitPoints;

                // TODO: calculate line of sight and tile slice
                // https://www.roguebasin.com/index.php?title=FOV_using_recursive_shadowcasting
                circumstances.surroundingsRadius  = 2;
                circumstances.surroundings = this.currentMap!.getTileSlice(
                    player.location,
                    circumstances.surroundingsRadius,
                ).flat() || [];

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
        console.log(move);
        switch (move.getMessageType()) {
            case CoreMsg.MessageType._ErrorType:
                const errMsg = move as CoreMsg._Error;
                console.error(`Invalid move from player ${player}: ${errMsg.description}`);
                break;
            case CoreMsg.MessageType.MoveToType:
                const playerMove = move as CoreMsg.MoveTo;
                const direction = playerMove.direction as CoreMsg.Direction;
                const offset = OFFSETS.get(direction)!;
                const peekLoc = {
                    x: player.location.x + offset.x,
                    y: player.location.y + offset.y,
                };
                const peek = this.currentMap!.getTile(peekLoc.x, peekLoc.y);
                if (peek == CoreMsg.TileType.Wall || peek == CoreMsg.TileType.ClosedDoor) {
                    return false;
                }
                player.location = peekLoc;
                break;
            case CoreMsg.MessageType.WaitType:
                // no-op
                break;
            case CoreMsg.MessageType.ResignType:
                console.log("Unimplemented move: Resign")
                break;
            case CoreMsg.MessageType.OpenType:
                console.log("Unimplemented move: Open")
                break;
            case CoreMsg.MessageType.CloseType:
                console.log("Unimplemented move: Close")
                break;
            default:
                throw new Error("Invalid player move! (Should be unreachable, unless player passes wrong message type.)");
        }
        return true;
    }
}
