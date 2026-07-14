# Dev-Agent Slips (will NOT change skill) — AdaptiveStreaming

## 1. CS0111/CS0102 duplicate MainPage members (SampleConfiguration.cs vs scaffold MainPage)
- **Evidence:** session-log.txt:9160-9161; fixed 9328-9344 in ~1-2 turns.
- **Covered clearly at:** SKILL.md Step 1 Shell conversion + Fidelity rules (MainPage -> MainWindow).
- **Slip type:** one-off-mistake. Generic C# partial-class competence; resolved instantly. No skill change.

## 2. UWP namespace inside a XAML comment (Styles.xaml:313)
- **Evidence:** session-log.txt:10030 (validator FAIL) -> 10080 (fixed).
- **Covered clearly at:** SKILL.md 'Comment hygiene' explicitly warns the residue grep matches inside comments.
- **Slip type:** read-but-ignored. Already prominent; validator caught it; fixed in one turn. No skill change.
