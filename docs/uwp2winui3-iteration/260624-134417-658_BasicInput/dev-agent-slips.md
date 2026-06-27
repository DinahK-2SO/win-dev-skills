# Dev-agent slips (skill adequate / non-issue → NO skill change)

1. **Non-fatal nullable warnings (CS86xx).** Build succeeded, score 100. Generic C#
   nullability noise from a `<Nullable>`-enabled scaffold; not a migration defect and not
   worth skill prose. A re-run yields the same passing build.
