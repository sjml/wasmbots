export enum LogLevel {
    Error = "error",
    Warn = "warn",
    Log = "log",
    Info = "info",
    Debug = "debug",
}

export type LogFunction = (level: LogLevel, message: string) => void;

// subset of lib.dom.ts's Console interface
export interface ILogger {
    debug(...data: any[]): void;
    error(...data: any[]): void;
    info(...data: any[]): void;
    log(...data: any[]): void;
    warn(...data: any[]): void;
}
