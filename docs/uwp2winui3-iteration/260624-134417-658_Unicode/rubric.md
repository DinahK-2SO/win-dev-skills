# Parity Rubric — Unicode

Feature: **Unicode tokenization C# sample**
Source: `uwp-samples-standalone\Samples\Unicode\cs`

## Scenario 1 — Tokenize lexical identifiers within a string
Class: `Scenario1_FindId`

Required controls:
| Control | Type | Notes |
|---|---|---|
| TextInput | TextBox | Multi-line input pre-seeded with a Unicode sample string (incl. surrogate-pair CJK-B chars) |
| Extract Identifiers | Button | Runs UnicodeCharacters tokenizer; replaces/annotates the text with delimited identifiers |

Outputs to verify: `TextInput` / `TextOutput` (TextBlock), shared `StatusBorder` / `StatusBlock`.

## Grading
- Structural: >=80% control coverage in captured UIA tree = pass, >=40% = partial, else fail.
- Behavioral: each action control actuated; a control live in UWP but dead in WinUI downgrades.
- Visual (governing): the page must actually render. A blank frame = fail regardless of the
  structural gate (a populated automation tree with no painted pixels is indistinguishable
  from a broken scenario to the user).
