# Parity discrepancies — NetworkConnectivity (index 0)

**Score 100/100 · builds ✔ · runs ✔ · 3/3 pass · 0 behavioral regressions**

| # | Requirement | Status | Notes |
|---|-------------|--------|-------|
| 1 | Query network connectivity | pass | Live; code-behind byte-identical to UWP |
| 2 | Get network cost information | pass | Functional; auto-invoke FAIL was UIA name ambiguity (capture artifact) |
| 3 | Listen to connectivity changes | pass | Live; registers NetworkStatusChanged, logs to ResultsText |

**Visual discrepancies:** none (WinUI 3 screenshots show a blank client area — the known PrintWindow/XAML-island capture artifact; UIA tree + live actuation confirm full rendering).

**Missing features:** none.

**Summary:** A faithful migration. No skill-defect surfaced from parity. The only build friction was a generalizable CS0104 `HttpClient` collision (`System.Net.Http` vs `Windows.Web.Http` under `ImplicitUsings`), fixed inline — captured as the improvement below.
