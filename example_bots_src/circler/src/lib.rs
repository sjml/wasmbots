pub mod exploration;

use exploration::{Grid, Point};
use wasmbot_client::{Client, log, params, register_client, wasmbot_messages};

struct Bot {
    direction: wasmbot_messages::Direction,
    last_move_type: wasmbot_messages::MessageType,
}

impl Client for Bot {
    fn create() -> Self {
        let random_dir = wasmbot_client::get_random_int(0, 3) * 2;

        Self {
            direction: (random_dir as u8).try_into().expect("Bad direction"),
            last_move_type: wasmbot_messages::MessageType::_Error,
        }
    }

    fn get_metadata(&mut self) -> params::BotMetadata {
        params::BotMetadata {
            name: params::make_bot_name(env!("CARGO_PKG_NAME")),
            version: params::parse_bot_version(env!("CARGO_PKG_VERSION")).unwrap_or([0; 3]),
        }
    }

    fn tick(&mut self, pc: wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message {
        let last_move_was_door = match self.last_move_type {
            wasmbot_messages::MessageType::Open => true,
            wasmbot_messages::MessageType::Close => true,
            _ => false,
        };

        let side_len = pc.surroundings_radius * 2 + 1;
        let grid = Grid::new(pc.surroundings, side_len.into(), side_len.into());
        let origin = Point {
            x: pc.surroundings_radius.into(),
            y: pc.surroundings_radius.into(),
        };

        if !last_move_was_door {
            let ns = Point::get_neighbors_4(Point { x: 0, y: 0 });
            for pt in &ns {
                let ntile = grid.get_from_origin(&origin, pt);
                match ntile {
                    wasmbot_messages::TileType::ClosedDoor => {
                        log(&std::format!("opening door @ ({}, {})", pt.x, pt.y));
                        self.last_move_type = wasmbot_messages::MessageType::Open;
                        return wasmbot_messages::Message::Open(wasmbot_messages::Open {
                            target: pt.to_msg_pt(),
                        });
                    }
                    wasmbot_messages::TileType::OpenDoor => {
                        log(&std::format!("closing door @ ({}, {})", pt.x, pt.y));
                        self.last_move_type = wasmbot_messages::MessageType::Close;
                        return wasmbot_messages::Message::Close(wasmbot_messages::Close {
                            target: pt.to_msg_pt(),
                        });
                    }
                    _ => {}
                }
            }
        }

        let mut dir = self.direction;
        let delta = exploration::MOVEMENT[dir as usize];
        let peek = grid.get_from_origin(
            &origin,
            &Point {
                x: delta.x.into(),
                y: delta.y.into(),
            },
        );

        match peek {
            wasmbot_messages::TileType::Floor => {}
            _ => {
                // log("changing direction because next tile is not floor");
                let mut diri = self.direction as u8;
                diri += 2;
                diri %= 8;
                // log(&std::format!("new direction: {}", diri));
                dir = diri.try_into().unwrap();
                self.direction = (diri).try_into().expect("Bad direction");
            }
        }

        self.last_move_type = wasmbot_messages::MessageType::MoveTo;
        return wasmbot_messages::Message::MoveTo(wasmbot_messages::MoveTo {
            direction: dir,
            distance: 1,
        });
    }
}

register_client!(Bot);
