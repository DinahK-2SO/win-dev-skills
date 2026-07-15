# BasicMediaCasting — UWP → WinUI 3 parity discrepancies

## Measurement conditions
- **UWP golden**: `uwp-app-runner` reported `ok:true` (built Release, process alive, window
  "BasicMediaCasting C# Sample"), but the original UWP app **never presented its XAML content** —
  it stayed on the OS splash ("Windows platform sample") for the entire session. The CoreWindow
  (HWND 2949604) exposed only an empty content Pane, and repeated foreground + synthesized-input
  nudges did not force a first frame. Golden screenshots therefore contain **no feature content**,
  so visual pixel-parity was judged against the **UWP source** + the live WinUI render, and the
  behavioral check was performed by independently actuating the WinUI controls (no UWP behavioral
  golden to diff against).
- **WinUI candidate**: built clean (`dotnet build`, 0 errors), launched via `winapp run`, all three
  scenarios drivable and rendering.

## Per-feature findings (WinUI vs UWP source)

### 1. Basic Media Casting — PASS
- MediaPlayerElement with built-in transport controls incl. **Cast to Device** button (source uses
  `MediaElement AreTransportControlsEnabled=True`) — present & rendered.
- `Load Video` button (`loadButton`) — present; **invoking it opens the FileOpenPicker "Open"
  dialog** (WinUI 3 desktop file-picker HWND init works, no crash). Behaviorally live.

### 2. Casting Using Casting Picker — PASS
- MediaPlayerElement + `Load Video` present.
- `Cast Button` (`castButton`) present (source `castButton` "Cast Button"). Its handler shows the
  system `CastingDevicePicker` — **hardware-gated**, so not actuated to completion; flagged for
  manual review, not failed (present + wired).

### 3. Casting Using Custom Picker — PASS
- MediaPlayerElement + `Load Video` present.
- `Start Device Watcher` (`watcherControlButton`) — **behaviorally verified**: invoking it toggled
  the label to "Stop Device Watcher", activated the ProgressRing ("Searching"), and displayed the
  green status "Watcher has been started". Matches source behavior.
- `Disconnect` button present but `Visibility=Collapsed` initially — matches source.
- Device `ListBox` (`castingDevicesList`) present (empty until real cast devices appear —
  hardware-gated).

## Minor / cosmetic
- Nav item labels carry a numeric prefix ("1) Basic Media Casting", "2) …", "3) …") vs the bare
  source scenario titles. This is the standard SDK-sample numbering pattern and is cosmetic; it did
  cause the automated title-driven capture to miss S2/S3 (searched for the un-prefixed title while
  the nav pane was also collapsed behind a hamburger), so S2/S3 were verified by manual navigation.
- Navigation shell is a collapsible hamburger `NavigationView` (UWP used a ListBox scenario list);
  functionally equivalent, titles preserved.

## Dead controls / regressions
- **None detected.** Every interactive control actuated in WinUI responded (Load Video → picker,
  Start Device Watcher → ring + status). Cast Button and device list are legitimately hardware-gated.
