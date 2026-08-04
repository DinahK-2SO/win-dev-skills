# Discrepancies — DisplayOrientation

## Scenario 1 — Show and lock orientation

### HIGH — orientation outputs broken (wrong output / broken behavior)
- **UWP golden:** Native orientation: **Landscape**, Current orientation:
  **Landscape**, Auto-rotation preferences: **None**.
- **WinUI candidate:** Native orientation: **N/A**, Current orientation: **N/A**,
  Auto-rotation preferences: *"DisplayInformation not available on desktop: Element
  not found. GetForCurrentView must be called on a thread that is associated with a
  CoreWindow."*
- The migrated code relies on `DisplayInformation.GetForCurrentView()`, which throws
  on WinUI 3 desktop (no CoreWindow). The sample's entire purpose — reporting display
  orientation — is non-functional. A defensive fallback keeps the frame non-blank, but
  it surfaces a raw exception string rather than real orientation values.

### LOW — layout overflow
- The long exception fallback text wraps and is clipped at the right edge of the
  window. Cosmetic; a side effect of the HIGH defect.

## Structural vs behavioral
- **Structural:** 5/5 controls present in the WinUI UIA tree (parity gate PASS).
- **Behavioral:** "Apply preferences" produced no visible text change in **both** UWP
  and WinUI (0/1 live in each) — the button is not a regression on its own. The
  regression is in the **orientation output fields**, which work in UWP and are broken
  in WinUI.

## Verdict rationale
Controls exist and the page is reachable, but the primary feature output is broken.
Per the rubric, a feature whose output is wrong/dead is at best **partial**, never a
full pass — despite the structural gate reporting 100%.
