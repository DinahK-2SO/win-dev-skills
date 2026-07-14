# Discrepancies — Background Activation (UWP → WinUI 3)

**UWP capture status:** degraded (see below).

## 1. UWP golden un-capturable — measurement limitation (baseline)
`uwp-app-runner` returned `ok:true` (pid 28120, window "Background Activation C# Sample",
SDK 10.0.26100.0): the app built (Release/.NET Native), deployed, launched and stayed
alive with a window. **But its CoreWindow content never composed** in this
non-interactive automation context — the app stayed on the OS splash ("Windows platform
sample") and the `ApplicationFrameWindow` content pane was **empty** in the UIA tree
across repeated foreground attempts and waits. Only splash frames were captured, so there
is **no live UWP feature/behaviour golden** to compare against. Baseline fell back to the
source-derived checklist plus direct `.xaml` reading.

## 2. Checklist parsed 0 controls — measurement limitation (baseline)
`Extract-UwpFeatureChecklist.ps1` emitted 6 scenarios with **0 controls / 0 actions**
each (the buttons live in per-scenario `.xaml` files the extractor doesn't descend into).
Consequently `Compare-Parity.ps1` reports coverage `n/a` and its **100/100 PASS is only a
non-blank-screenshot check**, not real control coverage. Control expectations were
recovered manually from the `.xaml` sources.

## 3. Numbered nav titles — cosmetic (winui3)
The migrated `ScenarioControl` ListBox renders items as "1) Background Task" … "6) Grouped
Background Task". Title-driven nav searching the verbatim un-numbered title didn't switch
scenarios during `Capture-AppScenarios`, so all six `parity/winui3` frames are identical
Scenario-1 renders. **Manual ListItem selection confirmed all 6 scenarios navigate and
render distinct, correct content** (see `manual/s1.png`…`manual/s6.png`).

## 4. Register button shows no visible response — behavioural, unconfirmed (winui3)
Actuating **Register** (coordinate click *and* UIA invoke, window forced foreground) did
**not** change the `Status` output ("Unregistered" persisted; Unregister stayed disabled)
on Scenarios 1 and 6. winapp UIA also reports the Button *"does not support any invoke
pattern."* The app doesn't crash (no global `UnhandledException` handler), so the click
either doesn't reach the handler or `Register()`/`RequestAccessAsync` is silently gated.
Background-task registration is **environment-gated** (needs an interactive foreground
access grant) and there is **no UWP golden behaviour to compare against** (see #1), so per
the scoring rules this is **flagged for manual review, not a confirmed regression** — but
it caps each scenario at **partial** because behavioural fidelity could not be verified.

## 5. No windows.backgroundTasks manifest extension — informational (parity)
The migrated manifest declares no `windows.backgroundTasks` extension — **but neither does
the original UWP manifest** (both use the single-process `BackgroundActivated` model).
Not a regression; does not by itself explain the dead Register button.

---

### Verdict summary
Structurally and visually the migration is **faithful**: all 6 scenarios present with
verbatim (numbered) titles, correct per-scenario descriptions, and the correct control
sets (incl. Scenario 6's extra "Unregister Ungrouped Tasks"). **Behaviour could not be
confirmed** for the primary Register/Unregister action, and no UWP golden existed to
establish expected behaviour → every scenario scored **partial** (not `pass`, per the
dead/unverified-control rule; not `fail`, since scenarios render non-blank with the right
controls).
