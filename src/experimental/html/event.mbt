///|
type Mouse @dom.MouseEvent

///|
pub(all) struct Pos {
  x : Int
  y : Int
}

///|
pub fn Mouse::screen_pos(self : Mouse) -> Pos {
  { x: self.inner().screen_x(), y: self.inner().screen_y() }
}

///|
pub fn Mouse::offset_pos(self : Mouse) -> Pos {
  { x: self.inner().offset_x(), y: self.inner().offset_y() }
}

///|
pub fn Mouse::client_pos(self : Mouse) -> Pos {
  { x: self.inner().client_x(), y: self.inner().client_y() }
}

///|
type Scroll @dom.Element

///|
pub fn Scroll::offset_pos(self : Self) -> Pos {
  {
    x: self.inner().get_scroll_left().to_int(),
    y: self.inner().get_scroll_top().to_int(),
  }
}

///|
pub fn Scroll::width(self : Self) -> Int {
  self.inner().get_scroll_width().to_int()
}

///|
pub fn Scroll::height(self : Self) -> Int {
  self.inner().get_scroll_height().to_int()
}

///|
fn[Msg] mouse_event(event : String, msg : (Mouse) -> Msg) -> Attribute[Msg] {
  @vdom.on(
    event,
    HandleEvent(event => msg(
      event.to_ui_event().unwrap().to_mouse_event().unwrap(),
    )),
  )
}

///|
fn[Msg] click_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("click", msg)
}

///|
fn[Msg] input_event(msg : (String) -> Msg) -> Attribute[Msg] {
  @vdom.on(
    "input",
    HandleEvent(event => {
      // TODO: eliminate to_option
      let value : String = event
        .target()
        .to_node()
        .unwrap()
        .to_element()
        .unwrap()
        .to_html_element()
        .unwrap()
        .to_html_input_element()
        .unwrap()
        .value()
      msg(value)
    }),
  )
}

///|
fn[Msg] change_event(msg : (String) -> Msg) -> Attribute[Msg] {
  @vdom.on(
    "change",
    HandleEvent(event => {
      // TODO: eliminate to_option
      let html_element = event
        .target()
        .to_node()
        .unwrap()
        .to_element()
        .unwrap()
        .to_html_element()
        .unwrap()
      let value = if html_element.to_html_input_element().to_option() is Some(x) {
        x.value()
      } else if html_element.to_html_select_element().to_option() is Some(x) {
        x.value()
      } else {
        panic() // TODO: check for other HTMLElement types
      }
      msg(value)
    }),
  )
}

///|
fn[Msg] dblclick_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("dblclick", msg)
}

///|
fn[Msg] mouse_down_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mousedown", msg)
}

///|
fn[Msg] mouse_up_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mouseup", msg)
}

///|
fn[Msg] mouse_move_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mousemove", msg)
}

///|
fn[Msg] mouse_enter_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mouseenter", msg)
}

///|
fn[Msg] mouse_over_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mouseover", msg)
}

///|
fn[Msg] mouse_leave_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mouseleave", msg)
}

///|
fn[Msg] mouse_out_event(msg : (Mouse) -> Msg) -> Attribute[Msg] {
  mouse_event("mouseout", msg)
}

///|
fn[M] scroll_event(msg : (Scroll) -> M) -> Attribute[M] {
  @vdom.on(
    "scroll",
    HandleEvent(event => msg(
      // TODO: eliminate to_option
      event.target().to_node().unwrap().to_element().unwrap(),
    )),
  )
}
