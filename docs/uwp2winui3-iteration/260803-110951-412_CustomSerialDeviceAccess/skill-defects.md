# Skill Defects — CustomSerialDeviceAccess (WILL change skill)

1. **Application.Suspending/Resuming removed in WinUI 3** (absent)
   - Evidence: turns 79-97, CS1061 across Scenario1 + EventHandlerForDevice.
   - Root cause: #lifecycle anchor covers OnLaunched/activation only, never states these events were removed.
   - Fix: add a 'Removed lifecycle events' note under #lifecycle.
   - Generalizes: suspend/resume resource cleanup is a standard UWP idiom (device/file/media handles).

2. **Missing shared-content custom styles → runtime XamlParseException / 0xC000027B** (absent)
   - Evidence: turns 109-118, 'Cannot find a Resource … SampleHeaderTextStyle'; fixed by copying styles into App.xaml.
   - Root cause: resources section covers dangling SYSTEM keys (WMC9999, compile-time) but not missing CUSTOM shared styles (runtime).
   - Fix: add a runtime failure-mode note; merge SharedContent Styles.xaml or copy referenced styles into Application.Resources.
   - Generalizes: all windows-universal-samples share SharedContent/xaml/Styles.xaml; every such migration hits this identically.
