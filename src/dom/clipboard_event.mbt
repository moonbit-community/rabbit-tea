///|
#external
type ClipboardEvent

///|
pub impl IsEvent for ClipboardEvent

///|
pub extern "js" fn ClipboardEvent::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
