///|
#external
type UIEvent

///|
pub trait IsUIEvent: IsEvent {
  as_ui_event(Self) -> UIEvent = _
}

///|
impl IsUIEvent with as_ui_event(s) {
  s |> js_identity
}

///|
pub impl IsEvent for UIEvent

///|
pub impl IsUIEvent for UIEvent

///|
pub impl @js.Cast for UIEvent with into(value) {
  value |> ffi_to_ui_event |> _.to_option()
}

///|
pub impl @js.Cast for UIEvent with from(value) {
  value |> js_identity
}
