///| https://developer.mozilla.org/en-US/docs/Web/API/ErrorEvent
#external
type ErrorEvent

///|
pub impl IsEvent for ErrorEvent

///|
pub impl @js.Cast for ErrorEvent with into(value) {
  value |> ffi_to_error_event |> _.to_option()
}

///|
pub impl @js.Cast for ErrorEvent with from(value) {
  value |> js_identity
}

///| A string containing a human-readable error message describing the problem.
pub extern "js" fn ErrorEvent::get_message(self : Self) -> String = "(e) => e.message"

///| A string containing the name of the script file in which the error occurred.
pub extern "js" fn ErrorEvent::get_filename(self : Self) -> String = "(e) => e.filename"

///| An integer containing the line number of the script file on which the error occurred.
pub extern "js" fn ErrorEvent::get_lineno(self : Self) -> Int = "(e) => e.lineno"

///| An integer containing the column number of the script file on which the error occurred.
pub extern "js" fn ErrorEvent::get_colno(self : Self) -> Int = "(e) => e.colno"

///| A JavaScript value representing the error associated with this event.
pub extern "js" fn ErrorEvent::get_error(self : Self) -> @js.Value = "(e) => e.error"