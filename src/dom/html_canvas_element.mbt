///|
#external
type HTMLCanvasElement

///|
pub impl IsEventTarget for HTMLCanvasElement

///|
pub impl @js.Cast for HTMLCanvasElement with into(value) {
  value |> ffi_to_html_canvas_element |> _.to_option()
}

///|
pub impl @js.Cast for HTMLCanvasElement with from(value) {
  value |> js_identity
}

///|
pub impl IsNode for HTMLCanvasElement

///|
pub impl IsElement for HTMLCanvasElement

///|
pub impl IsHtmlElement for HTMLCanvasElement

///|
pub extern "js" fn HTMLCanvasElement::get_width(self : Self) -> Int = "(x) => x.width"

///|
pub extern "js" fn HTMLCanvasElement::get_height(self : Self) -> Int = "(x) => x.height"

///|
pub extern "js" fn HTMLCanvasElement::get_context(
  self : Self,
  context_id : String
) -> @js.Union5[
  CanvasRenderingContext2D,
  ImageBitmapRenderingContext,
  WebGLRenderingContext,
  WebGL2RenderingContext,
  GPUCanvasContext,
] = "(x, id) => x.getContext(id)"

// TODO: add CanvasText.measureText

// TODO: add TextMetrics
