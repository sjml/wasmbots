import * as CoreMsg from "../core/messages.ts";
import { LogLevel } from "../core/logger.ts";

export enum GuestToHostMessageType {
	InitModuleDone,
	InstantiateDone,
	RunTickDone,
	LogMessage,
}

export interface InitModuleDonePayload {
	success: boolean;
	errorMsg?: string;
}

export interface InstantiateDonePayload {
	success: boolean;
	botName: string;
	botVersion: number[];
}
export interface RunTickDonePayload {
	hadError: boolean;
	playerMove: CoreMsg.Message;
	playerMoveType: CoreMsg.MessageType;
}
export interface LogMessagePayload {
	logLevel: LogLevel;
	message: string;
}


export enum HostToGuestMessageType {
	InitModule,
	Instantiate,
	RunTick,
}

export interface InitModulePayload {
	wasmBytes: ArrayBuffer;
	wasmBytesOffset: number;
	wasmBytesLength: number;
	setupTimeLimit: number;
	tickWarnTimeLimit: number;
	tickKillTimeLimit: number;
}

export interface InstantiatePayload {
	rngSeed: number;
}
export interface RunTickPayload {
	circumstancesBuffer: Uint8Array;
}


export interface HostToGuestMessageMap {
	[HostToGuestMessageType.InitModule]: InitModulePayload;
	[HostToGuestMessageType.Instantiate]: InstantiatePayload;
	[HostToGuestMessageType.RunTick]: RunTickPayload;
}

export interface GuestToHostMessageMap {
	[GuestToHostMessageType.InitModuleDone]: InitModuleDonePayload;
	[GuestToHostMessageType.InstantiateDone]: InstantiateDonePayload;
	[GuestToHostMessageType.LogMessage]: LogMessagePayload;
	[GuestToHostMessageType.RunTickDone]: RunTickDonePayload;
}


export type HostToGuestMessage<T extends HostToGuestMessageType> = {
	type: T;
	payload: HostToGuestMessageMap[T];
}

export type GuestToHostMessage<T extends GuestToHostMessageType> = {
	type: T;
	payload: GuestToHostMessageMap[T];
}

