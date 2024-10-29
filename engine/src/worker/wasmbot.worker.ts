import config from "../core/config.ts";
import * as Msg from "./messages.ts";
import * as CoreMsg from "../core/messages.ts";
import { GuestProgram } from "../core/guest.ts";
import { validateWasm } from "../core/validator.ts";
import { LogLevel, type ILogger } from "../core/logger.ts";

let module!: WebAssembly.Module;
let program!: GuestProgram;
let logger!: Logger;

class Logger implements ILogger {
    error(...data: any[]): void {
        self.postMessage({
            type: Msg.GuestToHostMessageType.LogMessage,
            payload: {
                logLevel: LogLevel.Error,
                message: data.join(" "),
            }
        });
    }
    warn(...data: any[]): void {
        self.postMessage({
            type: Msg.GuestToHostMessageType.LogMessage,
            payload: {
                logLevel: LogLevel.Warn,
                message: data.join(" "),
            }
        });
    }
    log(...data: any[]): void {
        self.postMessage({
            type: Msg.GuestToHostMessageType.LogMessage,
            payload: {
                logLevel: LogLevel.Log,
                message: data.join(" "),
            }
        });
    }
    info(...data: any[]): void {
        self.postMessage({
            type: Msg.GuestToHostMessageType.LogMessage,
            payload: {
                logLevel: LogLevel.Info,
                message: data.join(" "),
            }
        });
    }
    debug(...data: any[]): void {
        self.postMessage({
            type: Msg.GuestToHostMessageType.LogMessage,
            payload: {
                logLevel: LogLevel.Debug,
                message: data.join(" "),
            }
        });
    }
}

async function initModule(payload: Msg.InitModulePayload) {
    const progArray = new Uint8Array(payload.wasmBytes, payload.wasmBytesOffset, payload.wasmBytesLength);
    try {
        module = await WebAssembly.compile(progArray);
    }
    catch (err) {
        self.postMessage({
            type: Msg.GuestToHostMessageType.InitModuleDone,
            payload: {
                success: false,
                errorMsg: `Buffer is not valid WebAssembly: ${err}`,
            } as Msg.InitModuleDonePayload
        });
        return;
    }
    logger = new Logger();
    if (!await validateWasm(payload.wasmBytes, logger)) {
        self.postMessage({
            type: Msg.GuestToHostMessageType.InitModuleDone,
            payload: {
                success: false,
                errorMsg: `Invalid guest program`,
            } as Msg.InitModuleDonePayload
        });
        return;
    }
    self.postMessage({
        type: Msg.GuestToHostMessageType.InitModuleDone,
        payload: {
            success: true,
        } as Msg.InitModuleDonePayload
    });
}

async function instantiate(payload: Msg.InstantiatePayload) {
    program = new GuestProgram(logger, payload.rngSeed);
    const initSuccess = await program.init(module);
    if (!initSuccess) {
        self.postMessage({
            type: Msg.GuestToHostMessageType.InstantiateDone,
            payload: {
                success: false,
            } as Msg.InstantiateDonePayload
        });
        return;
    }
    const ready = program.runSetup(config.memorySize);
    self.postMessage({
        type: Msg.GuestToHostMessageType.InstantiateDone,
        payload: {
            success: ready,
        } as Msg.InstantiateDonePayload
    });
}

async function runTick(payload: Msg.RunTickPayload) {
    // reconstruct the full message object from its properties
    //   after it was serialized to cross the Web Worker barrier
    const workerCirc = new CoreMsg.GameCircumstances();
    Object.assign(workerCirc, payload.circumstances);

    const moveByte = program.runTick(workerCirc);
    self.postMessage({
        type: Msg.GuestToHostMessageType.RunTickDone,
        payload: {
            hadError: program.isShutDown,
            moveByte: moveByte,
        } as Msg.RunTickDonePayload,
    });
}


self.onmessage = (evt: MessageEvent<Msg.HostToGuestMessage<Msg.HostToGuestMessageType>>) => {
    const { type, payload } = evt.data;
    switch (type) {
        case Msg.HostToGuestMessageType.InitModule:
            initModule(payload as Msg.InitModulePayload);
            break;
        case Msg.HostToGuestMessageType.Instantiate:
            instantiate(payload as Msg.InstantiatePayload);
            break;
        case Msg.HostToGuestMessageType.RunTick:
            runTick(payload as Msg.RunTickPayload);
            break;
    }
}
