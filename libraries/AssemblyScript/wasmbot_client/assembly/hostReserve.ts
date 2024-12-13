export class HostReserve {
	private static MEMORY: Uint8Array = new Uint8Array(0);

	static reserveHostMemory(size: usize): void {
		if (HostReserve.MEMORY.byteLength > 0) {
			throw new Error("RUNTIME ERROR: Already reserved host memory");
		}
		HostReserve.MEMORY = new Uint8Array(size as i32);
	}

	static get length(): usize {
		return HostReserve.MEMORY.byteLength;
	}

	static get rawPtr(): usize {
		return HostReserve.MEMORY.dataStart;
	}

	static get arrayBuffer(): ArrayBuffer {
		return HostReserve.MEMORY.buffer;
	}

	static get byteArray(): Uint8Array {
		return HostReserve.MEMORY;
	}

	static get dataView(): DataView {
		return new DataView(HostReserve.MEMORY.buffer);
	}
}
