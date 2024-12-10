use std::cell::RefCell;

pub mod exploration;

use exploration::Point;
use wasmbots_client::{params, wasmbot_messages, log};
use crate::exploration::Grid;

thread_local! {
	static DIRECTION: RefCell<wasmbot_messages::Direction> = RefCell::new(wasmbot_messages::Direction::North);
	static LAST_MOVE_TYPE: RefCell<wasmbot_messages::MessageType> = RefCell::new(wasmbot_messages::MessageType::_Error);
}

fn client_setup() -> params::BotMetadata {
	let mut bot_meta = params::BotMetadata {
		name: params::make_bot_name(env!("CARGO_PKG_NAME")),
		version: [0, 1, 0],
	};

	let version_str = env!("CARGO_PKG_VERSION");
	let mut version_parts = version_str.split('.');
	if version_parts.clone().count() != 3 {
		wasmbots_client::log_err("CLIENT ERROR: version must be semver");
		return bot_meta;
	}
	let major = version_parts
		.next()
		.unwrap()
		.parse::<u16>()
		.expect("Semver parts must fit in u16");
	let minor = version_parts
		.next()
		.unwrap()
		.parse::<u16>()
		.expect("Semver parts must fit in u16");
	let patch = version_parts
		.next()
		.unwrap()
		.parse::<u16>()
		.expect("Semver parts must fit in u16");
	bot_meta.version = [major, minor, patch];

	let random_dir = wasmbots_client::get_random_int(0, 3) * 2;
	DIRECTION.with_borrow_mut(|dir| *dir = (random_dir as u8).try_into().expect("Bad direction"));

	bot_meta
}

fn tick(pc: wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message {
	let last_move_was_door = LAST_MOVE_TYPE.with_borrow(|lmt| match *lmt {
		wasmbot_messages::MessageType::Open => true,
		wasmbot_messages::MessageType::Close => true,
		_ => false
	});

	let side_len = pc.surroundings_radius * 2 + 1;
	let grid = Grid::new(pc.surroundings, side_len.into(), side_len.into());
	let origin = Point { x: pc.surroundings_radius.into(), y: pc.surroundings_radius.into() };

	if !last_move_was_door {
		let ns = Point::get_neighbors_4(Point{x: 0, y: 0});
		for pt in &ns {
			let ntile = grid.get_from_origin(&origin, pt);
			match ntile {
				wasmbot_messages::TileType::ClosedDoor => {
					log(&std::format!("opening door @ ({}, {})", pt.x, pt.y));
					LAST_MOVE_TYPE.with_borrow_mut(|lmt| *lmt = wasmbot_messages::MessageType::Open);
					return wasmbot_messages::Message::Open(wasmbot_messages::Open {
						target: pt.to_msg_pt()
					});
				},
				wasmbot_messages::TileType::OpenDoor => {
					log(&std::format!("closing door @ ({}, {})", pt.x, pt.y));
					LAST_MOVE_TYPE.with_borrow_mut(|lmt| *lmt = wasmbot_messages::MessageType::Close);
					return wasmbot_messages::Message::Close(wasmbot_messages::Close {
						target: pt.to_msg_pt()
					});
				},
				_ => {},
			}
		}
	}

	let mut dir = DIRECTION.with_borrow(|dir| *dir);
	let delta = exploration::MOVEMENT[dir as usize];
	let peek = grid.get_from_origin(&origin, &Point{x: delta.x.into(), y: delta.y.into()});

	match peek {
		wasmbot_messages::TileType::Floor => {},
		_ => {
			log("changing direction because next tile is not floor");
			let mut diri = DIRECTION.with_borrow(|dir| *dir as u8);
			diri += 2;
			diri %= 8;
			log(&std::format!("new direction: {}", diri));
			dir = diri.try_into().unwrap();
			DIRECTION.with_borrow_mut(|dir| *dir = (diri).try_into().expect("Bad direction"));
		}
	}

	LAST_MOVE_TYPE.with_borrow_mut(|lmt| *lmt = wasmbot_messages::MessageType::MoveTo);
	return wasmbot_messages::Message::MoveTo(wasmbot_messages::MoveTo { direction: dir, distance: 1 })
}

fn receive_game_params(_: wasmbot_messages::InitialParameters) -> bool {
	true // just happy to be here
}

#[export_name="clientInitialize"]
pub extern "C" fn client_initialize() {
	params::register_client_setup(client_setup);
	params::register_client_receive_game_params(receive_game_params);
	wasmbots_client::register_tick_callback(tick);
}
