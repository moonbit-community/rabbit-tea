///|
#external
type DOMException

///|
pub extern "js" fn DOMException::get_message(self : Self) -> String = "(self) => self.message"

///|
pub extern "js" fn DOMException::get_name(self : Self) -> String = "(self) => self.name"

///|
pub extern "js" fn DOMException::new() -> DOMException = "() => new DOMException()"

///|
pub extern "js" fn DOMException::new_with_message(
  message : String
) -> DOMException = "(message) => new DOMException(message)"

///|
pub extern "js" fn DOMException::new_with_message_and_name(
  message : String,
  name : String
) -> DOMException = "(message,name) => new DOMException(message, name)"
