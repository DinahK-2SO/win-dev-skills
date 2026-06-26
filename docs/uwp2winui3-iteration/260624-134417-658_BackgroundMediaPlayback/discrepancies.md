# Discrepancies — BackgroundMediaPlayback (WinUI 3 vs UWP golden)

Capture note: this is a headless box (GDI `CopyFromScreen` fails with "handle invalid").
The original **UWP** CoreWindow captured real pixels (golden screenshots ~808 KB), but the
migrated **WinUI 3** desktop window renders its content through a DirectX swapchain that
PrintWindow captures as solid black on a headless session (every WinUI frame is the same
10,772-byte black PNG). Visual diffing of the WinUI side is therefore not possible; the
WinUI verdicts below are based on the **UI Automation tree** (authoritative for structure
and presence), corroborated by `winapp ui search`/`inspect`.

## Scenario 1 — Background Media Playback  [FAIL]
The migrated app navigates to Scenario1 (default selection) but the content frame renders
**empty** — none of the scenario's controls appear in the UIA tree:

| Control (UWP)        | UWP golden | WinUI 3 | Note |
|----------------------|-----------|---------|------|
| mediaPlayerElement   | present (video + transport controls visible) | **MISSING** | not in UIA tree; `winapp ui search Media/Play` finds only the window title |
| prevButton           | present   | **MISSING** | `search Previous` → 0 matches |
| playButton           | present   | **MISSING** | `search Play` → only title text |
| nextButton           | present   | **MISSING** | `search Next` → 0 matches |
| speedButton ("Speed")| present   | **MISSING** | `search Speed` → 0 matches |
| Track list (Ring 1…) | present   | **MISSING** | `search Ring` → 0 matches |
| Audio Category combo | present   | **MISSING** | `search Audio` → 0 matches |

Structural coverage 0/5; behavioral 0/4 live actions. Selecting the "1) Background Media
Playback" nav item via SelectionItemPattern succeeds but the content frame stays empty /
on the previously-shown page — strong evidence the `Scenario1` page throws during
construction or `Loaded` (its constructor touches `PlaybackService.Instance.Player` and
`Player.PlaybackSession.PlaybackRate`), so `ScenarioFrame.Navigate(Scenario1)` does not
produce a rendered page. The UWP original rendered this scenario fully on the same
machine, so this is a migration regression, not an environment limitation.

## Scenario 2 — Settings  [PASS]
Reachable and renders content: "Toast on App Events" (checked) and "Use Custom Controls"
(unchecked) toggles are present in the UIA tree. The source checklist lists 0 named
controls for this scenario, so structural coverage is n/a; functionally the page works.
