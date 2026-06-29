# Lessons — BluetoothAdvertisement

- **Root failure:** `dotnet build` failed with `CS0115: App.OnBackgroundActivated no suitable method to override`. The UWP in-process background-task entry point was copied verbatim into the WinUI 3 `App`; `Microsoft.UI.Xaml.Application` has no such method. WMC9999 followed; app never ran. 0/4 features.
- **Struggle:** Background Tasks section names `BackgroundTaskBuilder` but never tells the agent to delete the `OnBackgroundActivated` override / `IBackgroundTask` classes → agent kept them → build dead.
- **Preventable by:** make Background Tasks section list the override + task classes as remove-on-sight build breakers; back-nav-style validator hint.
