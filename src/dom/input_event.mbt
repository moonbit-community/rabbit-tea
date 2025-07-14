///|
#external
type InputEvent

///|
pub impl IsEvent for InputEvent

///|
pub impl IsUIEvent for InputEvent

///|
pub impl @js.Cast for InputEvent with into(value) {
  value |> ffi_to_input_event |> _.to_option()
}

///|
pub impl @js.Cast for InputEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn InputEvent::data(self : Self) -> String = "(e) => e.data"

///|
pub extern "js" fn InputEvent::is_composing(self : Self) -> Bool = "(e) => e.isComposing"

///|
pub extern "js" fn InputEvent::input_type(self : Self) -> String = "(e) => e.inputType"
