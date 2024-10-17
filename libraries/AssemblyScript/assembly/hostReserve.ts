import { log } from ".";

export class HostReserve {
    private static MEMORY: Uint8Array = new Uint8Array(0);
    private static MEMORY_DV: DataView = new DataView(HostReserve.MEMORY.buffer);

    static reserveHostMemory(size: usize): void {
        if (HostReserve.MEMORY.byteLength > 0) {
            // TODO: fail loudly
        }
        HostReserve.MEMORY = new Uint8Array(size as i32);
        HostReserve.MEMORY_DV = new DataView(HostReserve.MEMORY.buffer);
    }

    static get length(): usize {
        return HostReserve.MEMORY.byteLength;
    }

    static get rawPtr(): usize {
        return HostReserve.MEMORY.dataStart;
    }

    static write_string(offset: usize, msg: string): usize {
        const msg8 = String.UTF8.encode(msg);
        const msg8a = Uint8Array.wrap(msg8);
        HostReserve.MEMORY.set(msg8a, offset);
        return offset + msg8.byteLength;
    }

    static write_u8(offset: usize, value: u8): usize {
        HostReserve.MEMORY[offset as i32] = value;
        return offset + 1;
    }

    static write_i8(offset: usize, value: i8): usize {
        HostReserve.MEMORY[offset] = value < 0 ? value + 256 : value;
        return offset + 1;
    }

    static write_u16(offset: usize, value: u16): usize {
        HostReserve.MEMORY_DV.setUint16(offset as i32, value, true);
        return offset + 2;
    }

    static write_i16(offset: usize, value: i16): usize {
        HostReserve.MEMORY_DV.setInt16(offset as i32, value, true);
        return offset + 2;
    }

    static write_u32(offset: usize, value: u32): usize {
        HostReserve.MEMORY_DV.setUint32(offset as i32, value, true);
        return offset + 4;
    }

    static write_i32(offset: usize, value: i32): usize {
        HostReserve.MEMORY_DV.setInt32(offset as i32, value, true);
        return offset + 4;
    }

    static write_u64(offset: usize, value: u64): usize {
        HostReserve.MEMORY_DV.setUint64(offset as i32, value, true);
        return offset + 8;
    }

    static write_i64(offset: usize, value: i64): usize {
        HostReserve.MEMORY_DV.setInt64(offset as i32, value, true);
        return offset + 8;
    }


    static read_string(offset: usize, len: usize): string {
        const slice = HostReserve.MEMORY.subarray(offset, offset+len);
        return String.UTF8.decode(slice, false);
    }

    static read_u8(offset: usize): u8 {
        return HostReserve.MEMORY_DV.getUint8(offset as i32);
    }

    static read_i8(offset: usize): i8 {
        return HostReserve.MEMORY_DV.getInt8(offset as i32);
    }

    static read_u16(offset: usize): u16 {
        return HostReserve.MEMORY_DV.getUint16(offset as i32, true);
    }

    static read_i16(offset: usize): i16 {
        return HostReserve.MEMORY_DV.getInt16(offset as i32, true);
    }

    static read_u32(offset: usize): u32 {
        return HostReserve.MEMORY_DV.getUint32(offset as i32, true);
    }

    static read_i32(offset: usize): i32 {
        return HostReserve.MEMORY_DV.getInt32(offset as i32, true);
    }

    static read_u64(offset: usize): u64 {
        return HostReserve.MEMORY_DV.getUint64(offset as i32, true);
    }

    static read_i64(offset: usize): i64 {
        return HostReserve.MEMORY_DV.getInt64(offset as i32, true);
    }
}
