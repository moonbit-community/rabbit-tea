///|
#external
type FocusEvent

///|
pub impl IsEvent for FocusEvent

///|
pub impl IsUIEvent for FocusEvent

///|
pub impl @js.Cast for FocusEvent with into(value) {
  value |> ffi_to_focus_event |> _.to_option()
}

///|
pub impl @js.Cast for FocusEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn FocusEvent::related_target(self : Self) -> EventTarget = "(e) => e.relatedTarget"
