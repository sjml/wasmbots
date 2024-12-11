use std::cell::RefCell;

use rand::Rng;

thread_local! {
	static HOST_RESERVE_PTR: RefCell<*mut u8> = RefCell::new(std::ptr::null_mut());
	static HOST_RESERVE_LEN: RefCell<usize> = RefCell::new(0);
}

#[no_mangle]
pub extern "C" fn logFunction(log_level: i32, msg_ptr: usize, msg_len: usize) {
	let lifted = match lift_string(msg_ptr, msg_len) {
		Ok(s) => s,
		Err(_) => {
			eprintln!("ERROR: Could not read valid utf8 out of memory");
			return;
		}
	};
	if log_level == 0 {
		eprintln!("{}", lifted);
	}
	else {
		println!("{}", lifted);
	}
}

#[no_mangle]
pub extern "C" fn getRandomInt(min: i32, max: i32) -> i32 {
	let mut rng = rand::thread_rng();
	rng.gen_range(min..=max)
}

fn lift_string(offset: usize, len: usize) -> Result<String, std::str::Utf8Error> {
	let raw_ptr = offset as *const u8;
	let slice = unsafe { std::slice::from_raw_parts(raw_ptr, len) };
	std::str::from_utf8(slice).map(|s| s.to_string())
}

extern "C" {
	fn clientInitialize();
	fn setup(request_reserve: usize) -> usize;
	fn receiveGameParams(offset: usize) -> bool;
	fn tick(offset: usize);
}

pub fn simulate_setup(reserve_request: usize) -> Result<*mut u8, String> {
	unsafe { clientInitialize(); }
	let reserve_offset = unsafe { setup(reserve_request) };
	if reserve_offset == 0 {
		return Err("Could not allocate reserve block.".to_string());
	}

	HOST_RESERVE_PTR.with_borrow_mut(|ptr| *ptr = reserve_offset as *mut u8);
	HOST_RESERVE_LEN.with_borrow_mut(|len| *len = reserve_request);

	Ok(reserve_offset as *mut u8)
}

fn overwrite_reserve_with(incoming: &Vec<u8>) -> Result<(), String> {
	let len = HOST_RESERVE_LEN.with_borrow(|len| *len);
	if incoming.len() != len {
		return Err(format!("Mismatched length on memory blocks: {}, expected {}", incoming.len(), len).to_string());
	}
	HOST_RESERVE_PTR.with_borrow(|ptr| {
		if *ptr == std::ptr::null_mut() {
			return Err("Pointer is null".to_string());
		}

		unsafe {
			let incoming_ptr = incoming.as_ptr();
			std::ptr::copy_nonoverlapping(incoming_ptr, *ptr, len);
		}
		Ok(())
	})
}

pub fn simulate_receive_game_params(
	incoming_block: Vec<u8>,
	offset: usize,
) -> Result<Vec<u8>, String> {
	overwrite_reserve_with(&incoming_block)?;

	let bot_ready = unsafe { receiveGameParams(offset) };

	if !bot_ready {
		return Err("Bot declined game parameters".to_string());
	}

	unsafe {
		let ret_slice = std::slice::from_raw_parts(
			HOST_RESERVE_PTR.with_borrow(|ptr| *ptr),
			incoming_block.len(),
		);
		Ok(ret_slice.to_vec())
	}
}

pub fn simulate_tick(incoming_block: Vec<u8>, offset: usize) -> Result<Vec<u8>, String> {
	overwrite_reserve_with(&incoming_block)?;

	unsafe {
		tick(offset);
		let ret_slice = std::slice::from_raw_parts(
			HOST_RESERVE_PTR.with_borrow(|ptr| *ptr),
			incoming_block.len(),
		);
		Ok(ret_slice.to_vec())
	}
}
