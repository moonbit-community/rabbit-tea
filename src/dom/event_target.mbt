///|
#external
type EventTarget

///|
pub trait IsEventTarget: @js.Cast {
  as_event_target(Self) -> EventTarget = _
  add_event_listener(Self, String, Listener) -> Unit = _
  remove_event_listener(Self, String, Listener) -> Unit = _
  dispatch_event(Self, Event) -> Unit = _
  to_clipboard(Self) -> Clipboard? = _
  to_node(Self) -> Node? = _
  to_document(Self) -> Document? = _
  to_document_fragment(Self) -> DocumentFragment? = _
  to_element(Self) -> Element? = _
  to_html_element(Self) -> HTMLElement? = _
  to_html_canvas_element(Self) -> HTMLCanvasElement? = _
  to_html_input_element(Self) -> HTMLInputElement? = _
  to_html_dialog_element(Self) -> HTMLDialogElement? = _
  to_html_image_element(Self) -> HTMLImageElement? = _
  to_html_select_element(Self) -> HTMLSelectElement? = _
  to_html_media_element(Self) -> HTMLMediaElement? = _
  to_html_video_element(Self) -> HTMLVideoElement? = _
  to_text(Self) -> Text? = _
  to_svg_element(Self) -> SVGElement? = _
  to_svg_graphics_element(Self) -> SVGGraphicsElement? = _
  to_svg_image_element(Self) -> SVGImageElement? = _
  to_window(Self) -> Window? = _
}

///|
pub typealias (Event) -> Unit as Listener

///|
pub impl IsEventTarget for EventTarget

///|
pub impl @js.Cast for EventTarget with into(value) {
  value |> ffi_to_event_target |> _.to_option()
}

///|
pub impl @js.Cast for EventTarget with from(value) {
  value |> js_identity
}

///|
impl IsEventTarget with add_event_listener(s, type_, callback) {
  s |> js_identity |> ffi_add_event_listener(type_, callback)
}

///|
impl IsEventTarget with remove_event_listener(s, type_, callback) {
  s |> js_identity |> ffi_remove_event_listener(type_, callback)
}

///|
impl IsEventTarget with dispatch_event(s, event) {
  s |> js_identity |> ffi_dispatch_event(event)
}

///|
impl IsEventTarget with as_event_target(s) {
  js_identity(s)
}

///|
impl IsEventTarget with to_clipboard(s) {
  s |> js_identity |> ffi_to_clipboard |> _.to_option()
}

///|
impl IsEventTarget with to_node(s) {
  s |> js_identity |> ffi_to_node |> _.to_option()
}

///|
impl IsEventTarget with to_document(s) {
  s |> js_identity |> ffi_to_document |> _.to_option()
}

///|
impl IsEventTarget with to_document_fragment(s) {
  s |> js_identity |> ffi_to_document_fragment |> _.to_option()
}

///|
impl IsEventTarget with to_element(s) {
  s |> js_identity |> ffi_to_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_element(s) {
  s |> js_identity |> ffi_to_html_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_canvas_element(s) {
  s |> js_identity |> ffi_to_html_canvas_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_input_element(s) {
  s |> js_identity |> ffi_to_html_input_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_dialog_element(s) {
  s |> js_identity |> ffi_to_html_dialog_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_image_element(s) {
  s |> js_identity |> ffi_to_html_image_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_select_element(s) {
  s |> js_identity |> ffi_to_html_select_element |> _.to_option()
}

///|
impl IsEventTarget with to_text(s) {
  s |> js_identity |> ffi_to_text |> _.to_option()
}

///|
impl IsEventTarget with to_svg_element(s) {
  s |> js_identity |> ffi_to_svg_element |> _.to_option()
}

///|
impl IsEventTarget with to_svg_graphics_element(s) {
  s |> js_identity |> ffi_to_svg_graphics_element |> _.to_option()
}

///|
impl IsEventTarget with to_svg_image_element(s) {
  s |> js_identity |> ffi_to_svg_image_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_media_element(s) {
  s |> js_identity |> ffi_to_html_media_element |> _.to_option()
}

///|
impl IsEventTarget with to_html_video_element(s) {
  s |> js_identity |> ffi_to_html_video_element |> _.to_option()
}

///|
impl IsEventTarget with to_window(s) {
  s |> js_identity |> ffi_to_window |> _.to_option()
}

///|
extern "js" fn ffi_to_node(x : @js.Value) -> @js.Nullable[Node] =
  #| (x) => x instanceof Node ? x : null

///|
extern "js" fn ffi_to_clipboard(x : @js.Value) -> @js.Nullable[Clipboard] =
  #| (x) => x instanceof Clipboard ? x : null

///|
extern "js" fn ffi_add_event_listener(
  x : @js.Value,
  type_ : String,
  callback : Listener,
) =
  #| (target, type, listener) => target.addEventListener(type, listener)

///|
extern "js" fn ffi_remove_event_listener(
  x : @js.Value,
  type_ : String,
  callback : Listener,
) =
  #| (target, type, listener) => target.removeEventListener(type, listener)

///|
extern "js" fn ffi_dispatch_event(x : @js.Value, event : Event) =
  #| (target, event) => target.dispatchEvent(event)

///|
extern "js" fn ffi_to_document(x : @js.Value) -> @js.Nullable[Document] =
  #| (x) => x.nodeType===9 ? x : null

///|
extern "js" fn ffi_to_document_fragment(
  x : @js.Value,
) -> @js.Nullable[DocumentFragment] =
  #| (x) => x.nodeType===11 ? x : null

///|
extern "js" fn ffi_to_element(x : @js.Value) -> @js.Nullable[Element] =
  #| (x) => x.nodeType===1 ? x : null

///|
extern "js" fn ffi_to_text(x : @js.Value) -> @js.Nullable[Text] =
  #| (x) => x.nodeType===3 ? x : null

///|
extern "js" fn ffi_to_html_element(x : @js.Value) -> @js.Nullable[HTMLElement] =
  #| (x) => x instanceof HTMLElement ? x : null

///|
extern "js" fn ffi_to_html_canvas_element(
  x : @js.Value,
) -> @js.Nullable[HTMLCanvasElement] =
  #| (x) => x instanceof HTMLCanvasElement ? x : null

///|
extern "js" fn ffi_to_html_input_element(
  x : @js.Value,
) -> @js.Nullable[HTMLInputElement] =
  #| (x) => x instanceof HTMLInputElement ? x : null

///|
extern "js" fn ffi_to_html_select_element(
  x : @js.Value,
) -> @js.Nullable[HTMLSelectElement] =
  #| (x) => x instanceof HTMLSelectElement ? x : null

///|
extern "js" fn ffi_to_html_dialog_element(
  x : @js.Value,
) -> @js.Nullable[HTMLDialogElement] =
  #| (x) => x instanceof HTMLDialogElement ? x : null

///|
extern "js" fn ffi_to_html_image_element(
  x : @js.Value,
) -> @js.Nullable[HTMLImageElement] =
  #| (x) => x instanceof HTMLImageElement ? x : null

///|
extern "js" fn ffi_to_event_target(x : @js.Value) -> @js.Nullable[EventTarget] =
  #| (self) => self instanceof EventTarget ? self : null

///|
extern "js" fn ffi_to_svg_element(x : @js.Value) -> @js.Nullable[SVGElement] = "(x) => x instanceof SVGElement ? x : null"

///|
extern "js" fn ffi_to_svg_graphics_element(
  x : @js.Value,
) -> @js.Nullable[SVGGraphicsElement] = "(x) => x instanceof SVGGraphicsElement ? x : null"

///|
extern "js" fn ffi_to_svg_image_element(
  x : @js.Value,
) -> @js.Nullable[SVGImageElement] = "(x) => x instanceof SVGImageElement ? x : null"

///|

///|
extern "js" fn ffi_to_html_video_element(
  x : @js.Value,
) -> @js.Nullable[HTMLVideoElement] = "(x) => x instanceof HTMLVideoElement ? x : null"

///|
extern "js" fn ffi_to_window(value : @js.Value) -> @js.Nullable[Window] = "(value) => value instanceof Window ? value : null"
