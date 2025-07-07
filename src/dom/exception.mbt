///|
fn[E, R] default_exception_handler(exception : E) -> R {
  console_log(@js.Value::cast_from(exception))
  panic()
}

///|
extern "js" fn console_log(x : @js.Value) = "(x) => console.log(x)"
