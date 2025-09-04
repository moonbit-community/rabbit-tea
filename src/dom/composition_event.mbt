///|
/// https://developer.mozilla.org/en-US/docs/Web/API/CompositionEvent
type CompositionEvent

///|
pub impl IsEvent for CompositionEvent

///|
pub impl IsUIEvent for CompositionEvent

///|
pub impl @js.Cast for CompositionEvent with into(value) {
  value |> ffi_to_composition_event |> _.to_option()
}

///|
pub impl @js.Cast for CompositionEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn CompositionEvent::new() -> CompositionEvent = "() => new CompositionEvent()"

///|
pub extern "js" fn CompositionEvent::get_data(self : Self) -> String = "(e) => e.data"
