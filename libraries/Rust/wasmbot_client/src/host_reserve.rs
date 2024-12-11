use std::sync::{RwLock, OnceLock};

static HOST_RESERVE: OnceLock<RwLock<Box<[u8]>>> = OnceLock::new();


pub fn reserve_host_memory(size: usize) -> bool {
    if size == 0 {
        return false;
    }

    let vec = vec![0u8; size];
    let boxed_slice = vec.into_boxed_slice();
    let rw_lock = RwLock::new(boxed_slice);

    let _ = HOST_RESERVE.get_or_init(|| rw_lock);

    true
}

pub struct HostReserve {
	res: &'static RwLock<Box<[u8]>>,
}

impl HostReserve {
	pub fn new() -> Self {
		let res = HOST_RESERVE.get().expect("Reserve memory not initialized");
		Self { res }
	}

	pub fn read(&self) -> std::sync::RwLockReadGuard<'_, Box<[u8]>> {
		self.res.read().unwrap()
	}

	pub fn with_locked_memory<F, R>(&self, f: F) -> R
	where
		F: FnOnce(&mut [u8]) -> R
	{
		let mut guard = self.res.write().unwrap();
		f(&mut guard)
	}

	pub fn len(&self) -> usize {
		self.res.read().unwrap().len()
	}

	pub fn raw_ptr(&self) -> *const u8 {
		self.res.read().unwrap().as_ptr()
	}
}
