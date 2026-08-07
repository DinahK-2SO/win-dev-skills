# Dev-agent slips

- **Speculative Mica removal:** startup guidance already says to diagnose from captured evidence; removing the backdrop did not change the crash.
- **Build from the wrong directory:** the next attempt correctly supplied the csproj; no additional skill rule is needed beyond the corrected explicit command.
- **Stale `Windows.UI.Colors`:** the namespace mapping table already gives `Microsoft.UI.Colors`; the compiler-driven fix was straightforward.
