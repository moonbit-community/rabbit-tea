///| https://developer.mozilla.org/en-US/docs/Web/API/SVGElement
type SVGElement

///|
pub impl IsEventTarget for SVGElement

///|
pub impl IsNode for SVGElement

///|
pub impl IsElement for SVGElement

///|
pub impl IsSVGElement for SVGElement

///|
type StylePropertyMap

///|
type DOMStringMap

///|
type CSSStyleDeclaration

///|
pub trait IsSVGElement: IsElement {
  as_svg_element(Self) -> SVGElement = _
  get_attribute_style_map(Self) -> StylePropertyMap = _
  get_auto_focus(Self) -> Bool = _
  set_auto_focus(Self, Bool) -> Unit = _
  get_data_set(Self) -> DOMStringMap = _
  get_nonce(Self) -> String = _
  set_nonce(Self, String) -> Unit = _
  get_owner_svg_element(Self) -> SVGElement? = _
  get_style(Self) -> CSSStyleDeclaration = _
  set_style(Self, CSSStyleDeclaration) -> Unit = _
  get_tab_index(Self) -> Int = _
  set_tab_index(Self, Int) -> Unit = _
  get_viewport_element(Self) -> SVGElement? = _
  blur(Self) -> Unit = _
  focus(Self) -> Unit = _
}

///|
pub impl @js.Cast for SVGElement with into(value) {
  value |> ffi_to_svg_element |> _.to_option()
}

///|
pub impl @js.Cast for SVGElement with from(value) {
  value |> js_identity
}

///|
impl IsSVGElement with as_svg_element(s) {
  s |> js_identity
}

///|
impl IsSVGElement with get_attribute_style_map(s) {
  s |> js_identity |> ffi_get_attribute_style_map
}

///|
impl IsSVGElement with get_auto_focus(s) {
  s |> js_identity |> get_auto_focus
}

///|
impl IsSVGElement with set_auto_focus(s, value) {
  s |> js_identity |> set_auto_focus(value)
}

///|
impl IsSVGElement with get_data_set(s) {
  s |> js_identity |> get_data_set
}

///|
impl IsSVGElement with get_nonce(s) {
  s |> js_identity |> get_nonce
}

///|
impl IsSVGElement with set_nonce(s, value) {
  s |> js_identity |> set_nonce(value)
}

///|
impl IsSVGElement with get_owner_svg_element(s) {
  s |> js_identity |> get_owner_svg_element |> _.to_option()
}

///|
impl IsSVGElement with get_style(s) {
  s |> js_identity |> get_style
}

///|
impl IsSVGElement with set_style(s, style) {
  s |> js_identity |> set_style(style)
}

///|
impl IsSVGElement with get_tab_index(s) {
  s |> js_identity |> get_tab_index
}

///|
impl IsSVGElement with set_tab_index(s, value) {
  s |> js_identity |> set_tab_index(value)
}

///|
impl IsSVGElement with get_viewport_element(s) {
  s |> js_identity |> get_viewport_element |> _.to_option()
}

///|
impl IsSVGElement with blur(s) {
  s |> js_identity |> blur
}

///|
impl IsSVGElement with focus(s) {
  s |> js_identity |> focus
}

///|
extern "js" fn ffi_get_attribute_style_map(x : @js.Value) -> StylePropertyMap = "(self) => self.style"

///|
extern "js" fn get_auto_focus(x : @js.Value) -> Bool = "(self) => self.autofocus"

///|
extern "js" fn set_auto_focus(x : @js.Value, value : Bool) = "(self, value) => self.autofocus = value"

///|
extern "js" fn get_data_set(x : @js.Value) -> DOMStringMap = "(self) => self.dataset"

///|
extern "js" fn get_nonce(x : @js.Value) -> String = "(self) => self.nonce"

///|
extern "js" fn set_nonce(x : @js.Value, value : String) = "(self, value) => self.nonce = value"

///|
extern "js" fn get_owner_svg_element(x : @js.Value) -> @js.Optional[SVGElement] = "(self) => self.ownerSVGElement"

///|
extern "js" fn get_style(x : @js.Value) -> CSSStyleDeclaration = "(self) => self.style"

///|
extern "js" fn set_style(x : @js.Value, style : CSSStyleDeclaration) = "(self, style) => self.style = style"

///|
extern "js" fn get_tab_index(x : @js.Value) -> Int = "(self) => self.tabIndex"

///|
extern "js" fn set_tab_index(x : @js.Value, value : Int) = "(self, value) => self.tabIndex = value"

///|
extern "js" fn get_viewport_element(x : @js.Value) -> @js.Optional[SVGElement] = "(self) => self.viewportElement"

///|
extern "js" fn blur(x : @js.Value) = "(self) => self.blur()"

///|
extern "js" fn focus(x : @js.Value) = "(self) => self.focus()"
