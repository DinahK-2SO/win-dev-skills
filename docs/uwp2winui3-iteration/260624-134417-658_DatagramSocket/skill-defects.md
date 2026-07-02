# Skill defects — DatagramSocket (WILL change skill)

## 1. CS0118 — RootNamespace collides with a same-named WinRT type
- **Problem:** Project `RootNamespace`/`AssemblyName` is `DatagramSocket`, identical to
  `Windows.Networking.Sockets.DatagramSocket`. Unqualified uses of the type bind to the
  namespace → `CS0118` (4 sites), plus cascading `WMC0909/WMC1509/WMC1111` XAML errors.
- **Evidence:** session-log.txt:4400-4408 (7-error build), :4459-4472 (diagnosis + first
  regex fix that corrupted the alias), :4552-4562 (cleanup), :5057 (clean rebuild);
  RootNamespace at :1944.
- **Skill state:** **absent** — no grep hit for CS0118 / collision / RootNamespace in
  SKILL.md, MIGRATION-PATTERNS.md, or the scripts. The 'Common build errors' section
  covers CS0104/CS0227/CS0101/CS0246 but not this.
- **Fix:** add a `### CS0118 …` subsection to MIGRATION-PATTERNS.md 'Common build errors'
  with the alias/fully-qualify recipe and the note that same-named XAML DataType errors
  are a downstream cascade.
- **Generalizes:** UWP samples are routinely named after the API they demo (StreamSocket,
  MediaCapture, FileOpenPicker, Geolocator …) and the scaffold sets the project name to
  match — so this collision is a broad, repeatable first-build failure.
