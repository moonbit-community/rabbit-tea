///| DO NOT USE THIS FUNCTION.
/// NOTE: There is a bug in the unused analyzer, so make this function public to avoid the warning.
pub fn[E, R] default_exception_handler(exception : E) -> R {
  console_log(@js.Value::cast_from(exception))
  panic()
}

///|
extern "js" fn console_log(x : @js.Value) = "(x) => console.log(x)"

///|
// pub suberror DOMExceptionError DOMException
// 
// ///|
// #external
// priv type HasException[A, B]
// 
// ///|
// extern "js" fn ffi_result_unwrap_err(s : @js.Value) -> @js.Value = "(s) => s._moonbit_err"
// 
// ///|
// extern "js" fn ffi_result_has_err(s : @js.Value) -> Bool = "(s) => s._moonbit_err !== undefined"
// 
// ///|
// fn[A, B, E : Error] HasException::convert(
//   self : HasException[A, B],
//   handler : (B) -> A raise E
// ) -> A raise E {
//   if ffi_result_has_err(js_identity(self)) {
//     let err : B = self |> js_identity |> ffi_result_unwrap_err |> js_identity
//     handler(err)
//   } else {
//     js_identity(self)
//   }
// }
