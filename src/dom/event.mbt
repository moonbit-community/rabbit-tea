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
}

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
pub impl IsEvent for Event

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
