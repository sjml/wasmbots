use std::sync::{Mutex, OnceLock};

static HOST_RESERVE: OnceLock<Mutex<Box<[u8]>>> = OnceLock::new();

pub fn reserve_host_memory(size: usize) {
    HOST_RESERVE.get_or_init(|| {
        let vec = vec![0u8; size];
        let boxed_slice = vec.into_boxed_slice();
        Mutex::new(boxed_slice)
    });
}

pub struct HostReserve {
    res: &'static Mutex<Box<[u8]>>,
}

impl HostReserve {
    pub fn new() -> Self {
        let res = HOST_RESERVE.get().expect("Reserve memory not initialized");
        Self {
            res
        }
    }

    pub fn len(&self) -> usize {
        self.res.lock().unwrap().len()
    }

    pub fn raw_ptr(&self) -> *const u8 {
        self.res.lock().unwrap().as_ptr()
    }

    pub fn write_string(&mut self, offset: usize, msg: &str) -> usize {
        let mut slice = self.res.lock().unwrap();
        slice[offset..offset+msg.len()].clone_from_slice(&msg.as_bytes()[0..msg.len()]);
        offset + msg.len()
    }

    pub fn write_u8(&mut self, offset: usize, value: u8) -> usize {
        let mut slice = self.res.lock().unwrap();
        slice[offset] = value;
        offset + std::mem::size_of::<u8>()
    }

    // Rust generics should be helpful here, but they're kinda not
    pub fn write_u16(&mut self, offset: usize, value: u16) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u16>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i16(&mut self, offset: usize, value: i16) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i16>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_u32(&mut self, offset: usize, value: u32) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u32>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i32(&mut self, offset: usize, value: i32) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i32>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_u64(&mut self, offset: usize, value: u64) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<u64>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }
    pub fn write_i64(&mut self, offset: usize, value: i64) -> usize {
        const INT_SIZE: usize = std::mem::size_of::<i64>();
        let mut slice = self.res.lock().unwrap();
        let bytes = value.to_le_bytes();
        slice[offset..offset+INT_SIZE].clone_from_slice(&bytes);
        offset + INT_SIZE
    }

    pub fn read_string(&self, offset: usize, len: usize) -> Result<String, std::str::Utf8Error> {
        let slice = self.res.lock().unwrap();
        let bytes = &slice[offset..offset+len];
        let res = std::str::from_utf8(bytes)?;
        Ok(res.to_string())
    }

    pub fn read_u8(&self, offset: usize) -> u8 {
        let slice = self.res.lock().unwrap();
        slice[offset]
    }

    pub fn read_u16(&self, offset: usize) -> u16 {
        const INT_SIZE: usize = std::mem::size_of::<u16>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to u16");
        u16::from_le_bytes(bytes)
    }
    pub fn read_i16(&self, offset: usize) -> i16 {
        const INT_SIZE: usize = std::mem::size_of::<i16>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to i16");
        i16::from_le_bytes(bytes)
    }
    pub fn read_u32(&self, offset: usize) -> u32 {
        const INT_SIZE: usize = std::mem::size_of::<u32>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to u32");
        u32::from_le_bytes(bytes)
    }
    pub fn read_i32(&self, offset: usize) -> i32 {
        const INT_SIZE: usize = std::mem::size_of::<i32>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to i32");
        i32::from_le_bytes(bytes)
    }
    pub fn read_u64(&self, offset: usize) -> u64 {
        const INT_SIZE: usize = std::mem::size_of::<u64>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to u64");
        u64::from_le_bytes(bytes)
    }
    pub fn read_i64(&self, offset: usize) -> i64 {
        const INT_SIZE: usize = std::mem::size_of::<i64>();
        let slice = self.res.lock().unwrap();
        let bytes: [u8; INT_SIZE] = slice[offset..offset+INT_SIZE].try_into().expect("couldn't convert to i64");
        i64::from_le_bytes(bytes)
    }
}
