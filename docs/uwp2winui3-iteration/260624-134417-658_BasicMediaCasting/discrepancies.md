# Discrepancies — BasicMediaCasting (scored 100, 3/3 pass)

The scoring task found **no migration defects**; all three scenarios structurally
replicate the UWP source. This note records the one build-time friction that is
generalizable enough to feed a skill improvement.

| Req | Feature | Status | Note |
|----|---------|--------|------|
| 1 | Basic Media Casting | pass | MediaPlayerElement transport + Load Video |
| 2 | Casting Using Casting Picker | pass | CastingDevicePicker wired |
| 3 | Casting Using Custom Picker | pass | DeviceWatcher + devices list |

**Friction (not a scored defect):** initial build failed with `WMC0001 Unknown type
'MediaElement'` (x3) and required code-behind rewrites (`SetSource` →
`Source = MediaSource.CreateFromStream`, `GetAsCastingSource()` →
`MediaPlayer.GetAsCastingSource()`). Suspected skill gap: the element-swap table frames
`MediaElement → MediaPlayerElement` as "minor renames" and omits the imperative
code-behind delegation through `.MediaPlayer`.
