# Parity Rubric — BackgroundTransfer (UWP → WinUI 3)

Ground-truth feature list derived from the original UWP C# source
(`uwp-samples-standalone\Samples\BackgroundTransfer\cs`). Each scenario is graded
pass / partial / fail on structural control coverage **and** behavioral response,
compared against the original UWP app.

| # | Scenario | Controls | Action controls to actuate |
|---|----------|----------|----------------------------|
| 1 | File Download | 8 | Start Download, Start High Priority Download, Pause All, Resume All, Cancel All |
| 2 | File Upload | 5 | Start Upload, Start Multipart Upload, Cancel All |
| 3 | Completion Notifications | 4 | Start three downloads and show toast on completion, Start three downloads and update tile on completion |
| 4 | Completion Groups | 2 | Start ten downloads in a completion group |
| 5 | Random Access Downloads | 8 | Start, Pause, Resume, Seek |
| 6 | Recoverable Errors | 5 | Start |
| 7 | Download Reordering | 4 | Start Download, Make Current |

Grading:
- **pass** — scenario reachable, ≥80% of baseline controls present in the WinUI UIA tree, and its action controls respond as in the UWP golden.
- **partial** — reachable, ≥40% coverage, or a control present but dead / a blank initial frame with structural+behavioral evidence.
- **fail** — blank/unreachable, <40% coverage, or the app never presents a frame.
