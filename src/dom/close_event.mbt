///| https://developer.mozilla.org/en-US/docs/Web/API/CloseEvent
type CloseEvent

///|
pub impl IsEvent for CloseEvent

///|
pub extern "js" fn CloseEvent::get_code(self : Self) -> Int = "(e) => e.code"

///|
pub extern "js" fn CloseEvent::get_reason(self : Self) -> String = "(e) => e.reason"

///|
pub extern "js" fn CloseEvent::get_was_clean(self : Self) -> Bool = "(e) => e.wasClean"
