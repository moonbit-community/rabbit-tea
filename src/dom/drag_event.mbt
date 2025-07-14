///|
type DragEvent

///|
pub impl IsEvent for DragEvent

///|
pub impl IsUIEvent for DragEvent

///|
pub impl IsMouseEvent for DragEvent

///|
pub impl @js.Cast for DragEvent with into(value) {
  value |> ffi_to_drag_event |> _.to_option()
}

///|
pub impl @js.Cast for DragEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn DragEvent::get_data_transfer(self : Self) -> DataTransfer = "(e) => e.dataTransfer"
