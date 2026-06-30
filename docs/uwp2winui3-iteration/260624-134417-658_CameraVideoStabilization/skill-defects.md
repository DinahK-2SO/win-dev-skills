# Skill defects — CameraVideoStabilization

_None._ The relevant guidance exists in the skill (defer `CaptureElement`; provide a
visible fallback when init throws). The problem is that this guidance is **split** and
does not cover the **deferred-hero-control** case, which is a **coverage gap**, not an
absent/wrong defect. See `skill-coverage-gaps.md`.
