use std::sync::Mutex;

use crate::host_reserve::{self,HostReserve};
use crate::log_err;
use crate::wasmbot_messages;
use crate::wasmbot_messages::BufferReader;
use crate::wasmbot_messages::MessageCodec;

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: usize = 26;

pub type ClientSetupFn = fn() -> BotMetadata;
static CLIENT_SETUP: Mutex<ClientSetupFn> = Mutex::new(_setup_noop);
fn _setup_noop() -> BotMetadata {
	BotMetadata { name: make_bot_name("[INVALID]"), version: [0,0,0]}
}

pub fn register_client_setup(cs: ClientSetupFn) {
	let mut csf = CLIENT_SETUP.lock().unwrap();
	*csf = cs;
}

#[no_mangle]
extern "C" fn setup(request_reserve: usize) -> usize {
	if !host_reserve::reserve_host_memory(request_reserve) {
		log_err("CLIENT ERROR: Could not allocate reserve memory");
		return 0;
	}

	let cs = CLIENT_SETUP.lock().unwrap();
	let bot_data = cs();

	let reserve = HostReserve::new();
	let mut offset = 0;
	reserve.with_locked_memory(|mem| {
		let valid_len = bot_data
			.name
			.iter()
			.position(|&x| x == 0)
			.unwrap_or(bot_data.name.len());
		mem[offset..valid_len].copy_from_slice(&bot_data.name[..valid_len]);
		offset += valid_len;
		while offset < MAX_NAME_LEN {
			mem[offset] = 0;
			offset += 1;
		}
		bot_data.version.iter()
			.enumerate()
			.for_each(|(i, &ve)| {
				mem[offset+i*2..offset+i*2+2].copy_from_slice(&ve.to_le_bytes());
			});
		offset += 2 * bot_data.version.len();
	});


	reserve.raw_ptr() as usize
}

#[repr(C)]
pub struct BotMetadata {
	pub name: [u8; MAX_NAME_LEN],
	pub version: [u16; 3],
}

pub fn make_bot_name(name: &str) -> [u8; MAX_NAME_LEN] {
	let mut name_bytes = [0u8; MAX_NAME_LEN];
	let name_len = std::cmp::min(name.len(), MAX_NAME_LEN);
	name_bytes[..name_len].copy_from_slice(&name.as_bytes()[..name_len]);
	name_bytes
}

#[no_mangle]
extern "C" fn receiveGameParams(offset: usize) -> bool {
	let res = HostReserve::new();
	let data = &*res.read();
	let mut reader = BufferReader::new(data);
	reader.current_position = offset;
	let init_params = match wasmbot_messages::InitialParameters::from_bytes(&mut reader) {
		Ok(ip) => ip,
		Err(e) => {
			log_err(&std::format!("ERROR: Could not read reserve memory: {:?}", e));
			return false;
		},
	};
	if init_params.params_version != GP_VERSION {
		log_err(&std::format!("ERROR: Can't parse GameParams v{}; only prepared for v{}", init_params.params_version, GP_VERSION));
		return false;
	}

	let crgp = CLIENT_RECEIVE_GAME_PARAMS.lock().unwrap();
	crgp(init_params)
}

pub type ClientReceiveGameParamsFn = fn(wasmbot_messages::InitialParameters) -> bool;
static CLIENT_RECEIVE_GAME_PARAMS: Mutex<ClientReceiveGameParamsFn> = Mutex::new(_client_receive_noop);
fn _client_receive_noop(_: wasmbot_messages::InitialParameters) -> bool {
	log_err("no ClientReceiveGameParamsFn set!");
	true
}

pub fn register_client_receive_game_params(cb: ClientReceiveGameParamsFn) {
	let mut crgp = CLIENT_RECEIVE_GAME_PARAMS.lock().unwrap();
	*crgp = cb;
}

