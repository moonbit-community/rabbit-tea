///| https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent
type CustomEvent

///|
pub impl IsEvent for CustomEvent

///|
pub extern "js" fn CustomEvent::new(
  type_ : String,
  detail~ : @js.Optional[@js.Value] = @js.Optional::undefined()
) -> CustomEvent = "(type, detail) => new CustomEvent(type, { detail: detail })"

///|
pub extern "js" fn CustomEvent::get_detail(self : Self) -> @js.Value = "(e) => e.detail"
