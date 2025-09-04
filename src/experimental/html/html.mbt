///|
pub typealias @legacy_html.Html

///|
pub typealias Html as T

///| 
// fn[Msg] node(
//   tag : String,
//   attributes : Array[Attribute[Msg]],
//   children : Array[Html[Msg]]
// ) -> Html[Msg] {
//   @vdom.node(tag, attributes.map(_.inner()), children.map(_.inner()))
// }

///|
fn[M] make_node(
  tag : String,
  positional~ : Array[Attribute[M]],
  optional~ : Array[Attribute[M]?],
  children : Array[Html[M]],
) -> Html[M] {
  let attrs = [
      ..optional.iter().filter_map(x => x).map(_.inner()),
      ..positional.iter().map(_.inner()),
    ]
  @vdom.node(tag, attrs, children.map(_.inner()))
}

///|
/// Represents an empty element
pub fn[M] nothing() -> Html[M] {
  @vdom.nothing()
}

///|
pub fn[Msg] text(str : String) -> Html[Msg] {
  @vdom.text(str)
}
