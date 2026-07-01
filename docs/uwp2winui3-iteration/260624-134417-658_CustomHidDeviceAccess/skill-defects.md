# Skill defects — CustomHidDeviceAccess (WILL change skill)

## 1. Whole-window blank render from the scaffold's Mica `SystemBackdrop`
- **Problem:** Every scenario renders a byte-uniform blank white window; app builds and
  launches, UIA tree populated with valid geometry, nothing painted.
- **Evidence:** migration-score.json (4/4 fail, "controls exist in the UIA tree … but
  nothing is painted"); 12,562-byte white PNG vs 80,979-byte UWP golden; session-log.txt
  2077-2091 shows `<Window.SystemBackdrop><MicaBackdrop/>` kept from the scaffold.
- **Skill state:** **absent.** All existing "blank" guidance is *per-page* (nav/init
  throws, deferred controls). No coverage of a whole-window backdrop blank.
- **Root cause:** `dotnet new winui` (Step 0) scaffolds a Mica backdrop that needs DWM
  composition the headless/software-GPU capture host lacks; the window stays alive so every
  process-alive gate passes.
- **Fix:** bootstrap step 3c strips `<Window.SystemBackdrop>`; validator §9 WARNs on a
  survivor; MIGRATION-PATTERNS `#system-backdrop-blank-window` + SKILL.md callout.
- **Generalizes:** every scaffolded migration inherits the backdrop; capture hosts are
  headless. Removing it costs no parity (UWP had no backdrop).
