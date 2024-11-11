export enum LogLevel {
	Error = "error",
	Warn = "warn",
	Log = "log",
	Info = "info",
	Debug = "debug",
}

export type LogFunction = (level: LogLevel, message: string) => void;

export function ConsoleLogFunction(level: LogLevel, message: string): void {
	let logFn: (message?: any, ...optionalParams: any[]) => void = console.log;
	switch (level) {
		case LogLevel.Error:
			logFn = console.error
			break;
		case LogLevel.Warn:
			logFn = console.warn;
			break;
		case LogLevel.Log:
			logFn = console.log;
			break;
		case LogLevel.Info:
			logFn = console.info;
			break;
		case LogLevel.Debug:
			logFn = console.debug;
			break;
	}
	logFn(message);
}

// subset of lib.dom.ts's Console interface
export interface ILogger {
	debug(...data: any[]): void;
	error(...data: any[]): void;
	info(...data: any[]): void;
	log(...data: any[]): void;
	warn(...data: any[]): void;
}
