# WiFiScan migration lessons

## High-value findings

- The bootstrap modeled the directory tree, not the UWP project item graph. It omitted
  linked shared `App.xaml`, `MainPage`, styles, code, and assets, forcing manual
  reconstruction and dropping `RequestedTheme="Dark"`.
- `Test-AppLaunch.ps1 -Target` missed the ordinary `bin\Debug` layout. Its
  `0xc000027b` hint also sent investigation toward unsupported APIs before unresolved
  XAML resources.
- The nullable-enabled WinUI scaffold exposed legacy asynchronous device lifecycle
  assumptions through 128 `CS86xx` warnings.

## Errors and resolutions

- **Launch layout unavailable:** pass `-Layout`; now fixed by recursive `bin` discovery.
- **128 nullable warnings:** initialize stable state, make acquired device handles
  nullable, guard all event/button paths, and use a nullable `PropertyChanged` event.
- **`0xc000027b` XAML crash:** deploy the linked dictionary and use a resolvable
  `ResourceDictionary Source`.
- **Validator failures:** remove the legacy namespace from a comment and mark all
  completed mapping rows `done`.

## Environment

WiFi access was denied in both baseline and candidate, so adapter-dependent controls
could not be exercised. The visible `Access denied` fallback was preserved.
