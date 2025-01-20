// Prefix imports to avoid conflicts with default native libs
// At least on Windows, `shutdown` conflicts with WS2_32.lib
extern "C" {
	#[link_name = "trainer_shutdown"]
	pub fn shutdown();

	#[link_name = "trainer_logFunction"]
	pub fn log_function(log_level: i32, msg_ptr: *const u8, msg_len: usize);

	#[link_name = "trainer_getRandomInt"]
	pub fn get_random_int(min: i32, max: i32) -> i32;
}

// placeholders to make the linker happy (will be overridden in trainer)
mod native_fallbacks {
	#[no_mangle]
	extern "C" fn trainer_shutdown() {
		println!("Native shutdown called");
	}

	#[no_mangle]
	extern "C" fn trainer_logFunction(log_level: i32, _msg_ptr: usize, _msg_len: usize) {
		println!("Native log function called with level: {}", log_level);
	}

	#[no_mangle]
	extern "C" fn trainer_getRandomInt(min: i32, max: i32) -> i32 {
		(min + max) / 2
	}
}
