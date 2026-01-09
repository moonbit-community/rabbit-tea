///|
pub using @cmd {type Cmd, type Command}

///|
pub using @cmd {none, batch, task, perform, attempt}

///|
using @html {type Html}

///|
/// Start the application.
/// 
/// - `model` is the state of your application.
/// - `view` is a way to turn your model into HTML.
/// - `update` a way to update your state based on messages.
/// 
/// These three are the core of the TEA. Rabbit-TEA is highly unstable at this time, 
/// but it follows the same pattern as Elm. You can visit https://guide.elm-lang.org/ 
/// to get more intuition!
/// 
/// To start the application with router, you can use the `application` function.
pub fn[Model, Message] new(
  model~ : Model,
  update~ : (Message, Model) -> (Cmd[Message], Model),
  view~ : (Model) -> Html[Message],
  mount? : String = "app",
) -> App[Message, Model] {
  @dom.document()
  .get_element_by_id(mount)
  .unwrap()
  .set_inner_html("<div></div>")
  let mut sandbox = None
  let mut curr_dom = @vdom.node("div", [], [])
  fn after_update(html : @html.Html[Message]) {
    guard sandbox is Some(sandbox)
    let new_dom = html.to_virtual_dom()
    new_dom.patch(curr_dom, sandbox, mount~)
    curr_dom = new_dom
  }

  let sb = @vdom.Sandbox::new(model, update, view, after_update~)
  sandbox = Some(sb)
  sb.refresh()
  App::{ sandbox: sb }
}

///|
/// Start the application.
/// 
/// - `model` is the state of your application.
/// - `view` is a way to turn your model into HTML.
/// - `update` a way to update your state based on messages.
/// 
/// These three are the core of the TEA. Rabbit-TEA is highly unstable at this time, 
/// but it follows the same pattern as Elm. You can visit https://guide.elm-lang.org/ 
/// to get more intuition!
/// 
/// To start the application with router, you can use the `application` function.
pub fn[Model, Message] startup(
  model~ : Model,
  update~ : (Message, Model) -> (Cmd[Message], Model),
  view~ : (Model) -> Html[Message],
  mount? : String = "app",
) -> Unit {
  ignore(new(model~, update~, view~, mount~))
}

///|
struct App[Msg, Model] {
  sandbox : @vdom.Sandbox[Msg, Model, @html.Html[Msg]]
}

///|
/// run the update function of the application.
pub fn[Msg, Model] App::dispatch(self : App[Msg, Model], msg : Msg) -> Unit {
  self.sandbox.update(msg)
}

///|
pub fn[Model, Msg] new_with_route(
  initialize~ : (@url.Url) -> (Cmd[Msg], Model),
  update~ : (Msg, Model) -> (Cmd[Msg], Model),
  view~ : (Model) -> @html.Html[Msg],
  url_changed? : (@url.Url) -> Msg,
  url_request? : (@url.UrlRequest) -> Msg,
  mount? : String = "app",
) -> App[Msg, Model] {
  @dom.document()
  .get_element_by_id(mount)
  .unwrap()
  .set_inner_html("<div></div>")
  let mut sandbox_ref = None
  let mut curr_dom = @vdom.node("div", [], [])
  fn after_update(html : @html.Html[Msg]) {
    guard sandbox_ref is Some(sandbox)
    let new_dom = html.to_virtual_dom()
    new_dom.patch(curr_dom, sandbox, mount~)
    curr_dom = new_dom
  }

  guard (try? @url.parse(@dom.window().current_url())) is Ok(url)
  let (cmd, model) = initialize(url)
  let sandbox = @vdom.Sandbox::new(
    model,
    update,
    view,
    after_update~,
    url_request?,
    url_changed?,
  )
  sandbox_ref = Some(sandbox)
  sandbox..launch(cmd)..refresh()
  App::{ sandbox, }
}

///|
/// Start the application with initial URL. 
/// 
/// - `url_changed` is a message that will be passed when the URL is changed by the navigation API in the `@browser` package.
/// - `url_request` is a message that will be passed when an `<a>` tag is clicked.
/// - `initialize` will be called when the application is started. 
/// 
pub fn[Model, Msg] application(
  initialize~ : (@url.Url) -> (Cmd[Msg], Model),
  update~ : (Msg, Model) -> (Cmd[Msg], Model),
  view~ : (Model) -> @html.Html[Msg],
  url_changed? : (@url.Url) -> Msg,
  url_request? : (@url.UrlRequest) -> Msg,
  mount? : String = "app",
) -> Unit {
  ignore(
    new_with_route(
      initialize~,
      update~,
      view~,
      url_changed?,
      url_request?,
      mount~,
    ),
  )
}
