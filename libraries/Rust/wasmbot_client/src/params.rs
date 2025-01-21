use crate::log_err;
use crate::wasmbot_messages;
use crate::wasmbot_messages::BufferReader;
use crate::wasmbot_messages::MessageCodec;

const GP_VERSION: u16 = 7;
const MAX_NAME_LEN: usize = 26;

#[repr(C)]
pub struct BotMetadata {
	pub name: [u8; MAX_NAME_LEN],
	pub version: [u16; 3],
}

impl BotMetadata {
	pub fn to_bytes(&self, buf: &mut [u8]) -> usize {
		let mut offset = 0;
		
		// Name

		let name_len = self
			.name
			.iter()
			.position(|&x| x == 0)
			.unwrap_or(self.name.len());
		buf[offset..offset+name_len].copy_from_slice(&self.name[..name_len]);
		offset += name_len;

		buf[offset..MAX_NAME_LEN].fill(0);
		offset = MAX_NAME_LEN;

		// Version

		self.version.iter()
			.enumerate()
			.for_each(|(i, &ve)| {
				buf[offset+i*2..offset+i*2+2].copy_from_slice(&ve.to_le_bytes());
			});
		offset += 2 * self.version.len();

		offset
	}
}

pub fn make_bot_name(name: &str) -> [u8; MAX_NAME_LEN] {
	let mut name_bytes = [0u8; MAX_NAME_LEN];
	let name_len = std::cmp::min(name.len(), MAX_NAME_LEN);
	name_bytes[..name_len].copy_from_slice(&name.as_bytes()[..name_len]);
	name_bytes
}

pub fn parse_bot_version(name: &str) -> Option<[u16; 3]> {
	let version_parts = name.split('.');
	if version_parts.clone().count() != 3 {
		log_err("ERROR: version must have three parts");
		return None;
	}

	let mut version_parts =
		version_parts.map(|p| p.parse().expect("Semver parts must be valid u16 strings"));

	let version = std::array::from_fn(|_| version_parts.next().unwrap());
	Some(version)
}

pub fn read_initial_parameters(buf: &[u8], offset: usize) -> Option<wasmbot_messages::InitialParameters> {
	let mut reader = BufferReader::new(buf);
	reader.current_position = offset;

	let init_params = match wasmbot_messages::InitialParameters::from_bytes(&mut reader) {
		Ok(ip) => ip,
		Err(e) => {
			log_err(&std::format!("ERROR: Could not read reserve memory: {:?}", e));
			return None;
		},
	};

	if init_params.params_version != GP_VERSION {
		log_err(&std::format!("ERROR: Can't parse GameParams v{}; only prepared for v{}", init_params.params_version, GP_VERSION));
		return None;
	}

	Some(init_params)
}

pub fn read_present_circumstances(buf: &[u8], offset: usize) -> Option<wasmbot_messages::PresentCircumstances> {
	let mut reader = wasmbot_messages::BufferReader::new(&buf);
	reader.current_position = offset;

	match wasmbot_messages::PresentCircumstances::from_bytes(&mut reader) {
		Ok(c) => Some(c),
		Err(e) => {
			log_err(&std::format!("Could not parse PresentCircumstances in host reserve: {:?}", e));
			None
		},
	}
}

pub fn write_move(buf: &mut [u8], submitted_move: wasmbot_messages::Message) {
	let mut move_bytes = vec![];
	submitted_move.write_bytes(&mut move_bytes, true);

	buf[0..move_bytes.len()].copy_from_slice(&move_bytes);
}
