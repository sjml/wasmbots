extern "C" {
    #[link_name = "logFunction"]
    fn log_function(msg_ptr: usize, msg_len: usize);
}

#[no_mangle]
pub extern "C" fn run() {
    let msg = "Rust -> wasm reporting!";
    unsafe {
        log_function(msg.as_ptr() as usize, msg.len() as usize);
    }
}
