///|
#external
type HTMLElement

///|
pub trait IsHtmlElement: IsElement {
  as_html_element(Self) -> HTMLElement = _
  set_style(Self, String, String) -> Unit = _
  remove_style(Self, String) -> Unit = _
}

///|
pub impl IsEventTarget for HTMLElement

///|
pub impl IsNode for HTMLElement

///|
pub impl IsElement for HTMLElement

///|
pub impl IsHtmlElement for HTMLElement

///|
impl IsHtmlElement with as_html_element(s) {
  js_identity(s)
}

///|
impl IsHtmlElement with set_style(s, key, value) {
  s |> js_identity |> ffi_html_element_set_style(key, value)
}

///|
impl IsHtmlElement with remove_style(s, key) {
  s |> js_identity |> ffi_html_element_remove_style(key)
}

///|
extern "js" fn ffi_html_element_set_style(
  x : @js.Value,
  key : String,
  value : String
) -> Unit =
  #| (self,key,value) => self.style[key] = value

///|
extern "js" fn ffi_html_element_remove_style(x : @js.Value, key : String) =
  #| (self,key) => self.style[key] = ''
