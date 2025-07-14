///|
#external
type ClipboardEvent

///|
pub impl IsEvent for ClipboardEvent

///|
pub impl @js.Cast for ClipboardEvent with into(value) {
  value |> ffi_to_clipboard_event |> _.to_option()
}

///|
pub impl @js.Cast for ClipboardEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn ClipboardEvent::clipboard_data(self : Self) -> DataTransfer = "(e) => e.clipboardData"
