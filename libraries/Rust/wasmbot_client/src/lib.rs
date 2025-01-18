use std::sync::Mutex;

pub mod client;
mod host_reserve;
pub mod params;
pub mod wasmbot_messages;
pub use host_reserve::HostReserve;
use wasmbot_messages::MessageCodec;

pub type TickFn = fn(wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message;
static CLIENT_TICK: Mutex<TickFn> = Mutex::new(_client_tick_noop);
fn _client_tick_noop(_: wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message {
	wasmbot_messages::Message::_Error(wasmbot_messages::_Error{description: "No client tick function registered".to_string()})
}

extern "C" {
	#[link_name = "logFunction"]
	fn host_log_function(log_level: i32, msg_ptr: usize, msg_len: usize);

	#[link_name = "getRandomInt"]
	fn host_get_random_int(min: i32, max: i32) -> i32;
}

// native placeholders to make the linker happy (will be overridden in trainer)
#[cfg(not(target_arch = "wasm32"))]
mod native_fallbacks {
	#[no_mangle]
	pub extern "C" fn logFunction(log_level: i32, _msg_ptr: usize, _msg_len: usize) {
		println!("Native log function called with level: {}", log_level);
	}

	#[no_mangle]
	pub extern "C" fn getRandomInt(min: i32, max: i32) -> i32 {
		(min + max) / 2
	}
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
pub fn get_random_int(min: i32, max: i32) -> i32 {
	unsafe {
		host_get_random_int(min, max)
	}
}

pub fn register_tick_callback(cb: TickFn) {
	let mut ct = CLIENT_TICK.lock().unwrap();
	*ct = cb;
}

#[no_mangle]
extern "C" fn tick(offset: usize) {
	let reserve = HostReserve::new();
	let data: Vec<u8> = {
		let read_guard = reserve.read();
		let circumstances = {
			let data = read_guard.to_vec();
			let mut reader = wasmbot_messages::BufferReader::new(&data);
			reader.current_position = offset;
			match wasmbot_messages::PresentCircumstances::from_bytes(&mut reader) {
				Ok(c) => c,
				Err(e) => {
					log_err(&std::format!("Could not parse PresentCircumstances in host reserve: {:?}", e));
					return;
				},
			}
		};

		let ct = CLIENT_TICK.lock().unwrap();
		let submitted_move = ct(circumstances);

		let mut move_bytes = vec![];
		submitted_move.write_bytes(&mut move_bytes, true);

		move_bytes
	};

	reserve.with_locked_memory(|mem| {
		mem[0..data.len()].copy_from_slice(&data);
	});
}
