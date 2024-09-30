#[link(wasm_import_module = "env")]
extern "C" {
    pub static mut memory: *mut u8;
}

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

#[no_mangle]
pub extern "C" fn modmem() {
    unsafe {
        let write_slice = std::slice::from_raw_parts_mut(memory, 8);

        write_slice[1] =  16;
        write_slice[3] =  32;
        write_slice[5] =  64;
        write_slice[7] = 128;
    }
}
