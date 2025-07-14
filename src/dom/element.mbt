///|
#external
type Element

///|
pub trait IsElement: IsNode {
  as_element(Self) -> Element = _
  get_children(Self) -> Array[Element] = _
  set_attribute(Self, String, String) -> Unit = _
  get_attribute(Self, String) -> String = _
  remove_attribute(Self, String) -> Unit = _
  set_property(Self, String, @js.Value) -> Unit = _
  get_property(Self, String) -> String = _
  remove_property(Self, String) -> Unit = _
  scroll_into_view(Self) -> Unit = _
  get_scroll_top(Self) -> Double = _
  set_scroll_top(Self, Double) -> Unit = _
  get_scroll_left(Self) -> Double = _
  set_scroll_left(Self, Double) -> Unit = _
  get_scroll_width(Self) -> Double = _
  get_scroll_height(Self) -> Double = _
  set_inner_html(Self, String) -> Unit = _
  get_bounding_client_rect(Self) -> DOMRect = _
}

///|
pub impl IsEventTarget for Element

///|
pub impl @js.Cast for Element with into(value) {
  value |> ffi_to_element |> _.to_option()
}

///|
pub impl @js.Cast for Element with from(value) {
  value |> js_identity
}

///|
pub impl IsNode for Element

///|
pub impl IsElement for Element

///|
impl IsElement with as_element(s) {
  js_identity(s)
}

///|
impl IsElement with get_children(s) {
  s |> js_identity |> ffi_element_children
}

///|
impl IsElement with set_attribute(s, attr, value) {
  s |> js_identity |> ffi_element_set_attribute(attr, value)
}

///|
impl IsElement with get_attribute(s, attr) {
  s |> js_identity |> ffi_element_get_attribute(attr)
}

///|
impl IsElement with remove_attribute(s, attr) {
  s |> js_identity |> ffi_element_remove_attribute(attr)
}

///|
impl IsElement with set_property(s, prop, value) {
  s |> js_identity |> ffi_element_set_property(prop, value)
}

///|
impl IsElement with get_property(s, prop) {
  s |> js_identity |> ffi_element_get_property(prop)
}

///|
impl IsElement with remove_property(s, prop) {
  s |> js_identity |> ffi_element_remove_property(prop)
}

///|
impl IsElement with scroll_into_view(s) {
  s |> js_identity |> ffi_element_scroll_into_view
}

///|
impl IsElement with get_scroll_top(s) {
  s |> js_identity |> ffi_element_get_scroll_top
}

///|
impl IsElement with set_scroll_top(s, value) {
  s |> js_identity |> ffi_element_set_scroll_top(value)
}

///|
impl IsElement with get_scroll_left(s) {
  s |> js_identity |> ffi_element_get_scroll_left
}

///|
impl IsElement with set_scroll_left(s, value) {
  s |> js_identity |> ffi_element_set_scroll_left(value)
}

///|
impl IsElement with get_scroll_width(s) {
  s |> js_identity |> ffi_element_get_scroll_width
}

///|
impl IsElement with get_scroll_height(s) {
  s |> js_identity |> ffi_element_get_scroll_height
}

///|
impl IsElement with set_inner_html(s, html) {
  s |> js_identity |> ffi_element_set_inner_html(html)
}

///|
impl IsElement with get_bounding_client_rect(s) {
  s |> js_identity |> ffi_element_get_bounding_client_rect
}

///|
extern "js" fn ffi_element_children(x : @js.Value) -> Array[Element] =
  #| (self) => self.children

// NOTE: The DOM tree also includes the TEXT_NODE, which is not an element.
// Therefore, a vdom patch algorithm should not be based on the ffi above.
// https://dom.spec.whatwg.org/#ref-for-dom-node-nodetype%E2%91%A0

///|
extern "js" fn ffi_element_set_attribute(
  x : @js.Value,
  attr : String,
  value : String
) = "(self,attr,value) => self.setAttribute(attr, value)"

///|
extern "js" fn ffi_element_get_attribute(
  x : @js.Value,
  attr : String
) -> String = "(self,attr) => self.getAttribute(attr)"

///|
extern "js" fn ffi_element_remove_attribute(x : @js.Value, attr : String) = "(self,attr) => self.removeAttribute(attr)"

///| 
extern "js" fn ffi_element_set_property(
  x : @js.Value,
  prop : String,
  value : @js.Value
) = "(self,prop,value) => self[prop] = value"

///|
extern "js" fn ffi_element_remove_property(x : @js.Value, prop : String) = "(self,prop) => delete self[prop]"

///|
extern "js" fn ffi_element_get_property(x : @js.Value, prop : String) -> String = "(self,prop) => self[prop]"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView
extern "js" fn ffi_element_scroll_into_view(x : @js.Value) = "(self) => self.scrollIntoView()"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollTop
extern "js" fn ffi_element_get_scroll_top(x : @js.Value) -> Double = "(self) => self.scrollTop"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollTop
extern "js" fn ffi_element_set_scroll_top(x : @js.Value, value : Double) = "(s,v) => s.scrollTop = v"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollLeft
extern "js" fn ffi_element_get_scroll_left(x : @js.Value) -> Double = "(self) => self.scrollLeft"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollLeft
extern "js" fn ffi_element_set_scroll_left(x : @js.Value, value : Double) = "(s,v) => s.scrollLeft = v"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollWidth
extern "js" fn ffi_element_get_scroll_width(x : @js.Value) -> Double = "(self) => self.scrollWidth"

///| https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollHeight
extern "js" fn ffi_element_get_scroll_height(x : @js.Value) -> Double = "(self) => self.scrollHeight"

///|
extern "js" fn ffi_element_set_inner_html(x : @js.Value, html : String) -> Unit = "(self,html) => self.innerHTML = html"

///|
extern "js" fn ffi_element_get_bounding_client_rect(x : @js.Value) -> DOMRect =
  #| (self) => self.getBoundingClientRect()
