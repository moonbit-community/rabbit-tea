# Rabbit-TEA

A declarative and functional web UI framework inspired by The Elm Architecture.

## Features

- Refactor Safety

    By leveraging *pattern matching* and *tagged union*, exhaustive checks provide 
    a better refactoring experience. MoonBit helps prevent common runtime errors 
    ensuring more robust and reliable code.

- Maintainable State

    The state is globally managed, making it easier to maintain the entire application.
    By utilizing persistent data structures from `moonbitlang/core/immut`, 
    you can implement advanced features such as undo/redo functionality with ease.

- Lightweight Runtime

    The generated JavaScript file is 33KB after minified for a project like 
    `src/example/counter`, including the virtual DOM.

## Basic Example

```moonbit
typealias Int as Model
let model = 0

enum Msg {
  Increment
  Decrement
}

fn update(msg : Msg, model : Model) -> (Cmd[Msg], Model) {
  match msg {
    Increment => (none(), model + 1)
    Decrement => (none(), model - 1)
  }
}

fn view(model : Model) -> Html[Msg] {
  div([
    h1([text(model.to_string())]),
    button(click=Increment, [text("+")]),
    button(click=Decrement, [text("-")]),
  ])
}

fn main {
  @tea.startup(model~, update~, view~)
}
```

For more examples, see [rabbit-tea-examples](https://github.com/moonbit-community/rabbit-tea-examples).

# Getting started 

To get started, you can use the [Rabbit-TEA template](https://github.com/Yoorkin/rabbit-tea-tailwind).

It also includes instructions for debugging your code with Rabbit-TEA.
