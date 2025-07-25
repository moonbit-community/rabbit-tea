///| The CSSStyleDeclaration interface represents an object that is a CSS declaration block, and exposes style information and various style-related methods and properties.
/// 
/// [mdn](https://developer.mozilla.org/en-US/docs/Web/API/CSSStyleDeclaration)
#external
type CSSStyleDeclaration

///|
#external
type CSSRule

///|
pub impl @js.Cast for CSSStyleDeclaration with into(value) {
  value |> ffi_to_css_style_declaration |> _.to_option()
}

///|
pub impl @js.Cast for CSSStyleDeclaration with from(value) {
  value |> js_identity
}

///| Same as `get_property_value`
pub fn CSSStyleDeclaration::op_get(self : Self, property : String) -> String {
  self.get_property_value(property)
}

///| Same as `set_property`
pub fn CSSStyleDeclaration::op_set(
  self : Self,
  property : String,
  value : String,
) -> Unit {
  self.set_property(property, value)
}

///| Textual representation of the declaration block, if and only if it is exposed via HTMLElement.style.
pub extern "js" fn CSSStyleDeclaration::get_css_text(self : Self) -> String = "(self) => self.cssText"

///| Textual representation of the declaration block, if and only if it is exposed via HTMLElement.style.
pub extern "js" fn CSSStyleDeclaration::set_css_text(
  self : Self,
  value : String,
) = "(self, value) => self.cssText = value"

///| The number of properties.
pub extern "js" fn CSSStyleDeclaration::get_length(self : Self) -> Int = "(self) => self.length"

///| The containing CSSRule.
pub fn CSSStyleDeclaration::get_parent_rule(self : Self) -> CSSRule? {
  ffi_css_style_declaration_get_parent_rule(self).to_option()
}

///| Special alias for the float CSS property.
pub extern "js" fn CSSStyleDeclaration::get_css_float(self : Self) -> String = "(self) => self.cssFloat"

///| Special alias for the float CSS property.
pub extern "js" fn CSSStyleDeclaration::set_css_float(
  self : Self,
  value : String,
) = "(self, value) => self.cssFloat = value"

///| Returns the optional priority, "important".
pub extern "js" fn CSSStyleDeclaration::get_property_priority(
  self : Self,
  property : String,
) -> String = "(self, property) => self.getPropertyPriority(property)"

///| Returns the property value given a property name.
pub extern "js" fn CSSStyleDeclaration::get_property_value(
  self : Self,
  property : String,
) -> String = "(self, property) => self.getPropertyValue(property)"

///| Returns a CSS property name by its index, or the empty string if the index is out-of-bounds.
pub extern "js" fn CSSStyleDeclaration::item(
  self : Self,
  index : Int,
) -> String = "(self, index) => self.item(index)"

///| Removes a property from the CSS declaration block.
pub extern "js" fn CSSStyleDeclaration::remove_property(
  self : Self,
  property : String,
) -> String = "(self, property) => self.removeProperty(property)"

///| Modifies an existing CSS property or creates a new CSS property in the declaration block.
pub extern "js" fn CSSStyleDeclaration::set_property(
  self : Self,
  property : String,
  value : String,
) -> Unit = "(self, property, value) => self.setProperty(property, value)"

///| Modifies an existing CSS property or creates a new CSS property in the declaration block with priority.
// FIXME: Can throw DOMException - ignoring error
pub extern "js" fn CSSStyleDeclaration::set_property_with_priority(
  self : Self,
  property : String,
  value : String,
  priority : String,
) = "(self, property, value, priority) => self.setProperty(property, value, priority)"

///|
extern "js" fn ffi_css_style_declaration_get_parent_rule(
  s : CSSStyleDeclaration,
) -> @js.Nullable[CSSRule] = "(s) => s.parentRule"

///|
extern "js" fn ffi_to_css_style_declaration(
  x : @js.Value,
) -> @js.Nullable[CSSStyleDeclaration] = "(x) => x instanceof CSSStyleDeclaration ? x : null"
