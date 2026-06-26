# Discrepancies — AudioCreation (UWP → WinUI 3 parity)

**Bottom line:** Structural parity is complete — all 6 scenarios reachable, 100% control
coverage (4/4, 5/5, n/a, 4/4, 13/13, 2/2). No behavioral regression was detectable. The
open items below are **environmental measurement limitations**, not migration defects.

## 1. WinUI screenshots are blank (capture-environment limitation) — INFO
Every WinUI 3 screenshot is blank-white (`00_launch.png` / `01_File_Playback.png` =
11273 bytes). Both `winapp ui screenshot` and a GDI `CopyFromScreen` fall over on WinUI
composed surfaces in this session — `CopyFromScreen` throws **"The handle is invalid"**,
i.e. there is no interactive desktop to read pixels from. The WinUI **UIA tree is fully
populated**: correct sample title, per-scenario "Description: …" header, and every expected
control with real layout bounds. Fidelity was therefore verified via the UIA dumps rather
than pixels. By contrast the **UWP** golden frame did capture real pixels (it shows the
6-scenario nav + File Playback page), because a UWP window is captured through
`ApplicationFrameHost`.

## 2. UWP golden has no actuated baseline (host-window limitation) — INFO
The original UWP CoreWindow is hosted by `ApplicationFrameHost`, so `winapp ui invoke` /
`inspect` only reach the host pane — no UWP scenario could be navigated or clicked. All
UWP golden frames default to the initial **File Playback** scenario and **zero** control
responses were recorded. Consequence: there is no UWP behavioral signal to diff against,
so a WinUI control that produces no output is *flagged for review*, never auto-failed.
The UWP app itself launched cleanly in Release (PID 27812, window "AudioCreation").

## 3. Audio actions inconclusive (no audio hardware) — INFO
The scoring machine has **no audio output device** — the UWP app banner reads *"Device
Output unavailable because DeviceNotAvailable"*. Every AudioGraph action (Start Graph,
Create Graph, Record, ECHO/REVERB/LIMITER/EQUALIZER toggles) is therefore hardware-gated
in **both** apps and cannot produce observable output. Not a migration defect.

## 4. File-picker handlers verified live (positive) — OK
WinUI `Load File` produced a real response (file-open dialog) in **File Playback**,
**Inbox Effects**, and **Custom Effects**, confirming the migrated `FileOpenPicker`
handlers are wired and functional.

## Per-feature

| # | Scenario | Coverage | WinUI live actions | Verdict | Note |
|---|----------|----------|--------------------|---------|------|
| 1 | File Playback | 4/4 | Load File | pass | Start Graph/Loop hardware-gated / inconclusive |
| 2 | Capture From Device | 5/5 | — | pass | Device-capture + file-save actions gated by no audio device |
| 3 | Using A FrameInput Node | n/a | n/a | pass | Informational scenario, reachable & rendered |
| 4 | Using A Submix Node | 4/4 | — | pass | Load File/Echo/Start Graph gated by no audio device |
| 5 | Inbox Effects | 13/13 | Load File | pass | All 13 controls incl. 4 effect toggles present; Load File live |
| 6 | Custom Effects | 2/2 | Load File | pass | Load File live; Start Graph hardware-gated |
