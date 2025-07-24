///| https://developer.mozilla.org/en-US/docs/Web/API/TransitionEvent
#external
type TransitionEvent

///|
pub impl IsEvent for TransitionEvent

///|
pub impl @js.Cast for TransitionEvent with into(value) {
  value |> ffi_to_transition_event |> _.to_option()
}

///|
pub impl @js.Cast for TransitionEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn TransitionEvent::get_property_name(self : Self) -> String = "(e) => e.propertyName"

///|
pub extern "js" fn TransitionEvent::get_elapsed_time(self : Self) -> Double = "(e) => e.elapsedTime"

///|
pub extern "js" fn TransitionEvent::get_pseudo_element(self : Self) -> String = "(e) => e.pseudoElement"