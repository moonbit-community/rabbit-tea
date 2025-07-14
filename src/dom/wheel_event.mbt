///|
type WheelEvent

///|
pub impl IsEvent for WheelEvent

///|
pub impl IsUIEvent for WheelEvent

///|
pub impl IsMouseEvent for WheelEvent

///|
pub impl @js.Cast for WheelEvent with into(value) {
  value |> ffi_to_wheel_event |> _.to_option()
}

///|
pub impl @js.Cast for WheelEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn WheelEvent::get_delta_x(self : Self) -> Double = "(e) => e.deltaX"

///|
pub extern "js" fn WheelEvent::get_delta_y(self : Self) -> Double = "(e) => e.deltaY"

///|
pub extern "js" fn WheelEvent::get_delta_z(self : Self) -> Double = "(e) => e.deltaZ"

///|
pub extern "js" fn WheelEvent::get_delta_mode(self : Self) -> Int = "(e) => e.deltaMode"
