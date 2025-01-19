#![deny(unsafe_op_in_unsafe_fn)]

pub mod client;
pub mod params;
pub mod wasmbot_messages;
pub mod ffi;
pub mod log;

pub use client::Client;
pub use log::*;

/// Requests the client to be shut down before the next tick
pub fn shutdown() {
	unsafe {
		ffi::shutdown();
	}
}

/// Generates a random integer in the range `min..max`
pub fn get_random_int(min: i32, max: i32) -> i32 {
	unsafe {
		ffi::get_random_int(min, max)
	}
}
