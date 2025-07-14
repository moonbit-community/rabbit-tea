///|
#external
type HTMLInputElement

///|
pub impl IsEventTarget for HTMLInputElement

///|
pub impl @js.Cast for HTMLInputElement with into(value) {
  value |> ffi_to_html_input_element |> _.to_option()
}

///|
pub impl @js.Cast for HTMLInputElement with from(value) {
  value |> js_identity
}

///|
pub impl IsNode for HTMLInputElement

///|
pub impl IsElement for HTMLInputElement

///|
pub impl IsHtmlElement for HTMLInputElement

///|
pub extern "js" fn HTMLInputElement::value(self : Self) -> String = "(self) => self.value"
