# Skill coverage gaps

- **Mixed-language dependencies were only excluded at the top-project level.** The bootstrap now detects non-C# `ProjectReference` items in an otherwise C# UWP app and stops with an explicit prerequisite instead of allowing silent omission or fabricated behavior.
