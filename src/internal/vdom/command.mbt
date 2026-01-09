///|
/// Launch commands. It may trigger the update function.
pub fn[M, Model, View] Sandbox::launch(
  self : Sandbox[M, Model, View],
  cmd : @cmd.Cmd[M],
) -> Unit {
  let f = cmd.0
  f(self.predefined.unwrap())
}
