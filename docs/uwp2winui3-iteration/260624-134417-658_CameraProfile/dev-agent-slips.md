# CameraProfile — Dev-Agent Slips (will NOT change skill)

## 1. Duplicate class/namespace after a partial whole-file rewrite
- **Evidence:** build-events.jsonl R12-R14 — agent removed the duplicated tail (lines 233-439)
  in a follow-up edit.
- **Slip type:** one-off-mistake (edit old_str matched only the header).
- **Why no skill change:** Generic editing discipline, not UWP→WinUI 3 knowledge. A capable
  re-run avoids it; adding edit-tool warnings to the migration skill would be noise.
