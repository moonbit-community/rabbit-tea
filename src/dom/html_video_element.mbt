///|
#external
type HTMLVideoElement

///|
pub impl IsEventTarget for HTMLVideoElement

///|
pub impl IsNode for HTMLVideoElement

///|
pub impl IsElement for HTMLVideoElement

///|
pub impl IsHtmlElement for HTMLVideoElement

///|
pub impl IsHTMLMediaElement for HTMLVideoElement

///|
pub impl @js.Cast for HTMLVideoElement with into(value) {
  value |> ffi_to_html_video_element |> _.to_option()
}

///|
pub impl @js.Cast for HTMLVideoElement with from(value) {
  value |> js_identity
}
