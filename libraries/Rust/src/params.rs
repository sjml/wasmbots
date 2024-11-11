use std::sync::Mutex;

use crate::host_reserve::HostReserve;
use crate::log_err;

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: usize = 26;

pub type ClientSetupFn = fn(&GameParameters) -> BotMetadata;
static CLIENT_SETUP: Mutex<ClientSetupFn> = Mutex::new(_setup_noop);
fn _setup_noop(_: &GameParameters) -> BotMetadata {
	BotMetadata { name: make_bot_name("[INVALID]"), version: [0,0,0], ready: false }
}

pub fn register_client_setup(cs: ClientSetupFn) {
	let mut csf = CLIENT_SETUP.lock().unwrap();
	*csf = cs;
}

#[repr(C)]
pub struct GameParameters {
	pub params_version: u16,
	pub engine_version: [u16; 3],
}

#[repr(C)]
pub struct BotMetadata {
	pub name: [u8; MAX_NAME_LEN],
	pub version: [u16; 3],
	pub ready: bool,
}

pub fn make_bot_name(name: &str) -> [u8; MAX_NAME_LEN] {
	let mut name_bytes = [0u8; MAX_NAME_LEN];
	let name_len = std::cmp::min(name.len(), MAX_NAME_LEN);
	name_bytes[..name_len].copy_from_slice(&name.as_bytes()[..name_len]);
	name_bytes
}

#[no_mangle]
extern "C" fn receiveGameParams(mut offset: usize, mut info_offset: usize) -> bool {
	let res = HostReserve::new();

	let gp_version = res.read::<u16>(offset);
	offset += std::mem::size_of::<u16>();
	if gp_version != GP_VERSION {
		log_err(&format!(
			"ERROR: Can't parse GameParams v{}; only prepared for v{}",
			gp_version, GP_VERSION
		));
		return false;
	}

	let mut eng_version = [0u16; 3];
	eng_version[0] = res.read::<u16>(offset);
	offset += std::mem::size_of::<u16>();
	eng_version[1] = res.read::<u16>(offset);
	offset += std::mem::size_of::<u16>();
	eng_version[2] = res.read::<u16>(offset);

	let gp = GameParameters {
		params_version: gp_version,
		engine_version: eng_version,
	};

	let bot_data = CLIENT_SETUP.lock().unwrap()(&gp);

	let mut reserve = HostReserve::new();

	let info_zero = info_offset;
	let valid_len = bot_data
		.name
		.iter()
		.position(|&x| x == 0)
		.unwrap_or(bot_data.name.len());

	let name_str =
		std::str::from_utf8(&bot_data.name[..valid_len]).expect("Invalid UTF-8 in bot name");
	info_offset = reserve.write_string(info_offset, name_str);
	while info_offset < info_zero + MAX_NAME_LEN {
		info_offset = reserve.write::<u8>(info_offset, 0);
	}
	bot_data.version.iter().for_each(|ve| {
		info_offset = reserve.write::<u16>(info_offset, *ve);
	});

	bot_data.ready
}
