///|
struct Context2D(@dom.CanvasRenderingContext2D)

///|
/// Get the underlying `CanvasRenderingContext2D` js object.
/// 
/// This function is unsafe and should be used rarely.
pub fn Context2D::to_unsafe_js(
  self : Context2D,
) -> @dom.CanvasRenderingContext2D {
  self.0
}

///|
pub fn Context2D::begin_path(self : Context2D) -> Unit {
  self.0.begin_path()
}

///|
pub fn Context2D::move_to(self : Context2D, x : Double, y : Double) -> Unit {
  self.0.move_to(x, y)
}

///|
pub fn Context2D::line_to(self : Context2D, x : Double, y : Double) -> Unit {
  self.0.line_to(x, y)
}

///|
pub fn Context2D::set_line_width(self : Context2D, width : Double) -> Unit {
  self.0.set_line_width(width)
}

///|
pub fn Context2D::stroke(self : Context2D) -> Unit {
  self.0.stroke()
}

///|
pub(all) enum Color {
  RGB(Int, Int, Int)
  RGBA(Int, Int, Int, Int)
  Black
  White
} derive(Show)

///|
pub fn Color::to_string(self : Color) -> String {
  match self {
    RGB(r, g, b) => "rgb(\{r}, \{g}, \{b})"
    RGBA(r, g, b, a) => "rgba(\{r}, \{g}, \{b}, \{a})"
    Black => "black"
    White => "white"
  }
}

///|
pub fn Context2D::set_stroke_style(self : Context2D, color : Color) -> Unit {
  self.0.set_stroke_style(@js.Union3::from0(color.to_string()))
}

///|
pub fn Context2D::set_fill_style(self : Context2D, color : Color) -> Unit {
  self.0.set_fill_style(@js.Union3::from0(color.to_string()))
}

///|
pub fn Context2D::fill_rect(
  self : Context2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double,
) -> Unit {
  self.0.fill_rect(x, y, width, height)
}

///|
pub fn Context2D::clear_rect(
  self : Context2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double,
) -> Unit {
  self.0.clear_rect(x, y, width, height)
}

///|
pub fn Context2D::fill_text(
  self : Context2D,
  text : String,
  x : Double,
  y : Double,
) -> Unit {
  self.0.fill_text(text, x, y)
}
