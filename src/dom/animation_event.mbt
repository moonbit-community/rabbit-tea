///|
/// https://developer.mozilla.org/en-US/docs/Web/API/AnimationEvent
type AnimationEvent

///|
pub impl IsEvent for AnimationEvent

///|
pub impl @js.Cast for AnimationEvent with into(value) {
  value |> ffi_to_animation_event |> _.to_option()
}

///|
pub impl @js.Cast for AnimationEvent with from(value) {
  value |> js_identity
}

///|
pub extern "js" fn AnimationEvent::get_animation_name(self : Self) -> String = "(e) => e.animationName"

///|
pub extern "js" fn AnimationEvent::get_elapsed_time(self : Self) -> Double = "(e) => e.elapsedTime"

///|
pub extern "js" fn AnimationEvent::get_pseudo_element(self : Self) -> String = "(e) => e.pseudoElement"
