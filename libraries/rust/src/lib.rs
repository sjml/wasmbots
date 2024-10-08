use std::sync::OnceLock;

mod host_reserve;
pub mod params;
pub use host_reserve::HostReserve;


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
    let reserve = HostReserve::new();

    reserve.raw_ptr() as usize
}

#[no_mangle]
extern "C" fn tick(_offset: usize) {
    if let Some(tick_fn) = CLIENT_TICK.get() {
        tick_fn();
    }
}
