///|
pub(all) type Svg[M] @vdom.Node[M]

///|
pub(all) type Attribute[M] @vdom.Attribute[M]

///|
pub fn[M] node(
  tag : String,
  attrs : Array[Attribute[M]],
  children : Array[Svg[M]],
) -> Svg[M] {
  @vdom.node_ns(
    @dom.namespace_svg,
    tag,
    attrs.map(_.inner()),
    children.map(_.inner()),
  )
}

///|
pub fn[Msg] attribute(key : String, value : String) -> Attribute[Msg] {
  @vdom.attribute(key, value)
}

///|
pub fn[M] property(key : String, value : @variant.Variant) -> Attribute[M] {
  @vdom.property(key, value)
}

///|
pub fn[M] svg(
  attrs : Array[Attribute[M]],
  children : Array[Svg[M]],
) -> @html.Html[M] {
  @vdom.node_ns(
    @dom.namespace_svg,
    "svg",
    attrs.map(_.inner()),
    children.map(_.inner()),
  )
}

///| Create an SVG element from a svg string.
pub fn[M] from_string(svg : String) -> @html.Html[M] {
  @vdom.node_ns(
    @dom.namespace_svg,
    "svg",
    [@vdom.property("innerHTML", String(svg))],
    [],
  )
}
