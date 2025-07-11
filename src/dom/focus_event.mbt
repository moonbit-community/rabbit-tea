///|
#external
type FocusEvent

///|
pub impl IsEvent for FocusEvent

///|
pub impl IsUIEvent for FocusEvent

///|
pub extern "js" fn FocusEvent::related_target(self : Self) -> EventTarget = "(e) => e.relatedTarget"
