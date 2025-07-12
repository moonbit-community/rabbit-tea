///|
#external
type MouseEvent

///|
pub trait IsMouseEvent: IsUIEvent {
  as_mouse_event(Self) -> MouseEvent = _
  get_alt_key(Self) -> Bool = _
  get_button(Self) -> Int = _
  get_buttons(Self) -> Int = _
  get_client_x(Self) -> Int = _
  get_client_y(Self) -> Int = _
  get_ctrl_key(Self) -> Bool = _
  get_meta_key(Self) -> Bool = _
  get_movement_x(Self) -> Int = _
  get_movement_y(Self) -> Int = _
  get_offset_x(Self) -> Int = _
  get_offset_y(Self) -> Int = _
  get_page_x(Self) -> Int = _
  get_page_y(Self) -> Int = _
  get_related_target(Self) -> EventTarget = _
  get_screen_x(Self) -> Int = _
  get_screen_y(Self) -> Int = _
  get_shift_key(Self) -> Bool = _
  get_x(Self) -> Int = _
  get_y(Self) -> Int = _
  get_modifier_state(Self) -> Int = _
}

///|
pub impl IsEvent for MouseEvent

///|
pub impl IsUIEvent for MouseEvent

///|
pub impl IsMouseEvent for MouseEvent

///|
impl IsMouseEvent with as_mouse_event(s) {
  s |> js_identity
}

///|
impl IsMouseEvent with get_alt_key(s) {
  s |> js_identity |> ffi_mouse_event_alt_key
}

///|
impl IsMouseEvent with get_button(s) {
  s |> js_identity |> ffi_mouse_event_button
}

///|
impl IsMouseEvent with get_buttons(s) {
  s |> js_identity |> ffi_mouse_event_buttons
}

///|
impl IsMouseEvent with get_client_x(s) {
  s |> js_identity |> ffi_mouse_event_client_x
}

///|
impl IsMouseEvent with get_client_y(s) {
  s |> js_identity |> ffi_mouse_event_client_y
}

///|
impl IsMouseEvent with get_ctrl_key(s) {
  s |> js_identity |> ffi_mouse_event_ctrl_key
}

///|
impl IsMouseEvent with get_meta_key(s) {
  s |> js_identity |> ffi_mouse_event_meta_key
}

///|
impl IsMouseEvent with get_movement_x(s) {
  s |> js_identity |> ffi_mouse_event_movement_x
}

///|
impl IsMouseEvent with get_movement_y(s) {
  s |> js_identity |> ffi_mouse_event_movement_y
}

///|
impl IsMouseEvent with get_offset_x(s) {
  s |> js_identity |> ffi_mouse_event_offset_x
}

///|
impl IsMouseEvent with get_offset_y(s) {
  s |> js_identity |> ffi_mouse_event_offset_y
}

///|
impl IsMouseEvent with get_page_x(s) {
  s |> js_identity |> ffi_mouse_event_page_x
}

///|
impl IsMouseEvent with get_page_y(s) {
  s |> js_identity |> ffi_mouse_event_page_y
}

///|
impl IsMouseEvent with get_related_target(s) {
  s |> js_identity |> ffi_mouse_event_related_target
}

///|
impl IsMouseEvent with get_screen_x(s) {
  s |> js_identity |> ffi_mouse_event_screen_x
}

///|
impl IsMouseEvent with get_screen_y(s) {
  s |> js_identity |> ffi_mouse_event_screen_y
}

///|
impl IsMouseEvent with get_shift_key(s) {
  s |> js_identity |> ffi_mouse_event_shift_key
}

///|
impl IsMouseEvent with get_x(s) {
  s |> js_identity |> ffi_mouse_event_x
}

///|
impl IsMouseEvent with get_y(s) {
  s |> js_identity |> ffi_mouse_event_y
}

///|
impl IsMouseEvent with get_modifier_state(s) {
  s |> js_identity |> ffi_mouse_event_modifier_state
}

///|
extern "js" fn ffi_mouse_event_screen_x(e : @js.Value) -> Int = "(e) => e.screenX"

///|
extern "js" fn ffi_mouse_event_screen_y(e : @js.Value) -> Int = "(e) => e.screenY"

///|
extern "js" fn ffi_mouse_event_client_x(e : @js.Value) -> Int = "(e) => e.clientX"

///|
extern "js" fn ffi_mouse_event_client_y(e : @js.Value) -> Int = "(e) => e.clientY"

///|
extern "js" fn ffi_mouse_event_offset_x(e : @js.Value) -> Int = "(e) => e.offsetX"

///|
extern "js" fn ffi_mouse_event_offset_y(e : @js.Value) -> Int = "(e) => e.offsetY"

///|
extern "js" fn ffi_mouse_event_ctrl_key(e : @js.Value) -> Bool = "(e) => e.ctrlKey"

///|
extern "js" fn ffi_mouse_event_shift_key(e : @js.Value) -> Bool = "(e) => e.shiftKey"

///|
extern "js" fn ffi_mouse_event_alt_key(e : @js.Value) -> Bool = "(e) => e.altKey"

///|
extern "js" fn ffi_mouse_event_meta_key(e : @js.Value) -> Bool = "(e) => e.metaKey"

///|
extern "js" fn ffi_mouse_event_button(e : @js.Value) -> Int = "(e) => e.button"

///|
extern "js" fn ffi_mouse_event_buttons(e : @js.Value) -> Int = "(e) => e.buttons"

///|
extern "js" fn ffi_mouse_event_movement_x(e : @js.Value) -> Int = "(e) => e.movementX"

///|
extern "js" fn ffi_mouse_event_movement_y(e : @js.Value) -> Int = "(e) => e.movementY"

///|
extern "js" fn ffi_mouse_event_page_x(e : @js.Value) -> Int = "(e) => e.pageX"

///|
extern "js" fn ffi_mouse_event_page_y(e : @js.Value) -> Int = "(e) => e.pageY"

///|
extern "js" fn ffi_mouse_event_related_target(e : @js.Value) -> EventTarget = "(e) => e.relatedTarget"

///|
extern "js" fn ffi_mouse_event_x(e : @js.Value) -> Int = "(e) => e.x"

///|
extern "js" fn ffi_mouse_event_y(e : @js.Value) -> Int = "(e) => e.y"

///|
extern "js" fn ffi_mouse_event_modifier_state(e : @js.Value) -> Int = "(e) => e.getModifierState()"
