///|
type WheelEvent

///|
pub impl IsEvent for WheelEvent

///|
pub impl IsUIEvent for WheelEvent

///|
pub impl IsMouseEvent for WheelEvent

///|
pub extern "js" fn WheelEvent::get_delta_x(self : Self) -> Double = "(e) => e.deltaX"

///|
pub extern "js" fn WheelEvent::get_delta_y(self : Self) -> Double = "(e) => e.deltaY"

///|
pub extern "js" fn WheelEvent::get_delta_z(self : Self) -> Double = "(e) => e.deltaZ"

///|
pub extern "js" fn WheelEvent::get_delta_mode(self : Self) -> Int = "(e) => e.deltaMode"
