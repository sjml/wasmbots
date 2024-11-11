use std::sync::{Mutex, OnceLock};

#[cfg(feature = "bounds_checking")]
use crate::log_err;

static HOST_RESERVE: OnceLock<Mutex<Box<[u8]>>> = OnceLock::new();

pub fn reserve_host_memory(size: usize) -> bool {
	let vec_mutex = std::panic::catch_unwind(|| {
		let vec = vec![0u8; size];
		let boxed_slice = vec.into_boxed_slice();
		Mutex::new(boxed_slice)
	});

	match vec_mutex {
		Ok(vm) => {
			HOST_RESERVE.get_or_init(|| vm);
			true
		}
		Err(_) => false,
	}
}

#[derive(Debug)]
pub enum StringReadError {
	Utf8Error(std::str::Utf8Error),
	MemoryOverrun,
}

impl From<std::str::Utf8Error> for StringReadError {
	fn from(err: std::str::Utf8Error) -> StringReadError {
		StringReadError::Utf8Error(err)
	}
}

pub trait ReserveMemoryIO: Copy + Default {
	type Bytes: AsRef<[u8]> + AsMut<[u8]> + Sized;
	fn to_le_bytes(self) -> Self::Bytes;
	fn from_le_bytes(bytes: Self::Bytes) -> Self;
}

macro_rules! impl_write_to_reserve_memory {
	($($t:ty),*) => {
		$(
			impl ReserveMemoryIO for $t {
				type Bytes = [u8; size_of::<$t>()];
				fn to_le_bytes(self) -> Self::Bytes {
					<$t>::to_le_bytes(self)
				}
				fn from_le_bytes(bytes: Self::Bytes) -> Self {
					<$t>::from_le_bytes(bytes)
				}
			}
		)*
	}
}

impl_write_to_reserve_memory!(u8, i8, u16, i16, u32, i32, u64, i64, f32, f64);

pub struct HostReserve {
	res: &'static Mutex<Box<[u8]>>,
}

impl HostReserve {
	pub fn new() -> Self {
		let res = HOST_RESERVE.get().expect("Reserve memory not initialized");
		Self { res }
	}

	pub fn len(&self) -> usize {
		self.res.lock().unwrap().len()
	}

	pub fn raw_ptr(&self) -> *const u8 {
		self.res.lock().unwrap().as_ptr()
	}

	pub fn write_string(&mut self, offset: usize, msg: &str) -> usize {
		let mut slice = self.res.lock().unwrap();

		#[cfg(feature = "bounds_checking")]
		if offset + msg.len() >= slice.len() {
			log_err("CLIENT ERROR: String too long to write to reserve memory");
			return offset;
		}

		slice[offset..offset + msg.len()].clone_from_slice(&msg.as_bytes()[0..msg.len()]);
		offset + msg.len()
	}

	pub fn write<T: ReserveMemoryIO>(&mut self, offset: usize, value: T) -> usize {
		let mut slice = self.res.lock().unwrap();
		let bytes = value.to_le_bytes();
		let size = bytes.as_ref().len();

		#[cfg(feature = "bounds_checking")]
		if offset + size >= slice.len() {
			log_err(&format!(
				"CLIENT ERROR: Writing {} outside of reserve memory",
				std::any::type_name::<T>()
			));
			return offset;
		}

		slice[offset..offset + size].copy_from_slice(bytes.as_ref());
		offset + size
	}

	pub fn read_string(&self, offset: usize, len: usize) -> Result<String, StringReadError> {
		let slice = self.res.lock().unwrap();

		#[cfg(feature = "bounds_checking")]
		if offset + len >= slice.len() {
			log_err("CLIENT ERROR: String read will overrun reserve memory");
			return Err(StringReadError::MemoryOverrun);
		}

		let bytes = &slice[offset..offset + len];
		let res = std::str::from_utf8(bytes)?;
		Ok(res.to_string())
	}

	pub fn read<T: ReserveMemoryIO>(&self, offset: usize) -> T {
		let slice = self.res.lock().unwrap();
		let size = std::mem::size_of::<T>();

		#[cfg(feature = "bounds_checking")]
		if offset + size >= slice.len() {
			log_err(&format!(
				"CLIENT ERROR: {} read will overrun reserve memory",
				std::any::type_name::<T>()
			));
			return Default::default()
		}

		let mut bytes = T::default().to_le_bytes();
		bytes.as_mut().copy_from_slice(&slice[offset..offset + size]);

		T::from_le_bytes(bytes)
	}
}
