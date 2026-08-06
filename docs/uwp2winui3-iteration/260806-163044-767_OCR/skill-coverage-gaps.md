# Skill coverage gaps

- **Visual fidelity is not operationalized.** Existing “do not redesign” language did not protect `RequestedTheme` or inherited typography/brush semantics. Promote these to explicit invariants.
- **Element-swap cleanup is ambiguous.** The camera recipe says to preserve the name but demonstrates a rename. Require updating every XAML/code-behind reference after a swap.
