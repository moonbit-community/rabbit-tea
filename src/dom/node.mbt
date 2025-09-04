///|
#external
type Node

///|
pub trait IsNode: IsEventTarget {
  as_node(Self) -> Node = _
  get_node_type(Self) -> Int = _
  get_node_name(Self) -> String = _
  get_node_value(Self) -> String = _
  get_first_child(Self) -> Node = _
  get_last_child(Self) -> Node = _
  get_next_sibling(Self) -> Node = _
  get_previous_sibling(Self) -> Node = _
  get_parent_node(Self) -> Node = _
  append_child(Self, Node) -> Unit = _
  remove_child(Self, Node) -> Unit = _
  replace_child(Self, Node, Node) -> Unit = _
  insert_before(Self, Node, Node) -> Unit = _
  get_child(Self, Int) -> Node = _
  get_child_count(Self) -> Int = _
}

///|
pub impl IsEventTarget for Node

///|
pub impl @js.Cast for Node with into(value) {
  value |> ffi_to_node |> _.to_option()
}

///|
pub impl @js.Cast for Node with from(value) {
  value |> js_identity
}

///|
pub impl IsNode for Node

///|
impl IsNode with as_node(s) {
  js_identity(s)
}

///|
impl IsNode with get_node_type(s) {
  s |> js_identity |> ffi_node_type
}

///|
impl IsNode with get_node_name(s) {
  s |> js_identity |> ffi_node_name
}

///|
impl IsNode with get_node_value(s) {
  s |> js_identity |> ffi_node_value
}

///|
impl IsNode with get_first_child(s) {
  s |> js_identity |> first_child
}

///|
impl IsNode with get_last_child(s) {
  s |> js_identity |> ffi_last_child
}

///|
impl IsNode with get_next_sibling(s) {
  s |> js_identity |> ffi_next_sibling
}

///|
impl IsNode with get_previous_sibling(s) {
  s |> js_identity |> ffi_previous_sibling
}

///|
impl IsNode with get_parent_node(s) {
  s |> js_identity |> ffi_parent_node
}

///|
impl IsNode with append_child(s, child) {
  s |> js_identity |> ffi_append_child(child)
}

///|
impl IsNode with remove_child(s, child) {
  s |> js_identity |> ffi_remove_child(child)
}

///|
impl IsNode with replace_child(s, new, old) {
  s |> js_identity |> ffi_replace_child(new, old)
}

///|
impl IsNode with insert_before(s, value, before) {
  s |> js_identity |> insert_before(value, before)
}

///|
impl IsNode with get_child(s, index) {
  s |> js_identity |> ffi_nth_child(index)
}

///|
impl IsNode with get_child_count(s) {
  s |> js_identity |> ffi_count_child
}

// ---------- node API --------------

///|
extern "js" fn ffi_node_type(x : @js.Value) -> Int = "(x) => x.nodeType"

///|
extern "js" fn ffi_node_name(x : @js.Value) -> String = "(x) => x.nodeName"

///|
extern "js" fn ffi_node_value(x : @js.Value) -> String = "(x) => x.nodeValue"

///|
extern "js" fn first_child(x : @js.Value) -> Node = "(x) => x.firstChild"

///|
extern "js" fn ffi_last_child(x : @js.Value) -> Node = "(x) => x.lastChild"

///|
extern "js" fn ffi_next_sibling(x : @js.Value) -> Node = "(x) => x.nextSibling"

///|
extern "js" fn ffi_previous_sibling(x : @js.Value) -> Node = "(x) => x.previousSibling"

///|
extern "js" fn ffi_parent_node(x : @js.Value) -> Node = "(x) => x.parentNode"

///|
extern "js" fn ffi_append_child(x : @js.Value, child : Node) = "(p,c) => p.appendChild(c)"

///|
extern "js" fn ffi_remove_child(x : @js.Value, child : Node) = "(p,c) => p.removeChild(c)"

///|
extern "js" fn ffi_replace_child(x : @js.Value, new : Node, old : Node) = "(p,n,o) => p.replaceChild(n,o)"

///|
extern "js" fn insert_before(x : @js.Value, value : Node, before : Node) = "(p,value,before) => p.insertBefore(value,before)"

// ---------- some specific node API --------------
// Note: the childNodes property is a NodeList, not an array, so we can't use the Array type.

///|
extern "js" fn ffi_nth_child(x : @js.Value, index : Int) -> Node =
  #| (x,i) => { 
  #|   const r = x.childNodes[i]; 
  #|   if (r === undefined) throw new Error(`nth_child: index ${i} out of bounds, length=${x.childNodes.length}`);
  #|   return r;
  #| }

///|
extern "js" fn ffi_count_child(x : @js.Value) -> Int = "(x) => x.childNodes.length"
