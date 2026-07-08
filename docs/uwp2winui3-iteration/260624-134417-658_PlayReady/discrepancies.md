# Discrepancies — PlayReady (score 88; builds+runs; 3/4 pass, 1 partial)

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Reactive License Request | pass | 3 controls + Info panel + Output Log; matches UWP golden. |
| 2 | Proactive License Request | pass | 5 controls; Play/Stop disabled until license acquired. |
| 3 | Manage HW/SW DRM | pass | 5 controls (HW/SW DRM toggles, movie-path, Play, Stop). |
| 4 | Secure Stop | partial | Env-gated: page shows defensive fallback ("The object does not support this interface"); 0/5 controls render. |

## Visual
- Secure Stop shows a fallback TextBlock instead of its 5 controls. Root cause is the absent
  PlayReady DRM stack (Security Level 0 / Has Hardware DRM False), not a migration bug — the
  defensive-UI pattern the skill prescribes made it degrade gracefully.

## Notes
- WinUI screenshots are blank (DirectComposition capture limitation); parity judged from UIA trees.
- The two build-time crashes (MediaElement null player; App.xaml BasedOn) are the generalizable
  takeaways — see skill-defects / skill-coverage-gaps.
