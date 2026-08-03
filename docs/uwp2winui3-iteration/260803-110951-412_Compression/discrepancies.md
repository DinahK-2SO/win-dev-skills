# Discrepancies — Compression (index 0)

- **Score 100**, builds ✅, runs ✅, 1/1 feature pass.
- **Req 0 — Compression/Decompression sample: PASS.** 2/2 controls present; Compress button responds in both apps; picker opens; DEFAULT status text matches.
- **Visual (cosmetic):** UWP golden dark theme vs WinUI system-default light. Not a functional defect; no skill change (see dev-agent-slips).
- **Summary:** clean migration. Only build-time struggle was orphaned members after a partial class-body replace of a class with an `#if WINDOWS_PHONE_APP` dead branch — addressed by the skill improvement.
