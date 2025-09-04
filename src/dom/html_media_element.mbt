///|
/// https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement
type HTMLMediaElement

///|
pub impl IsEventTarget for HTMLMediaElement

///|
pub impl IsNode for HTMLMediaElement

///|
pub impl IsElement for HTMLMediaElement

///|
pub impl IsHtmlElement for HTMLMediaElement

///|
pub impl IsHTMLMediaElement for HTMLMediaElement

///|
type AudioTrackList

///|
type TimeRanges

///|
type DOMTokenList

///|
type MediaError

///|
type MediaKeys

///|
type RemotePlayback

///|
type TextTrackList

///|
type VideoTrackList

///|
type TextTrack

///|
type MediaStream

///|
pub trait IsHTMLMediaElement: IsHtmlElement {
  as_html_media_element(Self) -> HTMLMediaElement = _
  get_audio_tracks(Self) -> AudioTrackList = _
  get_autoplay(Self) -> Bool = _
  set_autoplay(Self, Bool) -> Unit = _
  get_buffered(Self) -> TimeRanges = _
  get_controls(Self) -> Bool = _
  set_controls(Self, Bool) -> Unit = _
  get_controls_list(Self) -> DOMTokenList = _
  get_cross_origin(Self) -> String? = _
  set_cross_origin(Self, String?) -> Unit = _
  get_current_src(Self) -> String = _
  get_current_time(Self) -> Double = _
  set_current_time(Self, Double) -> Unit = _
  get_default_muted(Self) -> Bool = _
  set_default_muted(Self, Bool) -> Unit = _
  get_default_playback_rate(Self) -> Double = _
  set_default_playback_rate(Self, Double) -> Unit = _
  get_disable_remote_playback(Self) -> Bool = _
  set_disable_remote_playback(Self, Bool) -> Unit = _
  get_duration(Self) -> Double = _
  get_ended(Self) -> Bool = _
  get_error(Self) -> MediaError? = _
  get_loop(Self) -> Bool = _
  set_loop(Self, Bool) -> Unit = _
  get_media_keys(Self) -> MediaKeys? = _
  get_muted(Self) -> Bool = _
  set_muted(Self, Bool) -> Unit = _
  get_network_state(Self) -> Int = _
  get_paused(Self) -> Bool = _
  get_playback_rate(Self) -> Double = _
  set_playback_rate(Self, Double) -> Unit = _
  get_played(Self) -> TimeRanges = _
  get_preload(Self) -> String = _
  set_preload(Self, String) -> Unit = _
  get_preserves_pitch(Self) -> Bool = _
  set_preserves_pitch(Self, Bool) -> Unit = _
  get_ready_state(Self) -> Int = _
  get_remote(Self) -> RemotePlayback = _
  get_seekable(Self) -> TimeRanges = _
  get_seeking(Self) -> Bool = _
  get_sink_id(Self) -> String = _
  get_src(Self) -> String = _
  set_src(Self, String) -> Unit = _
  get_src_object(Self) -> @js.Value? = _
  set_src_object(Self, @js.Value?) -> Unit = _
  get_text_tracks(Self) -> TextTrackList = _
  get_video_tracks(Self) -> VideoTrackList = _
  get_volume(Self) -> Double = _
  set_volume(Self, Double) -> Unit = _
  // Methods
  add_text_track(Self, String, String?, String?) -> TextTrack = _
  capture_stream(Self) -> MediaStream = _
  can_play_type(Self, String) -> String = _
  fast_seek(Self, Double) -> Unit = _
  load(Self) -> Unit = _
  pause(Self) -> Unit = _
  // TODO: play() returns Promise<void>
  // play(Self) -> @js.Promise[Unit] = _
  seek_to_next_frame(Self) -> Unit = _
  // TODO: setMediaKeys() returns Promise<void>
  // set_media_keys(Self, MediaKeys?) -> @js.Promise[Unit] = _
  // TODO: setSinkId() returns Promise<void>  
  // set_sink_id(Self, String) -> @js.Promise[Unit] = _
}

///|
pub impl @js.Cast for HTMLMediaElement with into(value) {
  value |> ffi_to_html_media_element |> _.to_option()
}

///|
pub impl @js.Cast for HTMLMediaElement with from(value) {
  value |> js_identity
}

///|
impl IsHTMLMediaElement with as_html_media_element(s) {
  s |> js_identity
}

///|
impl IsHTMLMediaElement with get_audio_tracks(s) {
  ffi_html_media_element_get_audio_tracks(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_autoplay(s) {
  ffi_html_media_element_get_autoplay(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_autoplay(s, value) {
  ffi_html_media_element_set_autoplay(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_buffered(s) {
  ffi_html_media_element_get_buffered(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_controls(s) {
  ffi_html_media_element_get_controls(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_controls(s, value) {
  ffi_html_media_element_set_controls(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_controls_list(s) {
  ffi_html_media_element_get_controls_list(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_cross_origin(s) {
  ffi_html_media_element_get_cross_origin(s.as_html_media_element()).to_option()
}

///|
impl IsHTMLMediaElement with set_cross_origin(s, value) {
  ffi_html_media_element_set_cross_origin(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_current_src(s) {
  ffi_html_media_element_get_current_src(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_current_time(s) {
  ffi_html_media_element_get_current_time(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_current_time(s, value) {
  ffi_html_media_element_set_current_time(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_default_muted(s) {
  ffi_html_media_element_get_default_muted(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_default_muted(s, value) {
  ffi_html_media_element_set_default_muted(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_default_playback_rate(s) {
  ffi_html_media_element_get_default_playback_rate(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_default_playback_rate(s, value) {
  ffi_html_media_element_set_default_playback_rate(
    s.as_html_media_element(),
    value,
  )
}

///|
impl IsHTMLMediaElement with get_disable_remote_playback(s) {
  ffi_html_media_element_get_disable_remote_playback(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_disable_remote_playback(s, value) {
  ffi_html_media_element_set_disable_remote_playback(
    s.as_html_media_element(),
    value,
  )
}

///|
impl IsHTMLMediaElement with get_duration(s) {
  ffi_html_media_element_get_duration(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_ended(s) {
  ffi_html_media_element_get_ended(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_error(s) {
  ffi_html_media_element_get_error(s.as_html_media_element()).to_option()
}

///|
impl IsHTMLMediaElement with get_loop(s) {
  ffi_html_media_element_get_loop(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_loop(s, value) {
  ffi_html_media_element_set_loop(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_media_keys(s) {
  ffi_html_media_element_get_media_keys(s.as_html_media_element()).to_option()
}

///|
impl IsHTMLMediaElement with get_muted(s) {
  ffi_html_media_element_get_muted(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_muted(s, value) {
  ffi_html_media_element_set_muted(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_network_state(s) {
  ffi_html_media_element_get_network_state(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_paused(s) {
  ffi_html_media_element_get_paused(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_playback_rate(s) {
  ffi_html_media_element_get_playback_rate(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_playback_rate(s, value) {
  ffi_html_media_element_set_playback_rate(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_played(s) {
  ffi_html_media_element_get_played(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_preload(s) {
  ffi_html_media_element_get_preload(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_preload(s, value) {
  ffi_html_media_element_set_preload(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_preserves_pitch(s) {
  ffi_html_media_element_get_preserves_pitch(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_preserves_pitch(s, value) {
  ffi_html_media_element_set_preserves_pitch(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_ready_state(s) {
  ffi_html_media_element_get_ready_state(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_remote(s) {
  ffi_html_media_element_get_remote(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_seekable(s) {
  ffi_html_media_element_get_seekable(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_seeking(s) {
  ffi_html_media_element_get_seeking(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_sink_id(s) {
  ffi_html_media_element_get_sink_id(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_src(s) {
  ffi_html_media_element_get_src(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_src(s, value) {
  ffi_html_media_element_set_src(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_src_object(s) {
  ffi_html_media_element_get_src_object(s.as_html_media_element()).to_option()
}

///|
impl IsHTMLMediaElement with set_src_object(s, value) {
  ffi_html_media_element_set_src_object(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with get_text_tracks(s) {
  ffi_html_media_element_get_text_tracks(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_video_tracks(s) {
  ffi_html_media_element_get_video_tracks(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with get_volume(s) {
  ffi_html_media_element_get_volume(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with set_volume(s, value) {
  ffi_html_media_element_set_volume(s.as_html_media_element(), value)
}

///|
impl IsHTMLMediaElement with add_text_track(s, kind, label, language) {
  ffi_html_media_element_add_text_track(
    s.as_html_media_element(),
    kind,
    label,
    language,
  )
}

///|
impl IsHTMLMediaElement with capture_stream(s) {
  ffi_html_media_element_capture_stream(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with can_play_type(s, mime_type) {
  ffi_html_media_element_can_play_type(s.as_html_media_element(), mime_type)
}

///|
impl IsHTMLMediaElement with fast_seek(s, time) {
  ffi_html_media_element_fast_seek(s.as_html_media_element(), time)
}

///|
impl IsHTMLMediaElement with load(s) {
  ffi_html_media_element_load(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with pause(s) {
  ffi_html_media_element_pause(s.as_html_media_element())
}

///|
impl IsHTMLMediaElement with seek_to_next_frame(s) {
  ffi_html_media_element_seek_to_next_frame(s.as_html_media_element())
}

///|
extern "js" fn ffi_to_html_media_element(
  x : @js.Value,
) -> @js.Nullable[HTMLMediaElement] = "(x) => x instanceof HTMLMediaElement ? x : null"

///|
extern "js" fn ffi_html_media_element_get_audio_tracks(
  s : HTMLMediaElement,
) -> AudioTrackList = "(s) => s.audioTracks"

///|
extern "js" fn ffi_html_media_element_get_autoplay(
  s : HTMLMediaElement,
) -> Bool = "(s) => s.autoplay"

///|
extern "js" fn ffi_html_media_element_set_autoplay(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.autoplay = value"

///|
extern "js" fn ffi_html_media_element_get_buffered(
  s : HTMLMediaElement,
) -> TimeRanges = "(s) => s.buffered"

///|
extern "js" fn ffi_html_media_element_get_controls(
  s : HTMLMediaElement,
) -> Bool = "(s) => s.controls"

///|
extern "js" fn ffi_html_media_element_set_controls(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.controls = value"

///|
extern "js" fn ffi_html_media_element_get_controls_list(
  s : HTMLMediaElement,
) -> DOMTokenList = "(s) => s.controlsList"

///|
extern "js" fn ffi_html_media_element_get_cross_origin(
  s : HTMLMediaElement,
) -> @js.Nullable[String] = "(s) => s.crossOrigin"

///|
extern "js" fn ffi_html_media_element_set_cross_origin(
  s : HTMLMediaElement,
  value : String?,
) -> Unit = "(s, value) => s.crossOrigin = value"

///|
extern "js" fn ffi_html_media_element_get_current_src(
  s : HTMLMediaElement,
) -> String = "(s) => s.currentSrc"

///|
extern "js" fn ffi_html_media_element_get_current_time(
  s : HTMLMediaElement,
) -> Double = "(s) => s.currentTime"

///|
extern "js" fn ffi_html_media_element_set_current_time(
  s : HTMLMediaElement,
  value : Double,
) -> Unit = "(s, value) => s.currentTime = value"

///|
extern "js" fn ffi_html_media_element_get_default_muted(
  s : HTMLMediaElement,
) -> Bool = "(s) => s.defaultMuted"

///|
extern "js" fn ffi_html_media_element_set_default_muted(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.defaultMuted = value"

///|
extern "js" fn ffi_html_media_element_get_default_playback_rate(
  s : HTMLMediaElement,
) -> Double = "(s) => s.defaultPlaybackRate"

///|
extern "js" fn ffi_html_media_element_set_default_playback_rate(
  s : HTMLMediaElement,
  value : Double,
) -> Unit = "(s, value) => s.defaultPlaybackRate = value"

///|
extern "js" fn ffi_html_media_element_get_disable_remote_playback(
  s : HTMLMediaElement,
) -> Bool = "(s) => s.disableRemotePlayback"

///|
extern "js" fn ffi_html_media_element_set_disable_remote_playback(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.disableRemotePlayback = value"

///|
extern "js" fn ffi_html_media_element_get_duration(
  s : HTMLMediaElement,
) -> Double = "(s) => s.duration"

///|
extern "js" fn ffi_html_media_element_get_ended(s : HTMLMediaElement) -> Bool = "(s) => s.ended"

///|
extern "js" fn ffi_html_media_element_get_error(
  s : HTMLMediaElement,
) -> @js.Nullable[MediaError] = "(s) => s.error"

///|
extern "js" fn ffi_html_media_element_get_loop(s : HTMLMediaElement) -> Bool = "(s) => s.loop"

///|
extern "js" fn ffi_html_media_element_set_loop(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.loop = value"

///|
extern "js" fn ffi_html_media_element_get_media_keys(
  s : HTMLMediaElement,
) -> @js.Nullable[MediaKeys] = "(s) => s.mediaKeys"

///|
extern "js" fn ffi_html_media_element_get_muted(s : HTMLMediaElement) -> Bool = "(s) => s.muted"

///|
extern "js" fn ffi_html_media_element_set_muted(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.muted = value"

///|
extern "js" fn ffi_html_media_element_get_network_state(
  s : HTMLMediaElement,
) -> Int = "(s) => s.networkState"

///|
extern "js" fn ffi_html_media_element_get_paused(s : HTMLMediaElement) -> Bool = "(s) => s.paused"

///|
extern "js" fn ffi_html_media_element_get_playback_rate(
  s : HTMLMediaElement,
) -> Double = "(s) => s.playbackRate"

///|
extern "js" fn ffi_html_media_element_set_playback_rate(
  s : HTMLMediaElement,
  value : Double,
) -> Unit = "(s, value) => s.playbackRate = value"

///|
extern "js" fn ffi_html_media_element_get_played(
  s : HTMLMediaElement,
) -> TimeRanges = "(s) => s.played"

///|
extern "js" fn ffi_html_media_element_get_preload(
  s : HTMLMediaElement,
) -> String = "(s) => s.preload"

///|
extern "js" fn ffi_html_media_element_set_preload(
  s : HTMLMediaElement,
  value : String,
) -> Unit = "(s, value) => s.preload = value"

///|
extern "js" fn ffi_html_media_element_get_preserves_pitch(
  s : HTMLMediaElement,
) -> Bool = "(s) => s.preservesPitch"

///|
extern "js" fn ffi_html_media_element_set_preserves_pitch(
  s : HTMLMediaElement,
  value : Bool,
) -> Unit = "(s, value) => s.preservesPitch = value"

///|
extern "js" fn ffi_html_media_element_get_ready_state(
  s : HTMLMediaElement,
) -> Int = "(s) => s.readyState"

///|
extern "js" fn ffi_html_media_element_get_remote(
  s : HTMLMediaElement,
) -> RemotePlayback = "(s) => s.remote"

///|
extern "js" fn ffi_html_media_element_get_seekable(
  s : HTMLMediaElement,
) -> TimeRanges = "(s) => s.seekable"

///|
extern "js" fn ffi_html_media_element_get_seeking(s : HTMLMediaElement) -> Bool = "(s) => s.seeking"

///|
extern "js" fn ffi_html_media_element_get_sink_id(
  s : HTMLMediaElement,
) -> String = "(s) => s.sinkId"

///|
extern "js" fn ffi_html_media_element_get_src(s : HTMLMediaElement) -> String = "(s) => s.src"

///|
extern "js" fn ffi_html_media_element_set_src(
  s : HTMLMediaElement,
  value : String,
) -> Unit = "(s, value) => s.src = value"

///|
extern "js" fn ffi_html_media_element_get_src_object(
  s : HTMLMediaElement,
) -> @js.Nullable[@js.Value] = "(s) => s.srcObject"

///|
extern "js" fn ffi_html_media_element_set_src_object(
  s : HTMLMediaElement,
  value : @js.Value?,
) -> Unit = "(s, value) => s.srcObject = value"

///|
extern "js" fn ffi_html_media_element_get_text_tracks(
  s : HTMLMediaElement,
) -> TextTrackList = "(s) => s.textTracks"

///|
extern "js" fn ffi_html_media_element_get_video_tracks(
  s : HTMLMediaElement,
) -> VideoTrackList = "(s) => s.videoTracks"

///|
extern "js" fn ffi_html_media_element_get_volume(
  s : HTMLMediaElement,
) -> Double = "(s) => s.volume"

///|
extern "js" fn ffi_html_media_element_set_volume(
  s : HTMLMediaElement,
  value : Double,
) -> Unit = "(s, value) => s.volume = value"

///|
extern "js" fn ffi_html_media_element_add_text_track(
  s : HTMLMediaElement,
  kind : String,
  label : String?,
  language : String?,
) -> TextTrack = "(s, kind, label, language) => s.addTextTrack(kind, label, language)"

///|
extern "js" fn ffi_html_media_element_capture_stream(
  s : HTMLMediaElement,
) -> MediaStream = "(s) => s.captureStream()"

///|
extern "js" fn ffi_html_media_element_can_play_type(
  s : HTMLMediaElement,
  mime_type : String,
) -> String = "(s, mimeType) => s.canPlayType(mimeType)"

///|
extern "js" fn ffi_html_media_element_fast_seek(
  s : HTMLMediaElement,
  time : Double,
) -> Unit = "(s, time) => s.fastSeek(time)"

///|
extern "js" fn ffi_html_media_element_load(s : HTMLMediaElement) -> Unit = "(s) => s.load()"

///|
extern "js" fn ffi_html_media_element_pause(s : HTMLMediaElement) -> Unit = "(s) => s.pause()"

///|
extern "js" fn ffi_html_media_element_seek_to_next_frame(
  s : HTMLMediaElement,
) -> Unit = "(s) => s.seekToNextFrame()"
