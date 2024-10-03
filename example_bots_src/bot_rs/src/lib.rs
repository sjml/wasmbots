static mut HOST_RESERVE: Vec<u8> = Vec::new();

const GP_VERSION: u16 = 7;

extern "C" {
    #[link_name = "logFunction"]
    fn host_log_function(log_level: i32, msg_ptr: usize, msg_len: usize);
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

fn read_host_u16(offset: usize) -> u16 {
    unsafe {
        let bytes: [u8; 2] = HOST_RESERVE[offset..offset+2].try_into().expect("couldn't convert to u16");
        u16::from_le_bytes(bytes)
    }
}

fn write_host_bytes(offset: usize, bytes: &[u8]) {
    unsafe {
        HOST_RESERVE[offset..offset+bytes.len()].clone_from_slice(bytes);
    }
}

fn log(msg: &str) {
    unsafe {
        host_log_function(2, msg.as_ptr() as usize, msg.len() as usize);
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
    let major: u16 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let minor: u16 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let patch: u16 = version_parts.next().unwrap_or("0").parse().unwrap_or(0);
    let version = vec![major, minor, patch];

    const MAX_NAME_LEN: usize = 26;
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
            HOST_RESERVE[offset..offset+std::mem::size_of::<u16>()].clone_from_slice(&bytes);
        }
        offset += std::mem::size_of::<u16>()
    });

    unsafe {
        HOST_RESERVE.as_mut_ptr() as usize
    }
}

#[no_mangle]
pub extern "C" fn receiveGameParams(offset: usize) -> bool {
    let gp_version = read_host_u16(offset);
    if gp_version != GP_VERSION {
        log(&format!("ERROR: Can't parse GameParams v{}; only prepared for v{}", gp_version, GP_VERSION));
        return false;
    }

    // don't care about rest

    true
}

#[no_mangle]
pub extern "C" fn tick(_offset: usize) {

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
