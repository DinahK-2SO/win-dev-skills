# Skill coverage gaps — MobileHotspot

## G1 — Surgical edit dropped an adjacent logic statement (D1, cost the point)
- **What broke:** `ApplyChanges_Click` lost `configuration.Ssid = SsidTextBox.Text;`.
  Requirement #1 pass→partial.
- **Evidence:** session-log L2563 — `old_str` widened to include the Ssid assignment
  while adding `!` to `m_tetheringManager`; `new_str` omitted it.
- **Already covered at:** Fidelity bullet (SKILL.md L181) — but that bullet targets
  *wholesale* `.cs` overwrites + visible text, not collateral deletion inside a targeted
  edit. Grey zone → coverage gap.
- **Fix:** add a Fidelity bullet on surgical-edit hygiene (reproduce every match-window
  line verbatim except the transformed one; re-read the replaced block).
- **Generalizes:** targeted string-replace edits dominate every migration; adjacent-
  statement deletion is a recurring, API-agnostic hazard.

## G2 — Generic defensive fallback masked source-specific status message (D2, minor)
- **What broke:** WinUI shows generic "could not initialize" vs UWP's specific
  capability message. Behaviourally equivalent, verdict pass.
- **Evidence:** session-log L1640 — blanket try/catch generic NotifyUser.
- **Already covered at:** Defensive-UI Rule paragraph (SKILL.md L224-227) which
  prescribes the generic fallback but not preserving a source-specific message.
- **Fix:** add a clause — preserve the source's specific failure message when it has one;
  generic fallback only when the source had none.
- **Generalizes:** SDK/device-dependent samples routinely carry precise degradation
  messages; blanket catches erode text parity broadly.
