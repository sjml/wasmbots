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
    let msg = format!("Reserving space for {} bytes.", request_reserve);
    log(&msg);
    unsafe {
        HOST_RESERVE.resize(request_reserve, 0);
    }

    let version_str = env!("CARGO_PKG_VERSION");
    let mut version_parts = version_str.split('.');
    let major: u32 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let minor: u32 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let patch: u32 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let version = vec![major, minor, patch];

    const MAX_NAME_LEN: usize = 20;
    let name = env!("CARGO_PKG_NAME");
    let name_len = std::cmp::min(MAX_NAME_LEN, name.len());
    let mut offset = 0;
    unsafe {
        HOST_RESERVE[offset..offset+name_len].clone_from_slice(&name.as_bytes()[0..name_len]);
        HOST_RESERVE[name_len..MAX_NAME_LEN].fill(0);
    }
    offset += MAX_NAME_LEN;
    version.iter().for_each(|ve| {
        let bytes = ve.to_le_bytes();
        unsafe {
            HOST_RESERVE[offset..offset+std::mem::size_of::<u32>()].clone_from_slice(&bytes);
        }
        offset += std::mem::size_of::<u32>()
    });

    unsafe {
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
    write_host_bytes(result, &fib_num.to_le_bytes());
    true
}
