///| DO NOT USE THIS FUNCTION.
/// NOTE: There is a bug in the unused analyzer, so make this function public to avoid the warning.
pub fn[E, R] default_exception_handler(exception : E) -> R {
  console_log(@js.Value::cast_from(exception))
  panic()
}

///|
extern "js" fn console_log(x : @js.Value) = "(x) => console.log(x)"
