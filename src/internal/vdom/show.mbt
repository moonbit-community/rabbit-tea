///|
impl[Msg] Show for AttrsUpdate[Msg] with to_string(self : AttrsUpdate[Msg]) -> String {
  match self {
    AttrRemove(key) => "AttrRemove(\{key})"
    AttrAdd(key, value) => "AttrAdd(\{key}, \{value})"
    StyleAdd(key, value) => "StyleAdd(\{key}, \{value})"
    StyleRemove(key) => "StyleRemove(\{key})"
    PropertyAdd(key, value) => "PropertyAdd(\{key}, \{value})"
    PropertyRemove(key) => "PropertyRemove(\{key})"
    EventRemove(key, _) => "EventRemove(\{key})"
    EventAdd(key, _) => "EventAdd(\{key})"
  }
}

///|
impl[Msg] Show for AttrsUpdate[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}

///|
impl[Msg] Show for AttrValue[Msg] with to_string(self) {
  match self {
    AttrEvent(_) => "AttrEvent"
    AttrStyle(value) => "AttrStyle(\{value})"
    AttrString(value) => "AttrString(\{value})"
    AttrProperty(value) => "AttrProperty(\{value})"
  }
}

///|
impl[Msg] Show for AttrValue[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}

///|
impl[Msg] Show for Node[Msg] with to_string(self) {
  match self {
    Node(tag, attrs~, children~, listeners~, namespace_uri~) =>
      "Node(\{tag}, \{attrs}, \{children}, Listeners(\{listeners.length()}), \{namespace_uri})"
    ExternalNode(_, attrs, width~, height~) =>
      "ExternalNode(\{attrs},\{width},\{height})"
    Text(value) => "Text(\{value})"
    Nothing => "Nothing"
  }
}

///|
impl[Msg] Show for Node[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}

///|
impl[Msg] Show for Patch[Msg] with to_string(self) {
  match self {
    Drop(index, length) => "Drop(\{index}, \{length})"
    Remove(index) => "Remove(\{index})"
    Replace(index, node) => "Replace(\{index}, \{node})"
    InsertBefore(index, node) => "InsertBefore(\{index}, \{node})"
    Append(nodes) => "Append(\{nodes})"
    Update(update) => "Update(\{update})"
  }
}

///|
impl[Msg] Show for Patch[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}

///|
impl[Msg] Show for Update[Msg] with to_string(self) {
  match self {
    UpdateNode(index, attrs, children, listeners) =>
      "UpdateNode(\{index}, \{attrs}, \{children}, Listeners(\{listeners.length()}))"
    UpdateText(index, value) => "UpdateText(\{index}, \{value})"
  }
}

///|
impl[Msg] Show for Update[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}

///|
impl[Msg] Show for Attribute[Msg] with to_string(self) {
  "Attribute(\{self.0}, \{self.1})"
}

///|
impl[Msg] Show for Attribute[Msg] with output(self, buf) {
  buf.write_string(self.to_string())
}
