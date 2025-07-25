///| https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent
type CustomEvent

///|
pub impl IsEvent for CustomEvent

///|
pub impl @js.Cast for CustomEvent with into(value) {
  value |> ffi_to_custom_event |> _.to_option()
}

///|
pub impl @js.Cast for CustomEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn CustomEvent::new(
  type_ : String,
  detail~ : @js.Optional[@js.Value] = @js.Optional::undefined(),
) -> CustomEvent = "(type, detail) => new CustomEvent(type, { detail: detail })"

///|
pub extern "js" fn CustomEvent::get_detail(self : Self) -> @js.Value = "(e) => e.detail"
