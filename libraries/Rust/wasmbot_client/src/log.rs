pub fn log(msg: &str) {
	unsafe {
		crate::ffi::log_function(2, msg.as_ptr(), msg.len());
	}
}

pub fn log_err(msg: &str) {
	unsafe {
		crate::ffi::log_function(0, msg.as_ptr(), msg.len());
	}
}
