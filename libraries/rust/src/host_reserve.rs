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
        },
        Err(_) => false
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

    pub fn write_u8(&mut self, offset: usize, value: u8) -> usize {
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset >= slice.len() {
            log_err("CLIENT ERROR: Writing u8 outside of reserve memory");
            return offset;
        }

        slice[offset] = value;
        offset + std::mem::size_of::<u8>()
    }

    // Rust generics should be helpful here, but they're kinda not
    pub fn write_i8(&mut self, offset: usize, value: i8) -> usize {
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset >= slice.len() {
            log_err("CLIENT ERROR: Writing i8 outside of reserve memory");
            return offset;
        }

        const INT_SIZE: usize = std::mem::size_of::<i8>();
        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }

    pub fn write_u16(&mut self, offset: usize, value: u16) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u16>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT slice: Writing u16 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i16(&mut self, offset: usize, value: i16) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i16>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing i16 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_u32(&mut self, offset: usize, value: u32) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u32>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing u32 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i32(&mut self, offset: usize, value: i32) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i32>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing i32 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_u64(&mut self, offset: usize, value: u64) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u64>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing u64 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i64(&mut self, offset: usize, value: i64) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i64>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing i64 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_f32(&mut self, offset: usize, value: f32) -> usize {
        const FLOAT_SIZE: usize = std::mem::size_of::<f32>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + FLOAT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing f32 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + FLOAT_SIZE].clone_from_slice(&bytes);
        offset + FLOAT_SIZE
    }
    pub fn write_f64(&mut self, offset: usize, value: f64) -> usize {
        const FLOAT_SIZE: usize = std::mem::size_of::<f64>();
        let mut slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + FLOAT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: Writing f64 outside of reserve memory");
            return offset;
        }

        let bytes = value.to_le_bytes();
        slice[offset..offset + FLOAT_SIZE].clone_from_slice(&bytes);
        offset + FLOAT_SIZE
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

    pub fn read_u8(&self, offset: usize) -> u8 {
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset >= slice.len() {
            log_err("CLIENT ERROR: u8 read will overrun reserve memory");
            return 0;
        }

        slice[offset]
    }

    pub fn read_i8(&self, offset: usize) -> i8 {
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset >= slice.len() {
            log_err("CLIENT ERROR: i8 read will overrun reserve memory");
            return 0;
        }

        slice[offset] as i8
    }

    pub fn read_u16(&self, offset: usize) -> u16 {
        const INT_SIZE: usize = std::mem::size_of::<u16>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: u16 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to u16");
        u16::from_le_bytes(bytes)
    }
    pub fn read_i16(&self, offset: usize) -> i16 {
        const INT_SIZE: usize = std::mem::size_of::<i16>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: i16 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to i16");
        i16::from_le_bytes(bytes)
    }
    pub fn read_u32(&self, offset: usize) -> u32 {
        const INT_SIZE: usize = std::mem::size_of::<u32>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: u32 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to u32");
        u32::from_le_bytes(bytes)
    }
    pub fn read_i32(&self, offset: usize) -> i32 {
        const INT_SIZE: usize = std::mem::size_of::<i32>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: i32 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to i32");
        i32::from_le_bytes(bytes)
    }
    pub fn read_u64(&self, offset: usize) -> u64 {
        const INT_SIZE: usize = std::mem::size_of::<u64>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: u64 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to u64");
        u64::from_le_bytes(bytes)
    }
    pub fn read_i64(&self, offset: usize) -> i64 {
        const INT_SIZE: usize = std::mem::size_of::<i64>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + INT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: i64 read will overrun reserve memory");
            return 0;
        }

        let bytes: [u8; INT_SIZE] = slice[offset..offset + INT_SIZE]
            .try_into()
            .expect("couldn't convert to i64");
        i64::from_le_bytes(bytes)
    }
    pub fn read_f32(&self, offset: usize) -> f32 {
        const FLOAT_SIZE: usize = std::mem::size_of::<f32>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + FLOAT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: f32 read will overrun reserve memory");
            return 0.0;
        }

        let bytes: [u8; FLOAT_SIZE] = slice[offset..offset + FLOAT_SIZE]
            .try_into()
            .expect("coudn't convert to f32");
        f32::from_le_bytes(bytes)
    }
    pub fn read_f64(&self, offset: usize) -> f64 {
        const FLOAT_SIZE: usize = std::mem::size_of::<f64>();
        let slice = self.res.lock().unwrap();

        #[cfg(feature = "bounds_checking")]
        if offset + FLOAT_SIZE >= slice.len() {
            log_err("CLIENT ERROR: f64 read will overrun reserve memory");
            return 0.0;
        }

        let bytes: [u8; FLOAT_SIZE] = slice[offset..offset + FLOAT_SIZE]
            .try_into()
            .expect("coudn't convert to f64");
        f64::from_le_bytes(bytes)
    }
}
