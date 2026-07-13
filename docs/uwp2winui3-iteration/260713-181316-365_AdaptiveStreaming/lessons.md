# Lessons — AdaptiveStreaming (score 93, 6 pass / 1 partial / 0 fail)

## Helpful
- Bootstrap + validator flow worked: all 7 scenario pages migrated, reachable, build succeeded.

## Tool limitations (eval side, NOT editable)
- `MediaPlayerElement` exposes no AutomationId → parity marks every media page's control "not found" (cov 0/1) despite transport controls rendering. Two `Set` buttons without AutomationId also weren't auto-invoked. This is a UIA/eval-skill limitation, not a migration defect.

## Errors
- Many non-fatal nullable-reference warnings (CS8600/8602/8603/8629) from the WinUI scaffold enabling nullable RTs on pre-nullable UWP code. Build still succeeded; gate only fails on WUI warnings.

## Dev-agent struggle (high value)
- **Scenario7 Live Seekable Range**: bottom seek-offset buttons clipped/offscreen in the ~768×519 capture window (cov 10/19). Root cause: the migrated `NavigationView`→`Frame` shell does **not** scroll-host the scenario content, so a page with a star-sized `MediaPlayerElement` row plus trailing Auto rows overflows the small window and clips its bottom controls out of the render and UIA tree. Preventable by shell-conversion guidance to scroll-host the content region.

## Env
- Original UWP app hung on splash across two launches → no UWP behavioral golden; scored against source checklist + WinUI capture.
