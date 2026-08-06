# Dev-agent slips

- **Bootstrap race:** the numbered scaffold/bootstrap/self-check sequence was run concurrently despite the explicit success gate. One sequential retry fixed it; no skill edit is warranted.
- **Build and validation skipped:** the transcript ended after edits without the prominently mandatory Step 3 build loop or Step 4 validator. Both feature failures and cascading XAML errors followed. The underlying linked-file tooling defect is addressed separately; repeating existing gate prose would add noise.

