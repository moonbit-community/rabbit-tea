///|
#external
type Event

///|
fn[A, B] js_identity(a : A) -> B {
  @js.Value::cast_from(a).cast()
}

///|
pub trait IsEvent {
  target(Self) -> EventTarget = _
  prevent_default(Self) -> Unit = _
  stop_propagation(Self) -> Unit = _
  as_event(Self) -> Event = _
  to_ui_event(Self) -> UIEvent? = _
  to_clipboard_event(Self) -> ClipboardEvent? = _
  to_mouse_event(Self) -> MouseEvent? = _
  to_input_event(Self) -> MouseEvent? = _
  to_focus_event(Self) -> MouseEvent? = _
  to_keyboard_event(Self) -> KeyboardEvent? = _
  to_animation_event(Self) -> AnimationEvent? = _
  to_before_unload_event(Self) -> BeforeUnloadEvent? = _
  to_blob_event(Self) -> BlobEvent? = _
  to_close_event(Self) -> CloseEvent? = _
  to_composition_event(Self) -> CompositionEvent? = _
  to_custom_event(Self) -> CustomEvent? = _
  to_drag_event(Self) -> DragEvent? = _
  to_wheel_event(Self) -> WheelEvent? = _
}

///|
pub impl IsEvent for Event

///|
impl IsEvent with target(s) {
  s |> js_identity |> ffi_event_target
}

///|
impl IsEvent with prevent_default(s) {
  s.as_event() |> ffi_event_prevent_default
}

///|
impl IsEvent with stop_propagation(s) {
  s.as_event() |> ffi_event_stop_propagation
}

///|
impl IsEvent with as_event(s) {
  js_identity(s)
}

///|
impl IsEvent with to_ui_event(s) {
  s |> js_identity |> ffi_to_ui_event |> _.to_option()
}

///|
impl IsEvent with to_clipboard_event(s) {
  s |> js_identity |> ffi_to_clipboard_event |> _.to_option()
}

///|
impl IsEvent with to_mouse_event(s) {
  s |> js_identity |> ffi_to_mouse_event |> _.to_option()
}

///|
impl IsEvent with to_input_event(s) {
  s |> js_identity |> ffi_to_input_event |> _.to_option()
}

///|
impl IsEvent with to_focus_event(s) {
  s |> js_identity |> ffi_to_focus_event |> _.to_option()
}

///|
impl IsEvent with to_keyboard_event(s) {
  s |> js_identity |> ffi_to_keyboard_event |> _.to_option()
}

///|
impl IsEvent with to_animation_event(s) {
  s |> js_identity |> ffi_to_animation_event |> _.to_option()
}

///|
impl IsEvent with to_before_unload_event(s) {
  s |> js_identity |> ffi_to_before_unload_event |> _.to_option()
}

///|
impl IsEvent with to_blob_event(s) {
  s |> js_identity |> ffi_to_blob_event |> _.to_option()
}

///|
impl IsEvent with to_close_event(s) {
  s |> js_identity |> ffi_to_close_event |> _.to_option()
}

///|
impl IsEvent with to_composition_event(s) {
  s |> js_identity |> ffi_to_composition_event |> _.to_option()
}

///|
impl IsEvent with to_custom_event(s) {
  s |> js_identity |> ffi_to_custom_event |> _.to_option()
}

///|
impl IsEvent with to_drag_event(s) {
  s |> js_identity |> ffi_to_drag_event |> _.to_option()
}

///|
impl IsEvent with to_wheel_event(s) {
  s |> js_identity |> ffi_to_wheel_event |> _.to_option()
}

///|
extern "js" fn ffi_event_target(x : @js.Value) -> EventTarget = "(self) => self.target"

///|
extern "js" fn ffi_to_ui_event(x : @js.Value) -> @js.Nullable[UIEvent] =
  #| (x) => x instanceof UIEvent ? x : null

///|
extern "js" fn ffi_to_clipboard_event(
  x : @js.Value
) -> @js.Nullable[ClipboardEvent] =
  #| (x) => x instanceof ClipboardEvent ? x : null

///|
extern "js" fn ffi_event_prevent_default(x : Event) = "(self) => self.preventDefault()"

///|
extern "js" fn ffi_event_stop_propagation(x : Event) = "(self) => self.stopPropagation()"

///|
extern "js" fn ffi_to_mouse_event(x : @js.Value) -> @js.Nullable[MouseEvent] =
  #| (e) => e instanceof MouseEvent ? e : null

///|
extern "js" fn ffi_to_input_event(x : @js.Value) -> @js.Nullable[MouseEvent] =
  #| (e) => e instanceof InputEvent ? e : null

///|
extern "js" fn ffi_to_focus_event(x : @js.Value) -> @js.Nullable[MouseEvent] =
  #| (e) => e instanceof FocusEvent ? e : null

///|
extern "js" fn ffi_to_keyboard_event(
  x : @js.Value
) -> @js.Nullable[KeyboardEvent] =
  #| (e) => e instanceof KeyboardEvent ? e : null

///|
extern "js" fn ffi_to_animation_event(
  x : @js.Value
) -> @js.Nullable[AnimationEvent] =
  #| (e) => e instanceof AnimationEvent ? e : null

///|
extern "js" fn ffi_to_before_unload_event(
  x : @js.Value
) -> @js.Nullable[BeforeUnloadEvent] =
  #| (e) => e instanceof BeforeUnloadEvent ? e : null

///|
extern "js" fn ffi_to_blob_event(x : @js.Value) -> @js.Nullable[BlobEvent] =
  #| (e) => e instanceof BlobEvent ? e : null

///|
extern "js" fn ffi_to_close_event(x : @js.Value) -> @js.Nullable[CloseEvent] =
  #| (e) => e instanceof CloseEvent ? e : null

///|
extern "js" fn ffi_to_composition_event(
  x : @js.Value
) -> @js.Nullable[CompositionEvent] =
  #| (e) => e instanceof CompositionEvent ? e : null

///|
extern "js" fn ffi_to_custom_event(x : @js.Value) -> @js.Nullable[CustomEvent] =
  #| (e) => e instanceof CustomEvent ? e : null

///|
extern "js" fn ffi_to_drag_event(x : @js.Value) -> @js.Nullable[DragEvent] =
  #| (e) => e instanceof DragEvent ? e : null

///|
extern "js" fn ffi_to_wheel_event(x : @js.Value) -> @js.Nullable[WheelEvent] =
  #| (e) => e instanceof WheelEvent ? e : null
