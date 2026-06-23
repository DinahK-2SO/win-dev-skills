# Dev-agent slips — ActivitySensor (will NOT change skill)

## 1. CS0246 'MainPage' not found in MainWindow.xaml.cs
One-off missing `using SDKTemplate;`. Fixed in a single turn (44→45). Trivial CS0246
resolution; not a general skill gap.

## 2. DataTemplate x:Bind → {Binding} workaround
WMC0909/WMC1111 after WMC1509 'No LocalAssembly'. Resolved in one turn (46) with a standard
`{Binding}` fallback. x:Bind support is already documented; the WMC1509 cause looks like a
transient markup-compiler artifact, so no prescriptive advice added (avoids steering future
migrations into an unnecessary x:Bind→Binding downgrade).
