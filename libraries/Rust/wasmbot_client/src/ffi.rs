extern "C" {
    #[link_name = "shutdown"]
    pub fn shutdown();

	#[link_name = "logFunction"]
	pub fn log_function(log_level: i32, msg_ptr: *const u8, msg_len: usize);

	#[link_name = "getRandomInt"]
	pub fn get_random_int(min: i32, max: i32) -> i32;
}

// native placeholders to make the linker happy (will be overridden in trainer)
#[cfg(not(target_arch = "wasm32"))]
mod native_fallbacks {
	#[export_name = "shutdown"]
	extern "C" fn placeholder_shutdown() {
		println!("Native shutdown called");
	}

	#[export_name = "logFunction"]
	extern "C" fn placeholder_log_function(log_level: i32, _msg_ptr: usize, _msg_len: usize) {
		println!("Native log function called with level: {}", log_level);
	}

	#[export_name = "getRandomInt"]
	extern "C" fn placeholder_get_random_int(min: i32, max: i32) -> i32 {
		(min + max) / 2
	}
}
