# Skill Coverage Gaps — AdaptiveStreaming (iteration 1)

**Category: skill-coverage-gap** → WILL change skill

## Item 1: "Copy verbatim then transform" doesn't mention verifying StaticResource availability

- **Problem**: Agent copied XAML with `{StaticResource SampleHeaderTextStyle}` references intact, but the resource keys aren't defined in the target app
- **Evidence**: Scenario XAML files faithfully copied per skill instructions, but the "transform" scope implicitly covers only namespace changes and control swaps — not resource key availability
- **Covered at**: SKILL.md "Fidelity (highest priority)" section: "Copy each *.xaml verbatim, then transform — controls, names, and event handlers must be preserved"
- **Why missed**: under-emphasized — transform scope listed as "controls, names, and event handlers" with no mention of StaticResource/ThemeResource key verification
- **Proposed improvement**: Expand the bullet to include: "verify that all {StaticResource}/{ThemeResource} keys are defined in the target's resource chain; if keys come from an external shared dictionary, copy it and register in App.xaml"
- **Generalizes**: Any XAML migration with external resource references hits this gap
