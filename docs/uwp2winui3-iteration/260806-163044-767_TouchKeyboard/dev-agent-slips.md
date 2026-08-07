# Dev-agent slips

- Ran scaffold/bootstrap concurrently despite an explicit sequence.
- Regenerated XAML despite the copy-then-transform fidelity rule, causing x:Bind compiler errors.
- Ignored the fetched navigation anchor's exact first-page-sticks warning and second-item check.
- Ran final build concurrently with validator despite the required after-PASS order.
- Assumed Python was installed instead of using the documented API-research path.

No skill change is justified solely for these slips.
