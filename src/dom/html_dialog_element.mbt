///|
#external
type HTMLDialogElement

///|
pub impl IsEventTarget for HTMLDialogElement

///|
pub impl @js.Cast for HTMLDialogElement with into(value) {
  value |> ffi_to_html_dialog_element |> _.to_option()
}

///|
pub impl @js.Cast for HTMLDialogElement with from(value) {
  value |> js_identity
}

///|
pub impl IsNode for HTMLDialogElement

///|
pub impl IsElement for HTMLDialogElement

///|
pub impl IsHtmlElement for HTMLDialogElement

///|
pub extern "js" fn HTMLDialogElement::open(self : Self) -> Bool = "(self) => self.open"

///|
pub extern "js" fn HTMLDialogElement::return_value(self : Self) -> String = "(self) => self.returnValue"

///|
pub extern "js" fn HTMLDialogElement::close(
  self : Self,
  return_value~ : @js.Optional[String] = @js.Optional::undefined(),
) = "(self,returnValue) => self.close(returnValue)"

///|
pub extern "js" fn HTMLDialogElement::request_close(
  self : Self,
  return_value~ : @js.Optional[String] = @js.Optional::undefined(),
) = "(self, returnValue) => self.requestClose(returnValue)"

///|
pub extern "js" fn HTMLDialogElement::show(self : Self) = "(self) => self.show()"

///|
pub extern "js" fn HTMLDialogElement::show_modal(self : Self) = "(self) => self.showModal()"
