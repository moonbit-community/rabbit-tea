///|
#external
type ImageBitmap

///|
pub impl @js.Cast for ImageBitmap with into(value) {
  value |> ffi_to_image_bitmap |> _.to_option()
}

///|
pub impl @js.Cast for ImageBitmap with from(value) {
  value |> js_identity
}

///|
extern "js" fn ffi_to_image_bitmap(
  value : @js.Value
) -> @js.Nullable[ImageBitmap] = "(value) => value instanceof ImageBitmap ? value : null"
