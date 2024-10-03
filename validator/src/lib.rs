use std::collections::HashMap;

use wasmparser::{self, TypeRef};

mod expectations;

#[cfg(target_arch = "wasm32")]
extern "C" {
    #[link_name = "validatorError"]
    fn host_log_function(msg_ptr: usize, msg_len: usize);
}

#[cfg(target_arch = "wasm32")]
fn log(msg: &str) {
    unsafe {
        host_log_function(msg.as_ptr() as usize, msg.len() as usize);
    }
}

#[cfg(not(target_arch = "wasm32"))]
fn log(msg: &str) {
    println!("{}", msg);
}

#[derive(Debug)]
pub enum WatParserError {
    WasmParserError(wasmparser::BinaryReaderError),
    WrongMemoryType,
    MissingExportedFunction(String),
    ExportHasWrongParams(String),
    ExportHasWrongResult(String),
}

impl From<wasmparser::BinaryReaderError> for WatParserError {
    fn from(err: wasmparser::BinaryReaderError) -> WatParserError {
        WatParserError::WasmParserError(err)
    }
}

struct FuncInfo<'a> {
    params: &'a [wasmparser::ValType],
    ret: Option<wasmparser::ValType>,
}

fn str_to_val_type(s: &str) -> Option<wasmparser::ValType> {
    match s {
        "i32" => Some(wasmparser::ValType::I32),
        "i64" => Some(wasmparser::ValType::I64),
        "f32" => Some(wasmparser::ValType::F32),
        "f64" => Some(wasmparser::ValType::F64),
        _ => None
    }
}

fn _validate_wasm(wasm_bytes: &[u8], expect_json: &str) -> Result<(), WatParserError> {
    let guest_expect = expectations::Expectations::from_str(expect_json);


    let mut func_type_indexes: Vec<u32> = Vec::new();
    let mut func_types: Vec<wasmparser::FuncType> = Vec::new();
    let mut exports: Vec<wasmparser::Export> = Vec::new();
    let mut imports: Vec<wasmparser::Import> = Vec::new();
    let mut has_exported_memory = false;

    let parser = wasmparser::Parser::new(0);
    for payload in parser.parse_all(wasm_bytes) {
        match payload? {
            wasmparser::Payload::ImportSection(reader) => {
                for imp in reader {
                    if let Ok(imp) = imp {
                        imports.push(imp);
                    }
                }
            },
            wasmparser::Payload::ExportSection(reader) => {
                for ex in reader {
                    if let Ok(ex) = ex {
                        exports.push(ex);
                    }
                }
            }
            wasmparser::Payload::FunctionSection(reader) => {
                for ft in reader {
                    if let Ok(ft) = ft {
                        func_type_indexes.push(ft);
                    }
                }
            }
            wasmparser::Payload::TypeSection(reader) => {
                for typ in reader {
                    if let Ok(typ) = typ {
                        let typs = typ.into_types();
                        for t in typs {
                            func_types.push(t.unwrap_func().clone());
                        }
                    }
                }
            }
            _ => {}
        }
    }

    let mut exported_functions: HashMap<&str, FuncInfo> = HashMap::new();
    let imported_func_count = imports.iter().filter(|i| matches!(i.ty, TypeRef::Func(_))).count();

    for ex in exports {
        match ex.kind {
            wasmparser::ExternalKind::Func => {
                let fti = func_type_indexes[usize::try_from(ex.index - (imported_func_count as u32)).unwrap()];
                let ft = &func_types[usize::try_from(fti).unwrap()];
                let mut r: Option<wasmparser::ValType> = None;
                if ft.results().len() > 0 {
                    r = Some(ft.results()[0]);
                }
                let fi = FuncInfo {
                    params: ft.params(),
                    ret: r,
                };
                exported_functions.insert(ex.name, fi);
            }
            wasmparser::ExternalKind::Memory => {
                if ex.name == "memory" {
                    has_exported_memory = true;
                }
            }
            _ => {}
        }
    }

    if guest_expect.memory.kind == "exported" {
        if !has_exported_memory {
            return Err(WatParserError::WrongMemoryType);
        }
    }
    for (func_name, sig_data) in guest_expect.function_exports {
        let exported_data = if let Some(exported_data) = exported_functions.get(func_name.as_str()) {
            exported_data
        } else {
            return Err(WatParserError::MissingExportedFunction(func_name));
        };

        match sig_data.r#return {
            Some(ret) => {
                let mapped_return = str_to_val_type(&ret).expect("Invalid valtype string in expectations file");
                match exported_data.ret {
                    Some(r) => if mapped_return != r { return Err(WatParserError::ExportHasWrongResult(func_name))},
                    None => return Err(WatParserError::ExportHasWrongResult(func_name))
                }
            },
            None => {
                match exported_data.ret {
                    Some(_) => return Err(WatParserError::ExportHasWrongResult(func_name)),
                    None => {},
                }
            }
        }


        let mapped_params: Vec<wasmparser::ValType> = sig_data.params.iter()
            .map(|s| str_to_val_type(s))
            .filter_map(|x| x)
            .collect();
        if mapped_params.len() != exported_data.params.len() {
            return Err(WatParserError::ExportHasWrongParams(func_name));
        }

        if mapped_params != exported_data.params {
            return Err(WatParserError::ExportHasWrongParams(func_name));
        }
    }

    Ok(())
}

#[no_mangle]
pub extern "C" fn request_allocation(num_bytes: usize) -> *mut u8 {
    let layout = std::alloc::Layout::array::<u8>(num_bytes).expect("Could not allocated memory");
    unsafe { std::alloc::alloc(layout) }
}

#[no_mangle]
pub extern "C" fn validate_wasm(wasm_ptr: *mut u8, wasm_len: usize, json_ptr: *mut u8, json_len: usize) -> u8 {
    let bytes = unsafe { std::slice::from_raw_parts(wasm_ptr, wasm_len) };
    let expectations = unsafe { String::from_raw_parts(json_ptr, json_len, json_len) };
    match _validate_wasm(bytes, &expectations) {
        Ok(_) => 0,
        Err(e) => match e {
            WatParserError::WasmParserError(_) => {
                log(&"Some error in the WASM parser");
                1
            },
            WatParserError::ExportHasWrongParams(f) => {
                log(&format!("{} has wrong parameters", f));
                2
            },
            WatParserError::ExportHasWrongResult(f) => {
                log(&format!("{} has wrong result", f));
                3
            },
            WatParserError::MissingExportedFunction(f) => {
                log(&format!("{} is not exported", f));
                4
            },
            WatParserError::WrongMemoryType => {
                log(&"memory is not exported");
                5
            },
        },
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn validate() {
        let wasm = include_bytes!("../../example_bots/bot_as.wasm");
        let exp = include_str!("../../host/rsc/data/guestExpectations.json");
        match _validate_wasm(wasm, exp) {
            Ok(()) => {},
            Err(e) => {
                eprintln!("{:?}", e);
                assert!(false);
            }
        }
    }
}
