///|
type DragEvent

///|
pub impl IsEvent for DragEvent

///|
pub impl IsUIEvent for DragEvent

///|
pub impl IsMouseEvent for DragEvent

///|
pub extern "js" fn DragEvent::get_data_transfer(self : Self) -> DataTransfer = "(e) => e.dataTransfer"
