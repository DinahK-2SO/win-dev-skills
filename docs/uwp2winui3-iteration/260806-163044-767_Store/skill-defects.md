# Skill defects

## D1 — External linked files omitted

- **Evidence:** bootstrap copied 10 files; the UWP project declares 19 additional supported `Include` + `Link` items.
- **Skill state:** absent.
- **General fix:** materialize linked files at their logical Link paths before rewrite/triage.

## D2 — Wrong build command

- **Evidence:** turn 24 rejected `winapp build`.
- **Skill state:** wrong.
- **General fix:** use native `dotnet build`; use winapp only for packaged launch.

## D3 — Local XAML resource path not validated

- **Evidence:** `/Styles/Styles.xaml` did not exist; startup failed with `0xc000027b`; all seven requirements failed.
- **Skill state:** absent.
- **General fix:** validate local `ResourceDictionary Source` targets with file/line diagnostics.

## D4 — Default dotnet output not discovered

- **Evidence:** turn 32 built under `bin/Debug`; turn 33 searched only `bin/x64/Debug`.
- **Skill state:** wrong.
- **General fix:** search both layouts.

## D5 — Duplicate Page error undocumented

- **Evidence:** turn 25 `NETSDK1022`.
- **Skill state:** absent.
- **General fix:** state that SDK-style WinUI projects include local XAML pages by default.

## D6 — No-defer sentinels disagreed

- **Evidence:** bootstrap wrote `(none)`; validator warned in three runs.
- **Skill state:** wrong.
- **General fix:** make the validator recognize the producer's sentinel.
