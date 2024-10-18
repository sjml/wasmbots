use std::sync::Mutex;

mod host_reserve;
pub mod params;
pub use host_reserve::HostReserve;

pub type TickFn = fn();
static CLIENT_TICK: Mutex<TickFn> = Mutex::new(_noop);
fn _noop() {}

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

#[no_mangle]
extern "C" fn setup(request_reserve: usize) -> usize {
    if !host_reserve::reserve_host_memory(request_reserve) {
        log_err("CLIENT ERROR: Could not allocate reserve memory");
        return 0;
    }
    let reserve = HostReserve::new();

    reserve.raw_ptr() as usize
}

pub fn register_tick_callback(cb: TickFn) {
    let mut ct = CLIENT_TICK.lock().unwrap();
    *ct = cb;
}

#[no_mangle]
extern "C" fn tick(_offset: usize) {
    let ct = CLIENT_TICK.lock().unwrap();
    ct();
}
