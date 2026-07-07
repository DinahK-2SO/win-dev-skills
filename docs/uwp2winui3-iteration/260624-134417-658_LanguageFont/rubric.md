# Parity Rubric — LanguageFont (UWP → WinUI 3)

Feature: **Language Font CS Sample** — demonstrates `LanguageFontGroup` (ja-JP) recommended fonts.

## Scenario 1 — Fonts for UI
- **Control:** Button "Apply Recommended Fonts"
- **Expected behavior:** Applies `LanguageFontGroup("ja-JP")` `UIHeadingFont`/`UITextFont`
  to `HeadingTextBlock` and `BodyTextBlock`. This changes font family/weight/style, **not**
  the text content — so a text-token diff will (correctly) show no change.
- **Outputs:** `HeadingTextBlock`, `BodyTextBlock` (Japanese sample text).

## Scenario 2 — Fonts for Documents
- **Control:** Button "Apply Recommended Fonts"
- **Expected behavior:** Applies document-oriented recommended fonts to `HeadingTextBlock`
  and `DocumentTextBlock`.
- **Outputs:** `HeadingTextBlock`, `DocumentTextBlock`.

## Grading notes
- Structural coverage target: 1 control per scenario (the Apply button) plus the output
  TextBlocks.
- Behavioral: the Apply button changes font, not text; the text-token behavioral heuristic
  cannot observe font changes, so a "0 new tokens" result is **not** evidence of a dead
  control here. Verified the migrated handler is wired identically to the UWP source.
