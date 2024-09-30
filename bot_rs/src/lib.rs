static mut HOST_RESERVE: Vec<u8> = Vec::new();

extern "C" {
    #[link_name = "logFunction"]
    fn host_log_function(msg_ptr: usize, msg_len: usize);
}

fn get_host_reserve_len() -> usize {
    unsafe {
        return HOST_RESERVE.len();
    }
}

fn read_host_byte(offset: usize) -> u8 {
    unsafe {
        return HOST_RESERVE[offset];
    }
}

fn write_host_bytes(offset: usize, bytes: &[u8]) {
    unsafe {
        HOST_RESERVE[offset..offset+bytes.len()].clone_from_slice(bytes);
    }
}

fn log(msg: &str) {
    unsafe {
        host_log_function(msg.as_ptr() as usize, msg.len() as usize);
    }
}

#[no_mangle]
pub extern "C" fn setup(request_reserve: usize) -> usize {
    log("Rust -> wasm reporting!");
    let msg = format!("Reserving space for {} bytes.", request_reserve);
    log(&msg);
    unsafe {
        HOST_RESERVE.resize(request_reserve, 0);
        HOST_RESERVE.as_mut_ptr() as usize
    }
}

// not efficient, you know
fn fib(n: u64) -> u64 {
    if n < 2 {
        n
    }
    else {
        fib(n-2) + fib(n-1)
    }
}

#[no_mangle]
pub extern "C" fn runFib(offset: usize, result: usize) -> bool {
    if result + std::mem::size_of::<u64>() > get_host_reserve_len() {
        log("Invalid result offset");
        return false;
    }
    if offset > get_host_reserve_len() {
        log("Invalid offset");
        return false;
    }
    let n = read_host_byte(offset);
    if n > 93 {
        log("Fib index too high");
        return false;
    }

    let fib_num = fib(n.into());
    let fib_num_bytes = fib_num.to_le_bytes();
    write_host_bytes(result, &fib_num_bytes);
    true
}
