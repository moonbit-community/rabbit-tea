///|
pub(all) enum HtmlElement {
  // Main root
  Html

  // Document metadata
  Head
  Title
  Base
  Link
  Meta
  Style

  // Sectioning root
  Body

  // Content sectioning
  Address
  Article
  Aside
  Footer
  Header
  H1
  H2
  H3
  H4
  H5
  H6
  Hgroup
  Main
  Nav
  Section
  Search

  // Text content
  Blockquote
  Dd
  Div
  Dl
  Dt
  Figcaption
  Figure
  Hr
  Li
  Menu
  Ol
  P
  Pre
  Ul

  // Inline text semantics
  A
  Abbr
  B
  Bdi
  Bdo
  Br
  Cite
  Code
  Data
  Dfn
  Em
  I
  Kbd
  Mark
  Q
  Rp
  Rt
  Ruby
  S
  Samp
  Small
  Span
  Strong
  Sub
  Sup
  Time
  U
  Var
  Wbr

  // Image and multimedia
  Area
  Audio
  Img
  Map
  Track
  Video

  // Embedded content
  Embed
  Fencedframe
  Iframe
  Object
  Picture
  Source

  // SVG and MathML
  Svg
  Math

  // Scripting
  Canvas
  Noscript
  Script

  // Demarcating edits
  Del
  Ins

  // Table content
  Caption
  Col
  Colgroup
  Table
  Tbody
  Td
  Textarea
  Tfoot
  Th
  Thead
  Tr

  // Forms
  Button
  Datalist
  Fieldset
  Form
  Input
  Label
  Legend
  Meter
  Optgroup
  Option
  Output
  Progress
  Select
  Selectedcontent

  // Interactive elements
  Details
  Dialog
  Summary

  // Web Components
  Slot
  Template

  // Obsolete and deprecated elements (included for completeness/compatibility)
  Font
  Marquee
} derive(Show, Compare, Eq)

///|
pub struct HtmlMeta {
  html : HtmlElement
  /// represent the real name in HTML
  name : String
  /// represent the function of the html wrapper in MoonBit
  wrapper_name : String
}

///|
let html_meta_list : Array[HtmlMeta] = [
  // Main root
  { html: Html, name: "html", wrapper_name: "html" },

  // Document metadata
  { html: Head, name: "head", wrapper_name: "head" },
  { html: Title, name: "title", wrapper_name: "title_" },
  { html: Base, name: "base", wrapper_name: "base" },
  { html: Link, name: "link", wrapper_name: "link" },
  { html: Meta, name: "meta", wrapper_name: "meta" },
  { html: Style, name: "style", wrapper_name: "style" },

  // Sectioning root
  { html: Body, name: "body", wrapper_name: "body" },

  // Content sectioning
  { html: Address, name: "address", wrapper_name: "address" },
  { html: Article, name: "article", wrapper_name: "article" },
  { html: Aside, name: "aside", wrapper_name: "aside" },
  { html: Footer, name: "footer", wrapper_name: "footer" },
  { html: Header, name: "header", wrapper_name: "header" },
  { html: H1, name: "h1", wrapper_name: "h1" },
  { html: H2, name: "h2", wrapper_name: "h2" },
  { html: H3, name: "h3", wrapper_name: "h3" },
  { html: H4, name: "h4", wrapper_name: "h4" },
  { html: H5, name: "h5", wrapper_name: "h5" },
  { html: H6, name: "h6", wrapper_name: "h6" },
  { html: Hgroup, name: "hgroup", wrapper_name: "hgroup" },
  { html: Main, name: "main", wrapper_name: "main_" },
  { html: Nav, name: "nav", wrapper_name: "nav" },
  { html: Section, name: "section", wrapper_name: "section" },
  { html: Search, name: "search", wrapper_name: "search" },

  // Text content
  { html: Blockquote, name: "blockquote", wrapper_name: "blockquote" },
  { html: Dd, name: "dd", wrapper_name: "dd" },
  { html: Div, name: "div", wrapper_name: "div" },
  { html: Dl, name: "dl", wrapper_name: "dl" },
  { html: Dt, name: "dt", wrapper_name: "dt" },
  { html: Figcaption, name: "figcaption", wrapper_name: "figcaption" },
  { html: Figure, name: "figure", wrapper_name: "figure" },
  { html: Hr, name: "hr", wrapper_name: "hr" },
  { html: Li, name: "li", wrapper_name: "li" },
  { html: Menu, name: "menu", wrapper_name: "menu" },
  { html: Ol, name: "ol", wrapper_name: "ol" },
  { html: P, name: "p", wrapper_name: "p" },
  { html: Pre, name: "pre", wrapper_name: "pre" },
  { html: Ul, name: "ul", wrapper_name: "ul" },

  // Inline text semantics
  { html: A, name: "a", wrapper_name: "a" },
  { html: Abbr, name: "abbr", wrapper_name: "abbr" },
  { html: B, name: "b", wrapper_name: "b" },
  { html: Bdi, name: "bdi", wrapper_name: "bdi" },
  { html: Bdo, name: "bdo", wrapper_name: "bdo" },
  { html: Br, name: "br", wrapper_name: "br" },
  { html: Cite, name: "cite", wrapper_name: "cite" },
  { html: Code, name: "code", wrapper_name: "code" },
  { html: Data, name: "data", wrapper_name: "data_" },
  { html: Dfn, name: "dfn", wrapper_name: "dfn" },
  { html: Em, name: "em", wrapper_name: "em" },
  { html: I, name: "i", wrapper_name: "i" },
  { html: Kbd, name: "kbd", wrapper_name: "kbd" },
  { html: Mark, name: "mark", wrapper_name: "mark" },
  { html: Q, name: "q", wrapper_name: "q" },
  { html: Rp, name: "rp", wrapper_name: "rp" },
  { html: Rt, name: "rt", wrapper_name: "rt" },
  { html: Ruby, name: "ruby", wrapper_name: "ruby" },
  { html: S, name: "s", wrapper_name: "s" },
  { html: Samp, name: "samp", wrapper_name: "samp" },
  { html: Small, name: "small", wrapper_name: "small" },
  { html: Span, name: "span", wrapper_name: "span" },
  { html: Strong, name: "strong", wrapper_name: "strong" },
  { html: Sub, name: "sub", wrapper_name: "sub" },
  { html: Sup, name: "sup", wrapper_name: "sup" },
  { html: Time, name: "time", wrapper_name: "time_" },
  { html: U, name: "u", wrapper_name: "u" },
  { html: Var, name: "var", wrapper_name: "var_" },
  { html: Wbr, name: "wbr", wrapper_name: "wbr" },

  // Image and multimedia
  { html: Area, name: "area", wrapper_name: "area" },
  { html: Audio, name: "audio", wrapper_name: "audio" },
  { html: Img, name: "img", wrapper_name: "img" },
  { html: Map, name: "map", wrapper_name: "map" },
  { html: Track, name: "track", wrapper_name: "track" },
  { html: Video, name: "video", wrapper_name: "video" },

  // Embedded content
  { html: Embed, name: "embed", wrapper_name: "embed" },
  { html: Fencedframe, name: "fencedframe", wrapper_name: "fencedframe" },
  { html: Iframe, name: "iframe", wrapper_name: "iframe" },
  { html: Object, name: "object", wrapper_name: "object_" },
  { html: Picture, name: "picture", wrapper_name: "picture" },
  { html: Source, name: "source", wrapper_name: "source" },

  // SVG and MathML
  { html: Svg, name: "svg", wrapper_name: "svg" },
  { html: Math, name: "math", wrapper_name: "math_" },

  // Scripting
  { html: Canvas, name: "canvas", wrapper_name: "canvas" },
  { html: Noscript, name: "noscript", wrapper_name: "noscript" },
  { html: Script, name: "script", wrapper_name: "script" },

  // Demarcating edits
  { html: Del, name: "del", wrapper_name: "del_" },
  { html: Ins, name: "ins", wrapper_name: "ins" },

  // Table content
  { html: Caption, name: "caption", wrapper_name: "caption" },
  { html: Col, name: "col", wrapper_name: "col" },
  { html: Colgroup, name: "colgroup", wrapper_name: "colgroup" },
  { html: Table, name: "table", wrapper_name: "table" },
  { html: Tbody, name: "tbody", wrapper_name: "tbody" },
  { html: Td, name: "td", wrapper_name: "td" },
  { html: Textarea, name: "textarea", wrapper_name: "textarea" },
  { html: Tfoot, name: "tfoot", wrapper_name: "tfoot" },
  { html: Th, name: "th", wrapper_name: "th" },
  { html: Thead, name: "thead", wrapper_name: "thead" },
  { html: Tr, name: "tr", wrapper_name: "tr" },

  // Forms
  { html: Button, name: "button", wrapper_name: "button" },
  { html: Datalist, name: "datalist", wrapper_name: "datalist" },
  { html: Fieldset, name: "fieldset", wrapper_name: "fieldset" },
  { html: Form, name: "form", wrapper_name: "form" },
  { html: Input, name: "input", wrapper_name: "input" },
  { html: Label, name: "label", wrapper_name: "label" },
  { html: Legend, name: "legend", wrapper_name: "legend" },
  { html: Meter, name: "meter", wrapper_name: "meter" },
  { html: Optgroup, name: "optgroup", wrapper_name: "optgroup" },
  { html: Option, name: "option", wrapper_name: "option" },
  { html: Output, name: "output", wrapper_name: "output" },
  { html: Progress, name: "progress", wrapper_name: "progress" },
  { html: Select, name: "select", wrapper_name: "select" },
  {
    html: Selectedcontent,
    name: "selectedcontent",
    wrapper_name: "selectedcontent",
  },

  // Interactive elements
  { html: Details, name: "details", wrapper_name: "details" },
  { html: Dialog, name: "dialog", wrapper_name: "dialog" },
  { html: Summary, name: "summary", wrapper_name: "summary" },

  // Web Components
  { html: Slot, name: "slot", wrapper_name: "slot" },
  { html: Template, name: "template", wrapper_name: "template" },

  // Obsolete and deprecated elements (included for completeness/compatibility)
  { html: Font, name: "font", wrapper_name: "font" },
  { html: Marquee, name: "marquee", wrapper_name: "marquee" },
]

///|
pub(all) enum AttributeTarget {
  Global
  Element(Array[HtmlElement])
} derive(Show)

///|
enum Attribute {
  Accept
  AcceptCharset
  Accesskey
  Action
  Align
  Allow
  Alt
  As
  Async
  Autocapitalize
  Autocomplete
  Autoplay
  Background
  Bgcolor
  Border
  Capture
  Charset
  Checked
  Cite
  Class
  Color
  Cols
  Colspan
  Content
  Contenteditable
  Controls
  Coords
  Crossorigin
  Csp
  Data
  // DataStar
  Datetime
  Decoding
  Default
  Defer
  Dir
  Dirname
  Disabled
  Download
  Draggable
  Enctype
  Enterkeyhint
  Elementtiming
  For
  Form
  Formaction
  Formenctype
  Formmethod
  Formnovalidate
  Formtarget
  Headers
  Height
  Hidden
  High
  Href
  Hreflang
  HttpEquiv
  Id
  Integrity
  Intrinsicsize
  Inputmode
  Ismap
  Itemprop
  Kind
  Label
  Lang
  Language
  Loading
  List
  Loop
  Low
  Max
  Maxlength
  Minlength
  Media
  Method
  Min
  Multiple
  Muted
  Name
  Novalidate
  Open
  Optimum
  Pattern
  Ping
  Placeholder
  Playsinline
  Poster
  Preload
  Readonly
  Referrerpolicy
  Rel
  Required
  Reversed
  Role
  Rows
  Rowspan
  Sandbox
  Scope
  Scoped
  Selected
  Shape
  Size
  Sizes
  Slot
  Span
  Spellcheck
  Src
  Srcdoc
  Srclang
  Srcset
  Start
  Step
  Style
  Summary
  Tabindex
  Target
  Title
  Translate
  Type
  Usemap
  Value
  Width
  Wrap
  // Event Handler Attributes
  Onabort
  Onafterprint
  Onbeforeprint
  Onbeforeunload
  Onblur
  Oncanplay
  Oncanplaythrough
  Onchange
  Onclick
  Oncontextmenu
  Oncopy
  Oncuechange
  Oncut
  Ondblclick
  Ondrag
  Ondragend
  Ondragenter
  Ondragleave
  Ondragover
  Ondragstart
  Ondrop
  Ondurationchange
  Onemptied
  Onended
  Onerror
  Onfocus
  Onhashchange
  Oninput
  Oninvalid
  Onkeydown
  Onkeypress
  Onkeyup
  Onload
  Onloadeddata
  Onloadedmetadata
  Onloadstart
  Onmousedown
  Onmouseenter
  Onmouseleave
  Onmousemove
  Onmouseout
  Onmouseover
  Onmouseup
  Onmousewheel
  Onoffline
  Ononline
  Onpagehide
  Onpageshow
  Onpaste
  Onpause
  Onplay
  Onplaying
  Onpopstate
  Onprogress
  Onratechange
  Onreset
  Onresize
  Onscroll
  Onsearch
  Onseeked
  Onseeking
  Onselect
  Onshow
  Onstalled
  Onstorage
  Onsubmit
  Onsuspend
  Ontimeupdate
  Ontoggle
  Onunload
  Onvolumechange
  Onwaiting
  Onwheel
} derive(Show, Compare, Eq)

///|
enum AttributeKind {
  StringAttribute
  BooleanAttribute
  EventHandlerAttribute
  StringProperty
  // DoubleProperty
} derive(Show)

///|
struct AttributeMeta {
  attribute : Attribute
  /// represent the real name in HTML
  name : String
  /// represent the kind of the attribute in html
  attr_kind : AttributeKind
  /// represent the attribute can be used in which HTML elements
  target : AttributeTarget
  /// represent the parameter in MoonBit
  parameter : MbtParameter
} derive(Show)

///|
enum MbtType {
  Integer
  Boolean
  String
  InputType
  Function(Array[MbtType], MbtType)
  GenericMsg
  Mouse
  Scroll
} derive(Show)

///|
enum MbtParameterKind {
  Positional(MbtType)
  Optional(MbtType)
  Labeled(MbtType, default~ : String?)
} derive(Show)

///|
test {
  ignore(Positional(_))
  ignore(Integer)
  ignore(InputType)
}

///|
struct MbtParameter {
  /// the name of the parameter
  argument : String
  /// the kind of the parameter
  kind : MbtParameterKind
} derive(Show)

///|
/// help me finish the attribute_meta list in src/internal/codegen/html_gen.mbt, according the info in src/internal/codegen/attribute_meta.md. If you dont know how to fill the AttributeType, use Unknown instead.
let attribute_meta_list : Array[AttributeMeta] = [
  {
    attribute: Accept,
    name: "accept",
    attr_kind: StringAttribute,
    target: Element([Form, Input]),
    parameter: { argument: "accept", kind: Optional(String) },
  },
  {
    attribute: AcceptCharset,
    name: "accept-charset",
    attr_kind: StringAttribute,
    target: Element([Form]),
    parameter: { argument: "accept_charset", kind: Optional(String) },
  },
  {
    attribute: Accesskey,
    name: "accesskey",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "accesskey", kind: Optional(String) },
  },
  {
    attribute: Action,
    name: "action",
    attr_kind: StringAttribute,
    target: Element([Form]),
    parameter: { argument: "action", kind: Optional(String) },
  },
  {
    attribute: Align,
    name: "align",
    attr_kind: StringAttribute,
    target: Element([
      Caption,
      Col,
      Colgroup,
      Hr,
      Iframe,
      Img,
      Table,
      Tbody,
      Td,
      Tfoot,
      Th,
      Thead,
      Tr,
    ]),
    parameter: { argument: "align", kind: Optional(String) },
  },
  {
    attribute: Allow,
    name: "allow",
    attr_kind: StringAttribute,
    target: Element([Iframe]),
    parameter: { argument: "allow", kind: Optional(String) },
  },
  {
    attribute: Alt,
    name: "alt",
    attr_kind: StringAttribute,
    target: Element([Area, Img, Input]),
    parameter: { argument: "alt", kind: Optional(String) },
  },
  {
    attribute: As,
    name: "as",
    attr_kind: StringAttribute,
    target: Element([Link]),
    parameter: { argument: "as_", kind: Optional(String) },
  },
  {
    attribute: Async,
    name: "async",
    attr_kind: BooleanAttribute,
    target: Element([Script]),
    parameter: {
      argument: "async_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Autocapitalize,
    name: "autocapitalize",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "autocapitalize", kind: Optional(String) },
  },
  {
    attribute: Autocomplete,
    name: "autocomplete",
    attr_kind: StringAttribute,
    target: Element([Form, Input, Select, Textarea]),
    parameter: { argument: "autocomplete", kind: Optional(String) },
  },
  {
    attribute: Autoplay,
    name: "autoplay",
    attr_kind: BooleanAttribute,
    target: Element([Audio, Video]),
    parameter: {
      argument: "autoplay",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Background,
    name: "background",
    attr_kind: StringAttribute,
    target: Element([Body, Table, Td, Th]),
    parameter: { argument: "background", kind: Optional(String) },
  },
  {
    attribute: Bgcolor,
    name: "bgcolor",
    attr_kind: StringAttribute,
    target: Element([
      Body,
      Col,
      Colgroup,
      Marquee,
      Table,
      Tbody,
      Tfoot,
      Td,
      Th,
      Tr,
    ]),
    parameter: { argument: "bgcolor", kind: Optional(String) },
  },
  {
    attribute: Border,
    name: "border",
    attr_kind: StringAttribute,
    target: Element([Img, Object, Table]),
    parameter: { argument: "border", kind: Optional(String) },
  },
  {
    attribute: Capture,
    name: "capture",
    attr_kind: StringAttribute,
    target: Element([Input]),
    parameter: { argument: "capture", kind: Optional(String) },
  },
  {
    attribute: Charset,
    name: "charset",
    attr_kind: StringAttribute,
    target: Element([Meta]),
    parameter: { argument: "charset", kind: Optional(String) },
  },
  {
    attribute: Checked,
    name: "checked",
    attr_kind: BooleanAttribute,
    target: Element([Input]),
    parameter: {
      argument: "checked",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Cite,
    name: "cite",
    attr_kind: StringAttribute,
    target: Element([Blockquote, Del, Ins]),
    parameter: { argument: "cite", kind: Optional(String) },
  },
  {
    attribute: Class,
    name: "class",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "class", kind: Optional(String) },
  },
  {
    attribute: Color,
    name: "color",
    attr_kind: StringAttribute,
    target: Element([Font, Hr]),
    parameter: { argument: "color", kind: Optional(String) },
  },
  {
    attribute: Cols,
    name: "cols",
    attr_kind: StringAttribute,
    target: Element([Textarea]),
    parameter: { argument: "cols", kind: Optional(String) },
  },
  {
    attribute: Colspan,
    name: "colspan",
    attr_kind: StringAttribute,
    target: Element([Td, Th]),
    parameter: { argument: "colspan", kind: Optional(String) },
  },
  {
    attribute: Content,
    name: "content",
    attr_kind: StringAttribute,
    target: Element([Meta]),
    parameter: { argument: "content", kind: Optional(String) },
  },
  {
    attribute: Contenteditable,
    name: "contenteditable",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "contenteditable", kind: Optional(String) },
  },
  {
    attribute: Controls,
    name: "controls",
    attr_kind: BooleanAttribute,
    target: Element([Audio, Video]),
    parameter: {
      argument: "controls",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Coords,
    name: "coords",
    attr_kind: StringAttribute,
    target: Element([Area]),
    parameter: { argument: "coords", kind: Optional(String) },
  },
  {
    attribute: Crossorigin,
    name: "crossorigin",
    attr_kind: StringAttribute,
    target: Element([Audio, Img, Link, Script, Video]),
    parameter: { argument: "crossorigin", kind: Optional(String) },
  },
  {
    attribute: Csp,
    name: "csp",
    attr_kind: StringAttribute,
    target: Element([Iframe]),
    parameter: { argument: "csp", kind: Optional(String) },
  },
  {
    attribute: Data,
    name: "data",
    attr_kind: StringAttribute,
    target: Element([Object]),
    parameter: { argument: "data", kind: Optional(String) },
  },
  // {
  //   attribute: DataStar,
  //   name: "data-*",
  //   attr_kind: StringAttribute,
  //   target: Global,
  //   parameter: { argument: "data_star", kind: Optional(String) },
  // },
  {
    attribute: Datetime,
    name: "datetime",
    attr_kind: StringAttribute,
    target: Element([Del, Ins, Time]),
    parameter: { argument: "datetime", kind: Optional(String) },
  },
  {
    attribute: Decoding,
    name: "decoding",
    attr_kind: StringAttribute,
    target: Element([Img]),
    parameter: { argument: "decoding", kind: Optional(String) },
  },
  {
    attribute: Default,
    name: "default",
    attr_kind: BooleanAttribute,
    target: Element([Track]),
    parameter: {
      argument: "default_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Defer,
    name: "defer",
    attr_kind: BooleanAttribute,
    target: Element([Script]),
    parameter: {
      argument: "defer_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Dir,
    name: "dir",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "dir", kind: Optional(String) },
  },
  {
    attribute: Dirname,
    name: "dirname",
    attr_kind: StringAttribute,
    target: Element([Input, Textarea]),
    parameter: { argument: "dirname", kind: Optional(String) },
  },
  {
    attribute: Disabled,
    name: "disabled",
    attr_kind: BooleanAttribute,
    target: Element([
      Button,
      Fieldset,
      Input,
      Optgroup,
      Option,
      Select,
      Textarea,
    ]),
    parameter: {
      argument: "disabled",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Download,
    name: "download",
    attr_kind: StringAttribute,
    target: Element([Area]),
    parameter: { argument: "download", kind: Optional(String) },
  },
  {
    attribute: Draggable,
    name: "draggable",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "draggable", kind: Optional(String) },
  },
  {
    attribute: Enctype,
    name: "enctype",
    attr_kind: StringAttribute,
    target: Element([Form]),
    parameter: { argument: "enctype", kind: Optional(String) },
  },
  {
    attribute: Enterkeyhint,
    name: "enterkeyhint",
    attr_kind: StringAttribute,
    target: Element([Textarea]),
    parameter: { argument: "enterkeyhint", kind: Optional(String) },
  },
  {
    attribute: Elementtiming,
    name: "elementtiming",
    attr_kind: StringAttribute,
    target: Element([Img, Video]),
    parameter: { argument: "elementtiming", kind: Optional(String) },
  },
  {
    attribute: For,
    name: "for",
    attr_kind: StringAttribute,
    target: Element([Label, Output]),
    parameter: { argument: "for_", kind: Optional(String) },
  },
  {
    attribute: Form,
    name: "form",
    attr_kind: StringAttribute,
    target: Element([
      Button,
      Fieldset,
      Input,
      Label,
      Meter,
      Object,
      Output,
      Progress,
      Select,
      Textarea,
    ]),
    parameter: { argument: "form", kind: Optional(String) },
  },
  {
    attribute: Formaction,
    name: "formaction",
    attr_kind: StringAttribute,
    target: Element([Input, Button]),
    parameter: { argument: "formaction", kind: Optional(String) },
  },
  {
    attribute: Formenctype,
    name: "formenctype",
    attr_kind: StringAttribute,
    target: Element([Button, Input]),
    parameter: { argument: "formenctype", kind: Optional(String) },
  },
  {
    attribute: Formmethod,
    name: "formmethod",
    attr_kind: StringAttribute,
    target: Element([Button, Input]),
    parameter: { argument: "formmethod", kind: Optional(String) },
  },
  {
    attribute: Formnovalidate,
    name: "formnovalidate",
    attr_kind: BooleanAttribute,
    target: Element([Button, Input]),
    parameter: {
      argument: "formnovalidate",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Formtarget,
    name: "formtarget",
    attr_kind: StringAttribute,
    target: Element([Button, Input]),
    parameter: { argument: "formtarget", kind: Optional(String) },
  },
  {
    attribute: Headers,
    name: "headers",
    attr_kind: StringAttribute,
    target: Element([Td, Th]),
    parameter: { argument: "headers", kind: Optional(String) },
  },
  {
    attribute: Height,
    name: "height",
    attr_kind: StringAttribute,
    target: Element([Canvas, Embed, Iframe, Img, Input, Object, Video]),
    parameter: { argument: "height", kind: Optional(String) },
  },
  {
    attribute: Hidden,
    name: "hidden",
    attr_kind: BooleanAttribute,
    target: Global,
    parameter: {
      argument: "hidden",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: High,
    name: "high",
    attr_kind: StringAttribute,
    target: Element([Meter]),
    parameter: { argument: "high", kind: Optional(String) },
  },
  {
    attribute: Href,
    name: "href",
    attr_kind: StringAttribute,
    target: Element([Area, Base, Link]),
    parameter: { argument: "href", kind: Optional(String) },
  },
  {
    attribute: Hreflang,
    name: "hreflang",
    attr_kind: StringAttribute,
    target: Element([Link]),
    parameter: { argument: "hreflang", kind: Optional(String) },
  },
  {
    attribute: HttpEquiv,
    name: "http-equiv",
    attr_kind: StringAttribute,
    target: Element([Meta]),
    parameter: { argument: "http_equiv", kind: Optional(String) },
  },
  {
    attribute: Id,
    name: "id",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "id", kind: Optional(String) },
  },
  {
    attribute: Integrity,
    name: "integrity",
    attr_kind: StringAttribute,
    target: Element([Link, Script]),
    parameter: { argument: "integrity", kind: Optional(String) },
  },
  {
    attribute: Intrinsicsize,
    name: "intrinsicsize",
    attr_kind: StringAttribute,
    target: Element([Img]),
    parameter: { argument: "intrinsicsize", kind: Optional(String) },
  },
  {
    attribute: Inputmode,
    name: "inputmode",
    attr_kind: StringAttribute,
    target: Element([Textarea]),
    parameter: { argument: "inputmode", kind: Optional(String) },
  },
  {
    attribute: Ismap,
    name: "ismap",
    attr_kind: BooleanAttribute,
    target: Element([Img]),
    parameter: {
      argument: "ismap",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Itemprop,
    name: "itemprop",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "itemprop", kind: Optional(String) },
  },
  {
    attribute: Kind,
    name: "kind",
    attr_kind: StringAttribute,
    target: Element([Track]),
    parameter: { argument: "kind", kind: Optional(String) },
  },
  {
    attribute: Label,
    name: "label",
    attr_kind: StringAttribute,
    target: Element([Optgroup, Option, Track]),
    parameter: { argument: "label", kind: Optional(String) },
  },
  {
    attribute: Lang,
    name: "lang",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "lang", kind: Optional(String) },
  },
  {
    attribute: Language,
    name: "language",
    attr_kind: StringAttribute,
    target: Element([Script]),
    parameter: { argument: "language", kind: Optional(String) },
  },
  {
    attribute: Loading,
    name: "loading",
    attr_kind: StringAttribute,
    target: Element([Img, Iframe]),
    parameter: { argument: "loading", kind: Optional(String) },
  },
  {
    attribute: List,
    name: "list",
    attr_kind: StringAttribute,
    target: Element([Input]),
    parameter: { argument: "list_", kind: Optional(String) },
  },
  {
    attribute: Loop,
    name: "loop",
    attr_kind: BooleanAttribute,
    target: Element([Audio, Marquee, Video]),
    parameter: {
      argument: "loop_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Low,
    name: "low",
    attr_kind: StringAttribute,
    target: Element([Meter]),
    parameter: { argument: "low", kind: Optional(String) },
  },
  {
    attribute: Max,
    name: "max",
    attr_kind: StringAttribute,
    target: Element([Input, Meter, Progress]),
    parameter: { argument: "max", kind: Optional(String) },
  },
  {
    attribute: Maxlength,
    name: "maxlength",
    attr_kind: StringAttribute,
    target: Element([Input, Textarea]),
    parameter: { argument: "maxlength", kind: Optional(String) },
  },
  {
    attribute: Minlength,
    name: "minlength",
    attr_kind: StringAttribute,
    target: Element([Input, Textarea]),
    parameter: { argument: "minlength", kind: Optional(String) },
  },
  {
    attribute: Media,
    name: "media",
    attr_kind: StringAttribute,
    target: Element([Area, Link, Source, Style]),
    parameter: { argument: "media", kind: Optional(String) },
  },
  {
    attribute: Method,
    name: "method",
    attr_kind: StringAttribute,
    target: Element([Form]),
    parameter: { argument: "method_", kind: Optional(String) },
  },
  {
    attribute: Min,
    name: "min",
    attr_kind: StringAttribute,
    target: Element([Input, Meter]),
    parameter: { argument: "min", kind: Optional(String) },
  },
  {
    attribute: Multiple,
    name: "multiple",
    attr_kind: BooleanAttribute,
    target: Element([Input, Select]),
    parameter: {
      argument: "multiple",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Muted,
    name: "muted",
    attr_kind: BooleanAttribute,
    target: Element([Audio, Video]),
    parameter: {
      argument: "muted",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Name,
    name: "name",
    attr_kind: StringAttribute,
    target: Element([
      Button,
      Form,
      Fieldset,
      Iframe,
      Input,
      Object,
      Output,
      Select,
      Textarea,
      Map,
      Meta,
    ]),
    parameter: { argument: "name", kind: Optional(String) },
  },
  {
    attribute: Novalidate,
    name: "novalidate",
    attr_kind: BooleanAttribute,
    target: Element([Form]),
    parameter: {
      argument: "novalidate",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Open,
    name: "open",
    attr_kind: BooleanAttribute,
    target: Element([Details, Dialog]),
    parameter: {
      argument: "open_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Optimum,
    name: "optimum",
    attr_kind: StringAttribute,
    target: Element([Meter]),
    parameter: { argument: "optimum", kind: Optional(String) },
  },
  {
    attribute: Pattern,
    name: "pattern",
    attr_kind: StringAttribute,
    target: Element([Input]),
    parameter: { argument: "pattern", kind: Optional(String) },
  },
  {
    attribute: Ping,
    name: "ping",
    attr_kind: StringAttribute,
    target: Element([Area]),
    parameter: { argument: "ping", kind: Optional(String) },
  },
  {
    attribute: Placeholder,
    name: "placeholder",
    attr_kind: StringAttribute,
    target: Element([Input, Textarea]),
    parameter: { argument: "placeholder", kind: Optional(String) },
  },
  {
    attribute: Playsinline,
    name: "playsinline",
    attr_kind: BooleanAttribute,
    target: Element([Video]),
    parameter: {
      argument: "playsinline",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Poster,
    name: "poster",
    attr_kind: StringAttribute,
    target: Element([Video]),
    parameter: { argument: "poster", kind: Optional(String) },
  },
  {
    attribute: Preload,
    name: "preload",
    attr_kind: StringAttribute,
    target: Element([Audio, Video]),
    parameter: { argument: "preload", kind: Optional(String) },
  },
  {
    attribute: Readonly,
    name: "readonly",
    attr_kind: BooleanAttribute,
    target: Element([Input, Textarea]),
    parameter: {
      argument: "readonly_",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Referrerpolicy,
    name: "referrerpolicy",
    attr_kind: StringAttribute,
    target: Element([Area, Iframe, Img, Link, Script]),
    parameter: { argument: "referrerpolicy", kind: Optional(String) },
  },
  {
    attribute: Rel,
    name: "rel",
    attr_kind: StringAttribute,
    target: Element([Area, Link]),
    parameter: { argument: "rel", kind: Optional(String) },
  },
  {
    attribute: Required,
    name: "required",
    attr_kind: BooleanAttribute,
    target: Element([Input, Select, Textarea]),
    parameter: {
      argument: "required",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Reversed,
    name: "reversed",
    attr_kind: BooleanAttribute,
    target: Element([Ol]),
    parameter: {
      argument: "reversed",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Role,
    name: "role",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "role", kind: Optional(String) },
  },
  {
    attribute: Rows,
    name: "rows",
    attr_kind: StringAttribute,
    target: Element([Textarea]),
    parameter: { argument: "rows", kind: Optional(String) },
  },
  {
    attribute: Rowspan,
    name: "rowspan",
    attr_kind: StringAttribute,
    target: Element([Td, Th]),
    parameter: { argument: "rowspan", kind: Optional(String) },
  },
  {
    attribute: Sandbox,
    name: "sandbox",
    attr_kind: StringAttribute,
    target: Element([Iframe]),
    parameter: { argument: "sandbox", kind: Optional(String) },
  },
  {
    attribute: Scope,
    name: "scope",
    attr_kind: StringAttribute,
    target: Element([Th]),
    parameter: { argument: "scope", kind: Optional(String) },
  },
  {
    attribute: Scoped,
    name: "scoped",
    attr_kind: BooleanAttribute,
    target: Element([Style]),
    parameter: {
      argument: "scoped",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Selected,
    name: "selected",
    attr_kind: BooleanAttribute,
    target: Element([Option]),
    parameter: {
      argument: "selected",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Shape,
    name: "shape",
    attr_kind: StringAttribute,
    target: Element([Area]),
    parameter: { argument: "shape", kind: Optional(String) },
  },
  {
    attribute: Size,
    name: "size",
    attr_kind: StringAttribute,
    target: Element([Input, Select]),
    parameter: { argument: "size", kind: Optional(String) },
  },
  {
    attribute: Sizes,
    name: "sizes",
    attr_kind: StringAttribute,
    target: Element([Link, Img, Source]),
    parameter: { argument: "sizes", kind: Optional(String) },
  },
  {
    attribute: Slot,
    name: "slot",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "slot", kind: Optional(String) },
  },
  {
    attribute: Span,
    name: "span",
    attr_kind: StringAttribute,
    target: Element([Col, Colgroup]),
    parameter: { argument: "span", kind: Optional(String) },
  },
  {
    attribute: Spellcheck,
    name: "spellcheck",
    attr_kind: BooleanAttribute,
    target: Global,
    parameter: {
      argument: "spellcheck",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Src,
    name: "src",
    attr_kind: StringAttribute,
    target: Element([
      Audio,
      Embed,
      Iframe,
      Img,
      Input,
      Script,
      Source,
      Track,
      Video,
    ]),
    parameter: { argument: "src", kind: Optional(String) },
  },
  {
    attribute: Srcdoc,
    name: "srcdoc",
    attr_kind: StringAttribute,
    target: Element([Iframe]),
    parameter: { argument: "srcdoc", kind: Optional(String) },
  },
  {
    attribute: Srclang,
    name: "srclang",
    attr_kind: StringAttribute,
    target: Element([Track]),
    parameter: { argument: "srclang", kind: Optional(String) },
  },
  {
    attribute: Srcset,
    name: "srcset",
    attr_kind: StringAttribute,
    target: Element([Img, Source]),
    parameter: { argument: "srcset", kind: Optional(String) },
  },
  {
    attribute: Start,
    name: "start",
    attr_kind: StringAttribute,
    target: Element([Ol]),
    parameter: { argument: "start", kind: Optional(String) },
  },
  {
    attribute: Step,
    name: "step",
    attr_kind: StringAttribute,
    target: Element([Input]),
    parameter: { argument: "step", kind: Optional(String) },
  },
  {
    attribute: Style,
    name: "style",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "style", kind: Optional(String) },
  },
  {
    attribute: Summary,
    name: "summary",
    attr_kind: StringAttribute,
    target: Element([Table]),
    parameter: { argument: "summary", kind: Optional(String) },
  },
  {
    attribute: Tabindex,
    name: "tabindex",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "tabindex", kind: Optional(String) },
  },
  {
    attribute: Target,
    name: "target",
    attr_kind: StringAttribute,
    target: Element([Area, Base, Form]),
    parameter: { argument: "target", kind: Optional(String) },
  },
  {
    attribute: Title,
    name: "title",
    attr_kind: StringAttribute,
    target: Global,
    parameter: { argument: "title", kind: Optional(String) },
  },
  {
    attribute: Translate,
    name: "translate",
    attr_kind: BooleanAttribute,
    target: Global,
    parameter: {
      argument: "translate",
      kind: Labeled(Boolean, default=Some("false")),
    },
  },
  {
    attribute: Type,
    name: "type",
    attr_kind: StringAttribute,
    target: Element([
      Button,
      Input,
      Embed,
      Object,
      Ol,
      Script,
      Source,
      Style,
      Menu,
      Link,
    ]),
    parameter: { argument: "type_", kind: Optional(String) },
  },
  {
    attribute: Usemap,
    name: "usemap",
    attr_kind: StringAttribute,
    target: Element([Img, Input, Object]),
    parameter: { argument: "usemap", kind: Optional(String) },
  },
  {
    attribute: Value,
    name: "value",
    attr_kind: StringProperty,
    target: Element([Button, Data, Input, Li, Meter, Option, Progress]),
    parameter: { argument: "value", kind: Optional(String) },
  },
  {
    attribute: Width,
    name: "width",
    attr_kind: StringAttribute,
    target: Element([Canvas, Embed, Iframe, Img, Input, Object, Video]),
    parameter: { argument: "width", kind: Optional(String) },
  },
  {
    attribute: Wrap,
    name: "wrap",
    attr_kind: StringAttribute,
    target: Element([Textarea]),
    parameter: { argument: "wrap", kind: Optional(String) },
  },
  // Event Handler Attributes
  {
    attribute: Onabort,
    name: "onabort",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_abort", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onafterprint,
    name: "onafterprint",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_after_print", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onbeforeprint,
    name: "onbeforeprint",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_before_print", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onbeforeunload,
    name: "onbeforeunload",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_before_unload", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onblur,
    name: "onblur",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_blur", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oncanplay,
    name: "oncanplay",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_can_play", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oncanplaythrough,
    name: "oncanplaythrough",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_can_play_through", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onchange,
    name: "onchange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_change",
      kind: Optional(Function([String], GenericMsg)),
    },
  },
  {
    attribute: Onclick,
    name: "onclick",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_click",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Oncontextmenu,
    name: "oncontextmenu",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_context_menu", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oncopy,
    name: "oncopy",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_copy", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oncuechange,
    name: "oncuechange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_cue_change", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oncut,
    name: "oncut",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_cut", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondblclick,
    name: "ondblclick",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_dbl_click",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Ondrag,
    name: "ondrag",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondragend,
    name: "ondragend",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag_end", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondragenter,
    name: "ondragenter",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag_enter", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondragleave,
    name: "ondragleave",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag_leave", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondragover,
    name: "ondragover",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag_over", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondragstart,
    name: "ondragstart",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drag_start", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondrop,
    name: "ondrop",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_drop", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ondurationchange,
    name: "ondurationchange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_duration_change", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onemptied,
    name: "onemptied",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_emptied", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onended,
    name: "onended",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_ended", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onerror,
    name: "onerror",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_error", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onfocus,
    name: "onfocus",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_focus", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onhashchange,
    name: "onhashchange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_hash_change", kind: Optional(GenericMsg) },
  },
  {
    attribute: Oninput,
    name: "oninput",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_input",
      kind: Optional(Function([String], GenericMsg)),
    },
  },
  {
    attribute: Oninvalid,
    name: "oninvalid",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_invalid", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onkeydown,
    name: "onkeydown",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_key_down", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onkeypress,
    name: "onkeypress",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_key_press", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onkeyup,
    name: "onkeyup",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_key_up", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onload,
    name: "onload",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_load", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onloadeddata,
    name: "onloadeddata",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_loaded_data", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onloadedmetadata,
    name: "onloadedmetadata",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_loaded_metadata", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onloadstart,
    name: "onloadstart",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_load_start", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onmousedown,
    name: "onmousedown",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_down",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmouseenter,
    name: "onmouseenter",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_enter",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmouseleave,
    name: "onmouseleave",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_leave",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmousemove,
    name: "onmousemove",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_move",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmouseout,
    name: "onmouseout",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_out",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmouseover,
    name: "onmouseover",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_over",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmouseup,
    name: "onmouseup",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_mouse_up",
      kind: Optional(Function([Mouse], GenericMsg)),
    },
  },
  {
    attribute: Onmousewheel,
    name: "onmousewheel",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_mouse_wheel", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onoffline,
    name: "onoffline",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_offline", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ononline,
    name: "ononline",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_online", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onpagehide,
    name: "onpagehide",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_page_hide", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onpageshow,
    name: "onpageshow",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_page_show", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onpaste,
    name: "onpaste",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_paste", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onpause,
    name: "onpause",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_pause", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onplay,
    name: "onplay",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_play", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onplaying,
    name: "onplaying",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_playing", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onpopstate,
    name: "onpopstate",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_pop_state", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onprogress,
    name: "onprogress",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_progress", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onratechange,
    name: "onratechange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_rate_change", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onreset,
    name: "onreset",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_reset", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onresize,
    name: "onresize",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_resize", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onscroll,
    name: "onscroll",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: {
      argument: "on_scroll",
      kind: Optional(Function([Scroll], GenericMsg)),
    },
  },
  {
    attribute: Onsearch,
    name: "onsearch",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_search", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onseeked,
    name: "onseeked",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_seeked", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onseeking,
    name: "onseeking",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_seeking", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onselect,
    name: "onselect",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_select", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onshow,
    name: "onshow",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_show", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onstalled,
    name: "onstalled",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_stalled", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onstorage,
    name: "onstorage",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_storage", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onsubmit,
    name: "onsubmit",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_submit", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onsuspend,
    name: "onsuspend",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_suspend", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ontimeupdate,
    name: "ontimeupdate",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_time_update", kind: Optional(GenericMsg) },
  },
  {
    attribute: Ontoggle,
    name: "ontoggle",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_toggle", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onunload,
    name: "onunload",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_unload", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onvolumechange,
    name: "onvolumechange",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_volume_change", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onwaiting,
    name: "onwaiting",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_waiting", kind: Optional(GenericMsg) },
  },
  {
    attribute: Onwheel,
    name: "onwheel",
    attr_kind: EventHandlerAttribute,
    target: Global,
    parameter: { argument: "on_wheel", kind: Optional(GenericMsg) },
  },
]
