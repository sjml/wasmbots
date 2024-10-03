
// subset of lib.dom.ts's Console interface
export interface ILogger {
    assert(condition?: boolean, ...data: any[]): void;
    clear(): void;
    debug(...data: any[]): void;
    error(...data: any[]): void;
    info(...data: any[]): void;
    log(...data: any[]): void;
    warn(...data: any[]): void;
}
