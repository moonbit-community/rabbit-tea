///|
pub using @legacy_html {type Html}

///|
pub type T[M] = Html[M]

///| 
// fn[Msg] node(
//   tag : String,
//   attributes : Array[Attribute[Msg]],
//   children : Array[Html[Msg]]
// ) -> Html[Msg] {
//   @vdom.node(tag, attributes.map(x => x.0), children.map(x => x.0))
// }

///|
fn[M] make_node(
  tag : String,
  positional~ : Array[Attribute[M]],
  optional~ : Array[Attribute[M]?],
  children : Array[Html[M]],
) -> Html[M] {
  let attrs = [
    ..optional.iter().filter_map(x => x).map(x => x.0),
    ..positional.iter().map(x => x.0),
  ]
  @vdom.node(tag, attrs, children.map(x => x.0))
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
