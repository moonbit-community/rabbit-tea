///| https://developer.mozilla.org/en-US/docs/Web/API/BlobEvent
type BlobEvent

///|
pub impl IsEvent for BlobEvent

///|
pub extern "js" fn BlobEvent::new() -> BlobEvent = "() => new BlobEvent()"

///|
pub extern "js" fn BlobEvent::get_data(self : Self) -> Blob = "(e) => e.data"

///|
pub extern "js" fn BlobEvent::get_timecode(self : Self) -> DOMHighResTimeStamp = "(e) => e.timecode"
