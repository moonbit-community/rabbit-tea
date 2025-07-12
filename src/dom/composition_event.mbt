///| https://developer.mozilla.org/en-US/docs/Web/API/CompositionEvent
type CompositionEvent

///|
pub impl IsEvent for CompositionEvent

///|
pub impl IsUIEvent for CompositionEvent

///|
pub extern "js" fn CompositionEvent::new() -> CompositionEvent = "() => new CompositionEvent()"

///|
pub extern "js" fn CompositionEvent::get_data(self : Self) -> String = "(e) => e.data"
