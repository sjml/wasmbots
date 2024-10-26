import { LogLevel } from "../core/logger.ts";

export function log(level: LogLevel, msg: string) {
    switch (level) {
        case LogLevel.Error:
            console.error(msg);
            break;
        case LogLevel.Warn:
            console.warn(msg);
            break;
        case LogLevel.Log:
            console.log(msg);
            break;
        case LogLevel.Info:
            console.info(msg);
            break;
        case LogLevel.Debug:
            console.debug(msg);
            break;
    }
}

export function nullLog(_level: LogLevel, _msg: string) {};
