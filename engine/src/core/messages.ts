// This file was automatically generated by Beschi v0.2.0
// <https://github.com/sjml/beschi>
// Do not edit directly.


const _textDec = new TextDecoder('utf-8');
const _textEnc = new TextEncoder();

export class DataAccess {
    buffer: DataView;
    currentOffset: number;

    constructor(buffer: ArrayBuffer|DataView) {
        this.currentOffset = 0;
        if (buffer instanceof ArrayBuffer) {
            this.buffer = new DataView(buffer);
        }
        else {
            this.buffer = buffer;
        }
    }

    isFinished(): boolean {
        return this.currentOffset >= this.buffer.byteLength;
    }

    getByte(): number {
        const ret = this.buffer.getUint8(this.currentOffset);
        this.currentOffset += 1;
        return ret;
    }

    getBool(): boolean {
        return this.getByte() > 0;
    }

    getInt16(): number {
        const ret = this.buffer.getInt16(this.currentOffset, true);
        this.currentOffset += 2;
        return ret;
    }

    getUint16(): number {
        const ret = this.buffer.getUint16(this.currentOffset, true);
        this.currentOffset += 2;
        return ret;
    }

    getInt32(): number {
        const ret = this.buffer.getInt32(this.currentOffset, true);
        this.currentOffset += 4;
        return ret;
    }

    getUint32(): number {
        const ret = this.buffer.getUint32(this.currentOffset, true);
        this.currentOffset += 4;
        return ret;
    }

    getInt64(): bigint {
        const ret = this.buffer.getBigInt64(this.currentOffset, true);
        this.currentOffset += 8;
        return ret;
    }

    getUint64(): bigint {
        const ret = this.buffer.getBigUint64(this.currentOffset, true);
        this.currentOffset += 8;
        return ret;
    }

    getFloat32(): number {
        const ret = this.buffer.getFloat32(this.currentOffset, true);
        this.currentOffset += 4;
        return Math.fround(ret);
    }

    getFloat64(): number {
        const ret = this.buffer.getFloat64(this.currentOffset, true);
        this.currentOffset += 8;
        return ret;
    }

    getString(): string {
        const len = this.getByte();
        const strBuffer = new Uint8Array(this.buffer.buffer, this.currentOffset, len);
        this.currentOffset += len;
        return _textDec.decode(strBuffer);
    }


    setByte(val: number) {
        this.buffer.setUint8(this.currentOffset, val);
        this.currentOffset += 1;
    }

    setBool(val: boolean) {
        this.setByte(val ? 1 : 0);
    }

    setInt16(val: number) {
        this.buffer.setInt16(this.currentOffset, val, true);
        this.currentOffset += 2;
    }

    setUint16(val: number) {
        this.buffer.setUint16(this.currentOffset, val, true);
        this.currentOffset += 2;
    }

    setInt32(val: number) {
        this.buffer.setInt32(this.currentOffset, val, true);
        this.currentOffset += 4;
    }

    setUint32(val: number) {
        this.buffer.setUint32(this.currentOffset, val, true);
        this.currentOffset += 4;
    }

    setInt64(val: bigint) {
        this.buffer.setBigInt64(this.currentOffset, val, true);
        this.currentOffset += 8;
    }

    setUint64(val: bigint) {
        this.buffer.setBigUint64(this.currentOffset, val, true);
        this.currentOffset += 8;
    }

    setFloat32(val: number) {
        this.buffer.setFloat32(this.currentOffset, val, true);
        this.currentOffset += 4;
    }

    setFloat64(val: number) {
        this.buffer.setFloat64(this.currentOffset, val, true);
        this.currentOffset += 8;
    }

    setString(val: string) {
        const strBuffer = _textEnc.encode(val);
        this.setByte(strBuffer.byteLength);
        const arr = new Uint8Array(this.buffer.buffer);
        arr.set(strBuffer, this.currentOffset);
        this.currentOffset += strBuffer.byteLength;
    }
}

export abstract class Message {
    abstract getMessageType(): MessageType;
    abstract writeBytes(dv: DataView, tag: boolean): void;
    abstract getSizeInBytes(): number;

    static fromBytes(dv: DataView): Message | null {
        throw new Error("Cannot read abstract Message from bytes.");
    };
}

export enum MessageType {
  _ErrorType = 1,
  InitialParametersType = 2,
  PresentCircumstancesType = 3,
  WaitType = 4,
  ResignType = 5,
  MoveToType = 6,
  OpenType = 7,
  CloseType = 8,
}

export function ProcessRawBytes(dv: DataView): Message[] {
  const da = new DataAccess(dv);
  const msgList: Message[] = [];
  while (!da.isFinished()) {
    const msgType: number = da.getByte();
    switch (msgType) {
      case 0:
        return msgList;
      case MessageType._ErrorType:
        msgList.push(_Error.fromBytes(da));
        break;
      case MessageType.InitialParametersType:
        msgList.push(InitialParameters.fromBytes(da));
        break;
      case MessageType.PresentCircumstancesType:
        msgList.push(PresentCircumstances.fromBytes(da));
        break;
      case MessageType.WaitType:
        msgList.push(Wait.fromBytes(da));
        break;
      case MessageType.ResignType:
        msgList.push(Resign.fromBytes(da));
        break;
      case MessageType.MoveToType:
        msgList.push(MoveTo.fromBytes(da));
        break;
      case MessageType.OpenType:
        msgList.push(Open.fromBytes(da));
        break;
      case MessageType.CloseType:
        msgList.push(Close.fromBytes(da));
        break;
      default:
        throw new Error(`Unknown message type: ${msgType}`);
    }
  }
  return msgList;
}

export class _Error extends Message {
  description: string = "";

  getMessageType() : MessageType { return MessageType._ErrorType; }

  getSizeInBytes(): number {
    let size: number = 0;
    size += _textEnc.encode(this.description).byteLength;
    size += 1;
    return size;
  }

  static fromBytes(data: DataView|DataAccess): _Error {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const n_Error = new _Error();
      n_Error.description = da.getString();
      return n_Error;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read _Error from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType._ErrorType);
    }
    da.setString(this.description);
  }

}

export class InitialParameters extends Message {
  paramsVersion: number = 0;
  engineVersionMajor: number = 0;
  engineVersionMinor: number = 0;
  engineVersionPatch: number = 0;

  getMessageType() : MessageType { return MessageType.InitialParametersType; }

  getSizeInBytes(): number {
    return 8;
  }

  static fromBytes(data: DataView|DataAccess): InitialParameters {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nInitialParameters = new InitialParameters();
      nInitialParameters.paramsVersion = da.getUint16();
      nInitialParameters.engineVersionMajor = da.getUint16();
      nInitialParameters.engineVersionMinor = da.getUint16();
      nInitialParameters.engineVersionPatch = da.getUint16();
      return nInitialParameters;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read InitialParameters from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.InitialParametersType);
    }
    da.setUint16(this.paramsVersion);
    da.setUint16(this.engineVersionMajor);
    da.setUint16(this.engineVersionMinor);
    da.setUint16(this.engineVersionPatch);
  }

}

export class PresentCircumstances extends Message {
  lastTickDuration: number = 0;
  lastMoveSucceeded: boolean = false;
  lastMoveValid: boolean = false;
  currentHitPoints: number = 0;
  currentStatus: number = 0;
  surroundings: number[] = [];
  surroundingsRadius: number = 0;

  getMessageType() : MessageType { return MessageType.PresentCircumstancesType; }

  getSizeInBytes(): number {
    let size: number = 0;
    size += this.surroundings.length * 2;
    size += 12;
    return size;
  }

  static fromBytes(data: DataView|DataAccess): PresentCircumstances {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nPresentCircumstances = new PresentCircumstances();
      nPresentCircumstances.lastTickDuration = da.getUint32();
      nPresentCircumstances.lastMoveSucceeded = da.getBool();
      nPresentCircumstances.lastMoveValid = da.getBool();
      nPresentCircumstances.currentHitPoints = da.getUint16();
      nPresentCircumstances.currentStatus = da.getByte();
      const surroundings_Length = da.getUint16();
      nPresentCircumstances.surroundings = Array<number>(surroundings_Length);
      for (let i3 = 0; i3 < surroundings_Length; i3++) {
        nPresentCircumstances.surroundings[i3] = da.getUint16();
      }
      nPresentCircumstances.surroundingsRadius = da.getByte();
      return nPresentCircumstances;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read PresentCircumstances from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.PresentCircumstancesType);
    }
    da.setUint32(this.lastTickDuration);
    da.setBool(this.lastMoveSucceeded);
    da.setBool(this.lastMoveValid);
    da.setUint16(this.currentHitPoints);
    da.setByte(this.currentStatus);
    da.setUint16(this.surroundings.length);
    for (let i = 0; i < this.surroundings.length; i++) {
      let el = this.surroundings[i];
      da.setUint16(el);
    }
    da.setByte(this.surroundingsRadius);
  }

}

export class Wait extends Message {

  getMessageType() : MessageType { return MessageType.WaitType; }

  getSizeInBytes(): number {
    return 0;
  }

  static fromBytes(data: DataView|DataAccess): Wait {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nWait = new Wait();
      return nWait;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read Wait from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.WaitType);
    }
  }

}

export class Resign extends Message {

  getMessageType() : MessageType { return MessageType.ResignType; }

  getSizeInBytes(): number {
    return 0;
  }

  static fromBytes(data: DataView|DataAccess): Resign {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nResign = new Resign();
      return nResign;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read Resign from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.ResignType);
    }
  }

}

export class MoveTo extends Message {
  direction: number = 0;
  distance: number = 0;

  getMessageType() : MessageType { return MessageType.MoveToType; }

  getSizeInBytes(): number {
    return 2;
  }

  static fromBytes(data: DataView|DataAccess): MoveTo {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nMoveTo = new MoveTo();
      nMoveTo.direction = da.getByte();
      nMoveTo.distance = da.getByte();
      return nMoveTo;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read MoveTo from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.MoveToType);
    }
    da.setByte(this.direction);
    da.setByte(this.distance);
  }

}

export class Open extends Message {
  targetX: number = 0;
  targetY: number = 0;

  getMessageType() : MessageType { return MessageType.OpenType; }

  getSizeInBytes(): number {
    return 4;
  }

  static fromBytes(data: DataView|DataAccess): Open {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nOpen = new Open();
      nOpen.targetX = da.getInt16();
      nOpen.targetY = da.getInt16();
      return nOpen;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read Open from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.OpenType);
    }
    da.setInt16(this.targetX);
    da.setInt16(this.targetY);
  }

}

export class Close extends Message {
  targetX: number = 0;
  targetY: number = 0;

  getMessageType() : MessageType { return MessageType.CloseType; }

  getSizeInBytes(): number {
    return 4;
  }

  static fromBytes(data: DataView|DataAccess): Close {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    try {
      const nClose = new Close();
      nClose.targetX = da.getInt16();
      nClose.targetY = da.getInt16();
      return nClose;
    }
    catch (err) {
      let errMsg = "[Unknown error]";
      if (err instanceof Error) {
        errMsg = `${err.name} -- ${err.message}`;
      }
      throw new Error(`Could not read Close from offset ${da.currentOffset} (${errMsg})`);
    }
  }

  writeBytes(data: DataView|DataAccess, tag: boolean): void {
    let da: DataAccess;
    if (data instanceof DataView) {
      da = new DataAccess(data);
    }
    else {
      da = data;
    }
    if (tag) {
      da.setByte(MessageType.CloseType);
    }
    da.setInt16(this.targetX);
    da.setInt16(this.targetY);
  }

}

export const MessageTypeMap = new Map<MessageType, { new(): Message }>([
  [MessageType._ErrorType, _Error],
  [MessageType.InitialParametersType, InitialParameters],
  [MessageType.PresentCircumstancesType, PresentCircumstances],
  [MessageType.WaitType, Wait],
  [MessageType.ResignType, Resign],
  [MessageType.MoveToType, MoveTo],
  [MessageType.OpenType, Open],
  [MessageType.CloseType, Close],
]);

