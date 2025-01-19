extern "C" {
	#[link_name = "shutdown"]
	pub fn shutdown();

	#[link_name = "logFunction"]
	pub fn log_function(log_level: i32, msg_ptr: *const u8, msg_len: usize);

	#[link_name = "getRandomInt"]
	pub fn get_random_int(min: i32, max: i32) -> i32;
}
