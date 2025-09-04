///|
/// https://developer.mozilla.org/en-US/docs/Web/API/BeforeUnloadEvent
type BeforeUnloadEvent

///|
pub impl IsEvent for BeforeUnloadEvent

///|
pub impl @js.Cast for BeforeUnloadEvent with into(value) {
  value |> ffi_to_before_unload_event |> _.to_option()
}

///|
pub impl @js.Cast for BeforeUnloadEvent with from(value) {
  value |> js_identity
}
