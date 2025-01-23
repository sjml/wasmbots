import Config from "../core/config.ts";
import * as CoreMsg from "../core/messages.ts";
import { CoordinatorStatus } from "../core/coordinator.ts";
import { type Point, Direction } from "../core/math.ts";
import { type DungeonBuilderOptions } from "../generation/builder.ts";
import { RNG, Deck } from "./random.ts";
import { Player } from "./player.ts";
import { WorldMap } from "./map.ts";
import { EntityIdGenerator } from "./entities.ts";

export enum GameState {
	Setup,
	Ready,
	Running,
	Shutdown,
}

type WorldEvents = {
	gameStateChange: { newState: GameState, oldState: GameState };
	worldReset: {};
	playerRegisterError: { rejectedPlayer: Player, reason: string; };
	playerAdded: { newPlayer: Player };
	playerDropped: { leavingPlayer: Player };
	mapChanged: { newMap: WorldMap };
	terrainChanged: { location: Point, newTerrain: CoreMsg.TileType, oldTerrain: CoreMsg.TileType };
}

export class World extends EventTarget {
	private _gameState: GameState = GameState.Setup;
	players: Player[] = [];
	currentMap: WorldMap | null;
	rng: RNG;
	minimumTurnTime: number;
	turnTimeBuffer: number;
	private _spawnPointDeck: Deck<Point>;

	constructor(randomSeed: string | null) {
		super();
		this.currentMap = null;
		this.rng = new RNG(randomSeed);
		EntityIdGenerator.initialize(this.rng);
		this.minimumTurnTime = Config.minimumTurnTime;
		this.turnTimeBuffer = Config.turnTimeBuffer;
		this._spawnPointDeck = new Deck([{x: -1, y: -1}], this.rng, (a: Point, b: Point) => a.x === b.x && a.y === b.y);
	}

	emit<K extends keyof WorldEvents>(
		type: K, detail: WorldEvents[K]
	) {
		this.dispatchEvent(new CustomEvent(type, { detail }));
	}

	on<K extends keyof WorldEvents>(
		type: K,
		callback: (evt: CustomEvent<WorldEvents[K]>) => void
	): () => void {
		this.addEventListener(type, callback as EventListener);
		return () => this.removeEventListener(type, callback as EventListener);
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
		newPlayer.location = loc;

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
		if (this._gameState < GameState.Running) {
			this.checkReady();
		}
	}

	async setMap(mapName: string, rng: RNG, options?: DungeonBuilderOptions) {
		if (this._gameState > GameState.Ready) {
			throw new Error("Cannot change map after game start!");
		}

		const [mapType, name] = mapName.split(":");
		let newMap: WorldMap;
		switch (mapType) {
			case "static":
				newMap = await WorldMap.loadStatic(name);
				break;
			case "dynamic":
				newMap = await WorldMap.loadDynamic(name, rng, options);
				break;
			default:
				throw new Error(`Unknown map type "${mapType}"`);
		}

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

		this._spawnPointDeck = new Deck(newMap.spawnPoints, this.rng, (a: Point, b: Point) => a.x === b.x && a.y === b.y);

		for (const p of this.players) {
			p.reset();
			const loc = this._spawnPointDeck.drawNoReshuffle();
			if (loc == null) {
				throw new Error(`Not enough spawn points in map for ${this.players.length} players!`);
			}
			p.location = loc;
			p.spawnPoint = loc;
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
		if (this.currentMap == null) {
			return false;
		}
		const validPlayers = this.players.filter(p => World._playerIsValid(p));

		return validPlayers.length >= this.currentMap.minPlayers;
	}

	startGame() {
		if (!this.isReadyToStart()) {
			throw new Error("Game is not ready yet");
		}

		this.rng.shuffle(this.players); // randomize turn order

		this.setState(GameState.Running);
		for (const p of this.players) {
			p.coordinator.status = CoordinatorStatus.Running;
		}
	}

	stopGame() {
		this.setState(GameState.Shutdown);
	}

	async resetGame() {
		this.setState(GameState.Setup);
		if (Config.asyncReset) {
			await Promise.all(this.players.map(p => p.reset()));
		}
		else {
			for (const p of this.players) {
				await p.reset();
			}
		}
		this.checkReady();
		this.emit("worldReset", {});
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
		let validPlayerCount = this.players.filter(p => World._playerIsValid(p)).length;
		if (validPlayerCount == 0) {
			console.error("ERROR: Game is still running, but no valid players");
			return;
		}

		const visualTick = this.minimumTurnTime / validPlayerCount;

		for (const player of this.players) {
			if (World._playerIsValid(player)) {
				const circumstances = new CoreMsg.PresentCircumstances();
				circumstances.currentHitPoints = player.hitPoints;

				circumstances.surroundingsRadius = this.currentMap!.viewRadius;
				const rawFOV = this.currentMap!.computeFOV(
					player.location,
					circumstances.surroundingsRadius,
					[CoreMsg.TileType.Wall, CoreMsg.TileType.ClosedDoor]
				);
				circumstances.surroundings = rawFOV.flat().map(t => t.terrainType);

				for (const otherPlayer of this.players) {
					if (otherPlayer === player) {
						continue;
					}
					const offset = {
						x: otherPlayer.location.x - player.location.x,
						y: otherPlayer.location.y - player.location.y,
					};
					if (   Math.abs(offset.x) <= circumstances.surroundingsRadius
						&& Math.abs(offset.y) <= circumstances.surroundingsRadius
					) {
						const lookup = {
							x: circumstances.surroundingsRadius + offset.x,
							y: circumstances.surroundingsRadius + offset.y,
						};
						if (rawFOV[lookup.y][lookup.x].terrainType !== CoreMsg.TileType.Void) {
							const playerEntity = new CoreMsg.Entity();
							playerEntity.id = otherPlayer.id;
							playerEntity.entityType = CoreMsg.EntityType.Player;
							playerEntity.label = otherPlayer.name;
							playerEntity.surroundingsIndex = lookup.y * rawFOV.length + lookup.x;
							playerEntity.dataByteA = 255;
							playerEntity.dataByteB = 255;
							circumstances.visibleEntities.push(playerEntity);
						}
					}
				}

				let move: CoreMsg.Message;
				try {
					move = await player.tickTurn(circumstances, visualTick);
				} catch (error) {
					console.error("Exception in player tick:", error);
					player.lastMoveStatus = CoreMsg.MoveResult.Error;
					continue;
				}

				player.lastMoveStatus = this.processMove(player, move);
				// if (player.lastMoveStatus !== CoreMsg.MoveResult.Succeeded) {
				// 	console.info(`Move did not succeed (${CoreMsg.MoveResult[player.lastMoveStatus]}):`, move);
				// }
			}
		}

		validPlayerCount = this.players.filter(p => World._playerIsValid(p)).length;
		if (validPlayerCount == 0) {
			this.stopGame();
		}
	}

	processMove(player: Player, move: CoreMsg.Message): CoreMsg.MoveResult {
		switch (move.getMessageType()) {
			case CoreMsg.MessageType._ErrorType:
				const errMsg = move as CoreMsg._Error;
				console.error(`You can't get ye flask! ${player}: ${errMsg.description}`);
				return CoreMsg.MoveResult.Error;
			case CoreMsg.MessageType.MoveToType:
				const playerMove = move as CoreMsg.MoveTo;
				const direction = Direction.from(playerMove.direction);
				if (!Config.diagonalMovement && Direction.Ordinal.includes(direction)) {
					return CoreMsg.MoveResult.Invalid;
				}
				if (playerMove.distance > player.stride) {
					return CoreMsg.MoveResult.Invalid;
				}
				const offset = direction.moveDelta;
				const peekLoc = {
					x: player.location.x + offset.x,
					y: player.location.y + offset.y,
				};
				const peek = this.currentMap!.getTile(peekLoc.x, peekLoc.y);
				if (peek.terrainType == CoreMsg.TileType.Wall || peek.terrainType == CoreMsg.TileType.ClosedDoor) {
					return CoreMsg.MoveResult.Failed;
				}
				player.location = peekLoc;
				return CoreMsg.MoveResult.Succeeded;
			case CoreMsg.MessageType.WaitType:
				// no-op
				return CoreMsg.MoveResult.Succeeded;
			case CoreMsg.MessageType.ResignType:
				player.coordinator.status = CoordinatorStatus.Shutdown;
				return CoreMsg.MoveResult.Succeeded;
			case CoreMsg.MessageType.OpenType:
				const openMove = move as CoreMsg.Open;
				const openTarget = {
					x: player.location.x + openMove.target.x,
					y: player.location.y + openMove.target.y,
				};
				const openManhattanDist =
					  Math.abs(player.location.x - openTarget.x)
					+ Math.abs(player.location.y - openTarget.y);
				if (openManhattanDist > player.openReach) {
					return CoreMsg.MoveResult.Invalid;
				}
				const openTargetTile = this.currentMap!.getTilePt(openTarget);
				if (openTargetTile.terrainType !== CoreMsg.TileType.ClosedDoor) {
					return CoreMsg.MoveResult.Invalid;
				}
				openTargetTile.terrainType = CoreMsg.TileType.OpenDoor;
				this.emit("terrainChanged", {
					location: openTarget,
					oldTerrain: CoreMsg.TileType.ClosedDoor,
					newTerrain: CoreMsg.TileType.OpenDoor
				});
				return CoreMsg.MoveResult.Succeeded;
			case CoreMsg.MessageType.CloseType:
				const closeMove = move as CoreMsg.Close;
				const closeTarget = {
					x: player.location.x + closeMove.target.x,
					y: player.location.y + closeMove.target.y,
				};
				const closeManhattanDist =
					  Math.abs(player.location.x - closeTarget.x)
					+ Math.abs(player.location.y - closeTarget.y);
				if (closeManhattanDist > player.openReach) {
					return CoreMsg.MoveResult.Invalid;
				}
				const closeTargetTile = this.currentMap!.getTilePt(closeTarget);
				if (closeTargetTile.terrainType !== CoreMsg.TileType.OpenDoor) {
					return CoreMsg.MoveResult.Invalid;
				}
				closeTargetTile.terrainType = CoreMsg.TileType.ClosedDoor;
				this.emit("terrainChanged", {
					location: closeTarget,
					oldTerrain: CoreMsg.TileType.OpenDoor,
					newTerrain: CoreMsg.TileType.ClosedDoor
				});
				return CoreMsg.MoveResult.Succeeded;
			default:
				console.error("You can't get ye flask!");
				return CoreMsg.MoveResult.Error;
		}
	}
}
