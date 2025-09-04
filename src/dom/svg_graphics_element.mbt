///|
/// https://developer.mozilla.org/en-US/docs/Web/API/SVGGraphicsElement
type SVGGraphicsElement

///|
pub impl IsEventTarget for SVGGraphicsElement

///|
pub impl IsNode for SVGGraphicsElement

///|
pub impl IsElement for SVGGraphicsElement

///|
pub impl IsSVGElement for SVGGraphicsElement

///|
pub impl IsSVGGraphicsElement for SVGGraphicsElement

///|
pub trait IsSVGGraphicsElement: IsSVGElement {
  as_svg_graphics_element(Self) -> SVGGraphicsElement = _
  get_required_extensions(Self) -> String = _
  get_system_language(Self) -> SVGStringList = _
  get_transform(Self) -> SVGAnimatedTransformList = _
  get_bbox(Self) -> DOMRect = _
  get_ctm(Self) -> DOMMatrix = _
  get_screen_ctm(Self) -> DOMMatrix = _
}

///|
pub impl @js.Cast for SVGGraphicsElement with into(value) {
  value |> ffi_to_svg_graphics_element |> _.to_option()
}

///|
pub impl @js.Cast for SVGGraphicsElement with from(value) {
  value |> js_identity
}

///|
type SVGStringList

///|
type SVGAnimatedTransformList

///|
type DOMMatrix

///|
impl IsSVGGraphicsElement with as_svg_graphics_element(s) {
  s |> js_identity
}

///|
impl IsSVGGraphicsElement with get_required_extensions(s) {
  s |> js_identity |> ffi_get_required_extensions
}

///|
impl IsSVGGraphicsElement with get_system_language(s) {
  s |> js_identity |> ffi_get_system_language
}

///|
impl IsSVGGraphicsElement with get_transform(s) {
  s |> js_identity |> ffi_get_transform
}

///|
impl IsSVGGraphicsElement with get_bbox(s) {
  s |> js_identity |> ffi_get_bbox
}

///|
impl IsSVGGraphicsElement with get_ctm(s) {
  s |> js_identity |> ffi_get_ctm
}

///|
impl IsSVGGraphicsElement with get_screen_ctm(s) {
  s |> js_identity |> ffi_get_screen_ctm
}

///|
extern "js" fn ffi_get_required_extensions(s : @js.Value) -> String = "(self) => self.requiredExtensions"

///|
extern "js" fn ffi_get_system_language(s : @js.Value) -> SVGStringList = "(self) => self.systemLanguage"

///|
extern "js" fn ffi_get_transform(s : @js.Value) -> SVGAnimatedTransformList = "(self) => self.transform"

///|
extern "js" fn ffi_get_bbox(s : @js.Value) -> DOMRect = "(self) => self.getBBox()"

///|
extern "js" fn ffi_get_ctm(s : @js.Value) -> DOMMatrix = "(self) => self.getCTM()"

///|
extern "js" fn ffi_get_screen_ctm(s : @js.Value) -> DOMMatrix = "(self) => self.getScreenCTM()"
