@external("env", "logFunction")
declare function logFunction(msgPtr: usize, msgLen: usize): void;

var HOST_RESERVE = new Uint8Array(0);

function log(msg: string): void {
    const msg8 = String.UTF8.encode(msg);
    logFunction(changetype<usize>(msg8), msg8.byteLength);
}

export function setup(requestReserve: usize): usize {
    log("AssemblyScript -> wasm reporting!");
    const msg = `Reserving space for ${requestReserve} bytes.`;
    log(msg);
    HOST_RESERVE = new Uint8Array(requestReserve as i32);
    return HOST_RESERVE.dataStart;
}

function fib(n: u64): u64 {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}

export function runFib(offset: usize, result: usize): boolean {
    if (result + sizeof<u64>() > (HOST_RESERVE.byteLength as usize)) {
        log("Invalid result offset");
        return false;
    }
    if (offset > (HOST_RESERVE.byteLength as usize)) {
        log("Invalid offset");
        return false;
    }
    const n = HOST_RESERVE[offset as i32];
    if (n > 93) {
        log("Fib index too high");
        return false;
    }

    const fibNum = fib(n);
    const dv = new DataView(HOST_RESERVE.buffer);
    dv.setUint64(result as i32, fibNum, true);
    return true;
}
