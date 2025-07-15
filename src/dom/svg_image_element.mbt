///|
#external
type SVGImageElement

///|
pub impl IsEventTarget for SVGImageElement

///|
pub impl IsNode for SVGImageElement

///|
pub impl IsElement for SVGImageElement

///|
pub impl IsSVGElement for SVGImageElement

///|
pub impl @js.Cast for SVGImageElement with into(value) {
  value |> ffi_to_svg_image_element |> _.to_option()
}

///|
pub impl @js.Cast for SVGImageElement with from(value) {
  value |> js_identity
}
