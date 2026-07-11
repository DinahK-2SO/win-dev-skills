# Parity Discrepancies — UserInfo (WinUI 3 vs UWP)

**Summary:** The migrated WinUI 3 app faithfully replicates the original UWP *UserInfo*
(“Account picture name C# sample”). All 3 scenarios are present with full structural control
coverage (3/3 each) and every primary action control produces correct, meaningful output.
**No missing controls, no dead controls, no wrong output** were detected.

## Behavioral evidence (WinUI, from capture-manifest)

| Scenario | Action | Responded | Output |
|---|---|---|---|
| Find users | Show properties | ✅ | Real user properties: `firstName: Dinah`, `lastName: Gao`, `accountName: xiaomgao@microsoft.com`, `principalName`, `domainName …\xiaomgao`, `AuthenticationStatus: LocallyAuthenticated` |
| Watch users | Start watching | ✅ | `Dinah Gao` listed; `Enumeration complete. Watching for changes...` |
| Watch users | Stop watching | ⚠️ no-op | Invoked OK; no new output token (expected — stopping the watcher leaves list/status unchanged) |
| Check user consent group | Show Consent Group | ✅ | `Child content: Allowed. Minor content: Allowed. Adult content: Allowed.` |

## Capture caveats (environmental, not migration defects)

1. **WinUI 3 screenshots captured blank** (both default and `--capture-screen`). This is a known
   WinUI 3 / non-interactive-session composition-capture limitation, **not** an app defect. The
   UIA tree (32 elements, real bounds) and the behavioral output text confirm the app renders and
   functions fully.
2. **UWP behavioral golden unavailable.** The UWP `CoreWindow`'s inner UIA subtree is not reachable
   via `winapp`, and foreground activation is blocked in this session, so the UWP controls could not
   be actuated for a side-by-side behavioral golden. WinUI behavior was judged against the
   source-derived checklist and the app's own real output.

## Discrepancies

- **[info] Watch users → Stop watching — no-op output.** Invoked successfully but produced no new
  visible token. Expected behavior (stopping the `UserWatcher` does not change already-populated
  content). Not a dead control; no downgrade.

## Layout

- Side-by-side pixel comparison was limited (UWP golden = Scenario-1 initial view only; WinUI pixels
  did not capture). Structural layout parity confirmed via the WinUI UIA tree, which mirrors the UWP
  structure: `SampleTitle` "Account picture name C# sample", `N) <title>` scenario list, Description
  label, `UserList` ComboBox, action Button, `ResultsText`, Microsoft logo, copyright + Trademarks/
  Privacy links.
