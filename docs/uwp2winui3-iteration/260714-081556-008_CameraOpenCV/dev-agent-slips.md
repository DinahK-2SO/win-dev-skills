# Dev-agent slips — CameraOpenCV (will NOT change skill)

## 1. OpenCvSharp4 build errors (CS0619 / CS1061 / CS1519)
- Obsolete `Mat(...)` ctor → `Mat.FromPixelData`; `MatExpr.Rows/Cols` → materialize to
  `Mat`; a stray brace. All in `OpenCVHelper.cs`; all fixed from compiler messages.
- **Why no skill change:** third-party CV library API/version details, unrelated to the
  UWP→WinUI 3 migration surface. Encoding one library's API churn would not generalize.

## 2. Camera preview / device-unavailable fallback
- Handled correctly via existing `#capture` pattern + Defensive-UI rule; requirement
  passed. Listed only to confirm no skill change is warranted here.
