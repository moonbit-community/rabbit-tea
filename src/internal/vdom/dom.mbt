///|
enum Node[Msg] {
  Node(
    String,
    namespace_uri~ : String?,
    attrs~ : Array[Attribute[Msg]],
    childrens~ : Array[Node[Msg]],
    // Store the event listener used in real DOM
    listeners~ : Array[(String, @dom.Listener)]
  )
  ExternalNode(
    @dom.Node,
    Ref[Array[Attribute[Msg]]?],
    width~ : Int,
    height~ : Int
  )
  Text(String)
  Nothing
}

///| Convert msg type of Node.
/// 
/// This is a expensive operation and should be used rarely.
pub fn[A, B] map(self : Node[A], f : (A) -> B) -> Node[B] {
  match self {
    Node(tag, attrs~, childrens~, listeners~, namespace_uri~) => {
      let attrs = attrs.map(_.map(f))
      let childrens = childrens.map(_.map(f))
      Node(tag, attrs~, childrens~, listeners~, namespace_uri~)
    }
    ExternalNode(node, attrs, width~, height~) => {
      let attrs = attrs.map(_.map(_.map(_.map(f))))
      ExternalNode(node, attrs, width~, height~)
    }
    Text(value) => Text(value)
    Nothing => Nothing
  }
}

///| Create a DOM node 
pub fn[Msg] node(
  tag : String,
  attrs : Array[Attribute[Msg]],
  childrens : Array[Node[Msg]],
) -> Node[Msg] {
  Node(tag, attrs~, childrens~, listeners=[], namespace_uri=None)
}

///|
pub fn[Msg] node_ns(
  namespace_uri : String,
  qualified_name : String,
  attrs : Array[Attribute[Msg]],
  childrens : Array[Node[Msg]],
) -> Node[Msg] {
  Node(
    qualified_name,
    attrs~,
    childrens~,
    listeners=[],
    namespace_uri=Some(namespace_uri),
  )
}

///|
const ESCAPED_LINK_TAG = "RABBIT-TEA-ESCAPED-LINK"

///|
const NORMAL_LINK_TAG = "a"

///| Create a link node.
/// The `escape` parameter is used to create a link that will not trigger the `url_request` message.
pub fn[Msg] link(
  attrs : Array[Attribute[Msg]],
  childrens : Array[Node[Msg]],
  escape~ : Bool = false,
) -> Node[Msg] {
  let tag = if escape { ESCAPED_LINK_TAG } else { NORMAL_LINK_TAG }
  node(tag, attrs, childrens)
}

///|
pub fn[Msg] external(
  node : @dom.Node,
  attrs : Ref[Array[Attribute[Msg]]?],
  width~ : Int,
  height~ : Int,
) -> Node[Msg] {
  ExternalNode(node, attrs, width~, height~)
}

///| Create a plain text
pub fn[Msg] text(value : String) -> Node[Msg] {
  Text(value)
}

///| Create a dummy node
pub fn[Msg] nothing() -> Node[Msg] {
  Nothing
}

///|
type Attribute[Msg] (String, AttrValue[Msg])

///|
priv enum AttrValue[Msg] {
  AttrEvent(Handler[Msg])
  AttrStyle(String)
  AttrString(String)
  // NOTE: Property is used to set the property of the element, this is different 
  // from the AttrString, which set the attribute of the element.
  // See https://github.com/elm/html/blob/master/properties-vs-attributes.md
  //
  // Further more, the behavior of property may be different with attribute, even 
  // they have the same name. For example, if you set the `href` by `setAttribute`, the
  // `href` will be the value you specified, but by property, the value will be 
  // resolved to an absolute URL. 
  AttrProperty(@variant.Variant)
}

///|
pub(all) enum Handler[Msg] {
  Normal(Msg)
  HandleEvent((@dom.Event) -> Msg)
  Custom(Msg, stop_propagation~ : Bool, prevent_default~ : Bool)
}

///|
fn[Msg] is_same_type(x : Node[Msg], y : Node[Msg]) -> Bool {
  match (x, y) {
    (Node(_), Node(_)) => true
    (Text(_), Text(_)) => true
    (Nothing, Nothing) => true
    (ExternalNode(_), ExternalNode(_)) => true
    _ => false
  }
}

///|
// pub impl[Msg] Eq for Handler[Msg] with op_equal(_a, _b) {
//   false // TODO: implement this
// }

///|
// impl[Msg] Eq for AttrValue[Msg] with op_equal(_a, _b) {
//   false // TODO: implement this
// }

///|
// impl[Msg] Eq for Attribute[Msg] with op_equal(_a, _b) {
//   false // TODO: implement this
// }

///|
pub fn[A, B] Handler::map(self : Handler[A], f : (A) -> B) -> Handler[B] {
  match self {
    Normal(msg) => Normal(f(msg))
    HandleEvent(g) => HandleEvent(event => event |> g |> f)
    Custom(msg, stop_propagation~, prevent_default~) =>
      Custom(f(msg), stop_propagation~, prevent_default~)
  }
}

///|
pub fn[A, B] Attribute::map(self : Attribute[A], f : (A) -> B) -> Attribute[B] {
  let Attribute((key, value)) = self
  let value = match value {
    AttrEvent(handler) => AttrEvent(handler.map(f))
    AttrStyle(value) => AttrStyle(value)
    AttrString(value) => AttrString(value)
    AttrProperty(value) => AttrProperty(value)
  }
  Attribute((key, value))
}

///| Create an custom event handler
pub fn[Msg] on(event : String, handler : Handler[Msg]) -> Attribute[Msg] {
  (event, AttrEvent(handler))
}

///| Create an attribute
pub fn[Msg] attribute(key : String, value : String) -> Attribute[Msg] {
  (key, AttrString(value))
}

///| Create an property
pub fn[Msg] property(key : String, value : @variant.Variant) -> Attribute[Msg] {
  (key, AttrProperty(value))
}

///| Create an style attribute
pub fn[Msg] style(key : String, value : String) -> Attribute[Msg] {
  (key, AttrStyle(value))
}

///| Convert virtual DOM to real DOM
fn[Msg, Model, View] Node::to_node(
  self : Node[Msg],
  sandbox : @adapter.Sandbox[Msg, Model, View],
) -> @dom.Node {
  // NOTE:
  // In Elm, the sandbox is a spacial type and handled in the runtime. But in Moonbit,
  // the sandbox is just a normal type and handled in the user code. Because any operation
  // in TEA require the state of sandbox, it cause the type parameter like Msg, Model, View 
  // to be passed around in API, very painful.
  // 
  // This function require a sandbox value, and use closure to eliminate the type parameter.
  fn attach_attrs(
    attrs : Array[Attribute[Msg]],
    element : @dom.Element,
    generated_listeners : Array[(String, @dom.Listener)],
  ) {
    attrs.each(x => match x {
      Attribute((event, AttrEvent(handler))) => {
        let listener = match handler {
          Normal(msg) => _ => sandbox.update(msg)
          HandleEvent(f) => event => sandbox.update(f(event))
          Custom(msg, stop_propagation~, prevent_default~) =>
            fn(event : @dom.Event) { // TODO: remove this annotation will cause type error, why?
              if stop_propagation {
                event.stop_propagation()
              }
              if prevent_default {
                event.prevent_default()
              }
              sandbox.update(msg)
            }
        }
        element.add_event_listener(event, listener)
        generated_listeners.push((event, listener))
      }
      Attribute((key, AttrString(value))) => element.set_attribute(key, value)
      Attribute((key, AttrStyle(value))) =>
        element.to_html_element().unwrap().get_style().set_property(key, value)
      Attribute((key, AttrProperty(value))) =>
        element.set_property(key, variant_to_js_value(value))
    })
  }

  match self {
    Node(tag, attrs~, childrens~, listeners~, namespace_uri~) => {
      // NOTE:
      // This is important for those who want to write a router in the app. 
      // When the `a` tag is clicked, the href is parsed and wrapped in 
      // the `url_request` message, then resent to the update function. 
      //
      // If the `url_request` message was not provided, let the browser 
      // handle the click event.
      // 
      // If the user hold the meta key or ctrl key, let the browser handle the click event.
      let element = match (namespace_uri, sandbox.get_on_url_request(), tag) {
        (Some(ns), _, _) => {
          let element = @dom.document().create_element_ns(ns, tag)
          attach_attrs(attrs, element, listeners)
          element
        }
        (_, Some(url_request), NORMAL_LINK_TAG) => {
          let element = @dom.document().create_element(tag)
          attach_attrs(attrs, element, listeners)
          element.add_event_listener("click", event => {
            let mouse_event = event
              .to_ui_event()
              .unwrap()
              .to_mouse_event()
              .unwrap()
            if not(mouse_event.get_meta_key() || mouse_event.get_ctrl_key()) {
              event.prevent_default()
              let href = element.get_property("href")
              guard (try? @url.parse(@dom.window().current_url())) is Ok(curr)
              guard (try? @url.parse(href)) is Ok(next)
              let request = if curr.protocol == next.protocol &&
                curr.host == next.host &&
                curr.port == next.port {
                @url.Internal(next)
              } else {
                External(href)
              }
              sandbox.update(url_request(request))
            }
          })
          element
        }
        // We allow user to create a escaped link, which will not trigger the url_request message.
        // This is useful when user want to create a link that jump to another site directly.
        (_, _, ESCAPED_LINK_TAG) => {
          let element = @dom.document().create_element("a")
          attach_attrs(attrs, element, listeners)
          element
        }
        _ => {
          let element = @dom.document().create_element(tag)
          attach_attrs(attrs, element, listeners)
          element
        }
      }
      for child in childrens {
        element.append_child(child.to_node(sandbox))
      }
      element.as_node()
    }
    ExternalNode(node, attrs, width~, height~) => {
      match attrs.val {
        Some(xs) => {
          attach_attrs(xs, node.to_element().unwrap(), [])
          attrs.val = None
        }
        None => ()
      }
      let element = @dom.document().create_element("div")
      element
      .to_html_element()
      .unwrap()
      .get_style()
      ..set_property("width", width.to_string())
      ..set_property("height", height.to_string())
      element..append_child(node).as_node()
    }
    Text(value) => @dom.document().create_text_node(value).as_node()
    Nothing => @dom.document().create_text_node("").as_node()
  }
}

///|
pub fn variant_to_js_value(value : @variant.Variant) -> @js.Value {
  match value {
    String(value) => @js.Value::cast_from(value)
    Floating(value) => @js.Value::cast_from(value)
    Integer(value) => @js.Value::cast_from(value)
    Boolean(value) => @js.Value::cast_from(value)
  }
}

///|
pub fn[Msg, Model, View] patch(
  self : Node[Msg],
  old : Node[Msg],
  sandbox : @adapter.Sandbox[Msg, Model, View],
  mount~ : String,
) -> Unit {
  let patches = diff(old, self)
  fn aux(patches : Patch[Msg], current : @dom.Node) -> Unit {
    match patches {
      Drop(index, length) =>
        for i in 0..<length {
          current.remove_child(current.get_child(index))
        }
      Remove(index) => current.remove_child(current.get_child(index))
      Replace(index, node) =>
        current.replace_child(node.to_node(sandbox), current.get_child(index))
      InsertBefore(index, node) =>
        if current.get_child_count() == 0 {
          current.append_child(node.to_node(sandbox))
        } else {
          current.insert_before(node.to_node(sandbox), current.get_child(index))
        }
      Append(nodes) =>
        for node in nodes {
          current.append_child(node.to_node(sandbox))
        }
      Update(update) =>
        match update {
          UpdateNode(index, attrs_patches, childs_patches, new_listeners) => {
            let node = current.get_child(index)
            let element = node.to_element().unwrap()
            for patch in attrs_patches {
              match patch {
                AttrRemove(key) => element.remove_attribute(key)
                AttrAdd(key, value) => element.set_attribute(key, value)
                StyleAdd(key, value) => {
                  let element = element.to_html_element().unwrap()
                  element.get_style().set_property(key, value)
                }
                StyleRemove(key) => {
                  let element = element.to_html_element().unwrap()
                  ignore(element.get_style().remove_property(key))
                }
                PropertyAdd(key, value) =>
                  element.set_property(key, variant_to_js_value(value))
                PropertyRemove(key) => element.remove_property(key)
                EventRemove(key, listener) =>
                  element.as_event_target().remove_event_listener(key, listener)
                EventAdd(key, handler) => {
                  let listener = match handler {
                    Normal(msg) => _ => sandbox.update(msg)
                    HandleEvent(f) => event => sandbox.update(f(event))
                    Custom(msg, stop_propagation~, prevent_default~) =>
                      fn(event : @dom.Event) {
                        if stop_propagation {
                          event.stop_propagation()
                        }
                        if prevent_default {
                          event.prevent_default()
                        }
                        sandbox.update(msg)
                      }
                  }
                  element.add_event_listener(key, listener)
                  new_listeners.push((key, listener))
                }
              }
            }
            for patch in childs_patches {
              aux(patch, node)
            }
          }
          UpdateText(index, value) => {
            let text_node = @dom.document().create_text_node(value)
            current.replace_child(text_node.as_node(), current.get_child(index))
          }
        }
    }
  }

  let root = @dom.document().get_element_by_id(mount).unwrap().as_node()
  aux(patches, root)
}

///|
priv enum AttrsUpdate[Msg] {
  AttrRemove(String)
  AttrAdd(String, String)
  StyleAdd(String, String)
  StyleRemove(String)
  PropertyAdd(String, @variant.Variant)
  PropertyRemove(String)
  EventRemove(String, @dom.Listener)
  EventAdd(String, Handler[Msg])
}

///|
enum Patch[Msg] {
  Drop(Int, Int)
  Remove(Int)
  Replace(Int, Node[Msg])
  InsertBefore(Int, Node[Msg])
  Append(Array[Node[Msg]])
  Update(Update[Msg])
}

///|
test {
  // TODO: this is used to suppress unused warnings. Remove this later.
  ignore((Patch::Remove(_) : (Int) -> Patch[Unit]))
  ignore((Patch::InsertBefore(_, _) : (Int, Node[Unit]) -> Patch[Unit]))
}

///|
priv enum Update[Msg] {
  UpdateNode(
    Int,
    Array[AttrsUpdate[Msg]],
    Array[Patch[Msg]],
    Array[(String, @dom.Listener)]
  )
  UpdateText(Int, String)
}

///|
/// Now the root node must be a Node
pub fn[Msg] diff(root_old : Node[Msg], root_new : Node[Msg]) -> Patch[Msg] {
  guard root_old is Node(_, attrs=attrs_old, listeners~, ..)
  guard root_new is Node(_, attrs=attrs_new, ..)
  Update(
    UpdateNode(
      0,
      attrs_diff(attrs_old, attrs_new, listeners),
      do_diff(root_old, root_new),
      [],
    ),
  )
}

///|
pub fn[Msg] do_diff(old : Node[Msg], new : Node[Msg]) -> Array[Patch[Msg]] {
  let childrens_old = match old {
    Node(_, childrens~, ..) => childrens
    _ => abort("old is not a node or fragment")
  }
  let childrens_new = match new {
    Node(_, childrens~, ..) => childrens
    _ => abort("new is not a node or fragment")
  }
  if childrens_old.length() == 0 && childrens_new.length() == 0 {
    []
  } else {
    diff_without_key(childrens_old, childrens_new)
  }
}

// To be improved!!! Now this implementation will affect the performance of the diff algorithm.
// And If a AttributeString's name is same as a AttrEvent's name, the diff algorithm will not work.
// Now we think the events is different although they never changed.

///|
fn[Msg] attrs_diff(
  old : Array[Attribute[Msg]],
  new : Array[Attribute[Msg]],
  // We think the event is different although they never changed.
  // The listeners is used to remove the event listener when the attribute is removed.
  listeners : Array[(String, @dom.Listener)],
) -> Array[AttrsUpdate[Msg]] {
  let old_map = Map::from_iter(old.iter().map(_.inner()))
  let new_map = Map::from_iter(new.iter().map(_.inner()))
  let result = []
  for x in listeners {
    result.push(EventRemove(x.0, x.1))
  }
  for key, value in old_map {
    match value {
      // We think the event is different although they never changed.
      AttrEvent(_) => ()
      AttrStyle(value) =>
        if new_map.contains(key) {
          // FIXME: avoid unwrap and guard let
          guard new_map.get(key).unwrap() is AttrStyle(value_new)
          if value != value_new {
            result.push(StyleAdd(key, value_new))
          }
        } else {
          result.push(StyleRemove(key))
        }
      AttrString(value) =>
        if new_map.contains(key) {
          // FIXME: avoid unwrap and guard let
          guard new_map.get(key).unwrap() is AttrString(value_new)
          if value != value_new {
            result.push(AttrAdd(key, value_new))
          }
        } else {
          result.push(AttrRemove(key))
        }
      AttrProperty(value) =>
        if new_map.contains(key) {
          // FIXME: avoid unwrap and guard let
          guard new_map.get(key).unwrap() is AttrProperty(value_new)
          if value != value_new {
            result.push(PropertyAdd(key, value_new))
          }
        } else {
          result.push(PropertyRemove(key))
        }
    }
  }
  for key, value in new_map {
    match value {
      // We think the event is different although they never changed.
      AttrEvent(handler) => result.push(EventAdd(key, handler))
      AttrStyle(value) =>
        if not(old_map.contains(key)) {
          result.push(StyleAdd(key, value))
        }
      AttrString(value) =>
        if not(old_map.contains(key)) {
          result.push(AttrAdd(key, value))
        }
      AttrProperty(value) =>
        if not(old_map.contains(key)) {
          result.push(PropertyAdd(key, value))
        }
    }
  }
  result
}

///|
pub fn[Msg] diff_without_key(
  old : Array[Node[Msg]],
  new : Array[Node[Msg]],
) -> Array[Patch[Msg]] {
  fn aux(
    xs : ArrayView[Node[Msg]],
    ys : ArrayView[Node[Msg]],
    patches : Array[Patch[Msg]],
    index : Int,
  ) -> Unit {
    match (xs, ys) {
      ([], []) => ()
      ([], tl) => patches.push(Append(tl.map(x => x)))
      (l, []) => patches.push(Drop(index, l.length()))
      ([x, .. tl1], [y, .. tl2]) => {
        if is_same_type(x, y) {
          match (x, y) {
            (
              Node(taga, attrs=xattrs, listeners~, ..),
              Node(tagb, attrs=yattrs, listeners=new_listeners, ..),
            ) =>
              if taga == tagb {
                let attrs_patches = attrs_diff(xattrs, yattrs, listeners)
                let childs_patches = do_diff(x, y)
                if attrs_patches.length() > 0 || childs_patches.length() > 0 {
                  patches.push(
                    Update(
                      UpdateNode(
                        index, attrs_patches, childs_patches, new_listeners,
                      ),
                    ),
                  )
                }
              } else {
                patches.push(Replace(index, y))
              }
            (ExternalNode(_), ExternalNode(_)) =>
              patches.push(Replace(index, y))
            (Text(value_a), Text(value_b)) =>
              if value_a != value_b {
                patches.push(Update(UpdateText(index, value_b)))
              }
            _ => ()
          }
        } else {
          patches.push(Replace(index, y))
        }
        aux(tl1, tl2, patches, index + 1)
      }
    }
  }

  let patches = []
  aux(old[:], new[:], patches, 0)
  patches
}
