use std::sync::OnceLock;

mod host_reserve;
mod params;
pub use host_reserve::HostReserve;
pub use params::GameParameters;

pub type TickFn = fn();
static CLIENT_TICK: OnceLock<TickFn> = OnceLock::new();

extern "C" {
    #[link_name = "logFunction"]
    fn host_log_function(log_level: i32, msg_ptr: usize, msg_len: usize);
}

pub fn log(msg: &str) {
    unsafe {
        host_log_function(2, msg.as_ptr() as usize, msg.len() as usize);
    }
}
pub fn log_err(msg: &str) {
    unsafe {
        host_log_function(0, msg.as_ptr() as usize, msg.len() as usize);
    }
}

pub fn set_tick_callback(cb: TickFn) -> bool {
    match CLIENT_TICK.set(cb) {
        Ok(_) => true,
        Err(_) => {
            log_err("CLIENT ERROR: Tick callback already registered");
            false
        },
    }
}

#[no_mangle]
extern "C" fn setup(request_reserve: usize) -> usize {
    host_reserve::reserve_host_memory(request_reserve);
    let mut reserve = host_reserve::HostReserve::new();

    let version_str = env!("CARGO_PKG_VERSION");
    let mut version_parts = version_str.split('.');
    if version_parts.clone().count() != 3 {
        log_err("CLIENT ERROR: version must be semver");
        return 0;
    }
    let major = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");
    let minor = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");
    let patch = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");
    let version = vec![major, minor, patch];

    const MAX_NAME_LEN: usize = 26;
    let name = env!("CARGO_PKG_NAME");
    let mut offset = 0;
    reserve.write_string(0, name);
    offset += MAX_NAME_LEN;
    version.iter().for_each(|ve| {
        offset = reserve.write_u16(offset, *ve);
    });

    reserve.raw_ptr() as usize
}

#[no_mangle]
extern "C" fn tick(_offset: usize) {
    if let Some(tick_fn) = CLIENT_TICK.get() {
        tick_fn();
    }
}
