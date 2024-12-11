use wasmbot_client::wasmbot_messages;

pub const MOVEMENT: [Point; 8] = [
	Point{ x:  0, y: -1 }, // North
	Point{ x:  1, y: -1 }, // Northeast
	Point{ x:  1, y:  0 }, // East
	Point{ x:  1, y:  1 }, // Southeast
	Point{ x:  0, y:  1 }, // South
	Point{ x: -1, y:  1 }, // Southwest
	Point{ x: -1, y:  0 }, // West
	Point{ x: -1, y: -1 }, // Northwest
];

#[derive(Debug,Copy,Clone)]
pub struct Point {
	pub x: i16,
	pub y: i16,
}

impl Point {
	pub fn hash(self: Point) -> u64 {
		let x64 = self.x as u64;
		let y64 = self.y as u64;
		x64 * 31 + y64
	}

	pub fn equals(self: Point, other: Point) -> bool {
		self.x == other.x && self.y == other.y
	}

	pub fn to_msg_pt(self: Point) -> wasmbot_messages::Point {
		wasmbot_messages::Point { x: self.x, y: self.y }
	}

	pub fn add(self: Point, other: Point) -> Point {
		Point { x: self.x + other.x, y: self.y + other.y }
	}

	pub fn sub(self: Point, other: Point) -> Point {
		Point { x: self.x - other.x, y: self.y - other.y }
	}

	pub fn mul(self: Point, scale: i16) -> Point {
		Point { x: self.x * scale, y: self.y * scale }
	}

	pub fn manhattan_distance(self: Point, other: Point) -> u16 {
		((other.x - self.x).abs() + (other.y - self.y).abs()).try_into().unwrap()
	}

	pub fn direction_to_neighbor(self: Point, other: Point) -> Result<wasmbot_messages::Direction, String> {
		let delta = other.sub(self);
		if delta.manhattan_distance(Point { x: 0, y: 0 }) > 1 {
			return Err("Point too far!".to_string());
		}

		let dir = match delta {
			Point{ x:  1, y:  0 } => wasmbot_messages::Direction::East,
			Point{ x:  1, y:  1 } => wasmbot_messages::Direction::Southeast,
			Point{ x:  0, y:  1 } => wasmbot_messages::Direction::South,
			Point{ x: -1, y:  1 } => wasmbot_messages::Direction::Southwest,
			Point{ x: -1, y:  0 } => wasmbot_messages::Direction::West,
			Point{ x: -1, y: -1 } => wasmbot_messages::Direction::Northwest,
			Point{ x:  0, y: -1 } => wasmbot_messages::Direction::North,
			Point{ x:  1, y: -1 } => wasmbot_messages::Direction::Northeast,
			_ => return Err("Invalid direction".to_string()),
		};

		Ok(dir)
	}

	pub fn get_neighbors_4(self: Point) -> [Point; 4] {
		[
			self.add(MOVEMENT[wasmbot_messages::Direction::North as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::East as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::South as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::West as usize]),
		]
	}

	pub fn get_neighbors_8(self: Point) -> [Point; 8] {
		[
			self.add(MOVEMENT[wasmbot_messages::Direction::North as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::Northeast as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::East as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::Southeast as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::South as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::Southwest as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::West as usize]),
			self.add(MOVEMENT[wasmbot_messages::Direction::Northwest as usize]),
		]
	}
}

pub struct Grid<T> {
	pub data: Vec<T>,
	pub width: usize,
	pub height: usize,
}

impl<T> Grid<T> {
	pub fn new(data: Vec<T>, width: usize, height: usize) -> Self {
		Self {
			data,
			width,
			height,
		}
	}

	pub fn get(&self, x: usize, y: usize) -> T
	where
		T: Copy,
	{
		let idx = (y * self.width) + x;
		if idx >= self.data.len() {
			panic!("Bad grid access!");
		}
		self.data[idx]
	}

	pub fn get_from_origin(&self, origin: &Point, offset: &Point) -> T
	where
		T: Copy,
	{
		let x = (origin.x as isize + offset.x as isize) as usize;
		let y = (origin.y as isize + offset.y as isize) as usize;
		self.get(x, y)
	}
}
