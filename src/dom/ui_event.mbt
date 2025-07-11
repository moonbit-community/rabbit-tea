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
