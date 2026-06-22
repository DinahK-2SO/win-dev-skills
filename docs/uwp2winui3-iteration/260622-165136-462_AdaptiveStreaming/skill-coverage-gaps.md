# Skill coverage gaps (skill clarified) — AdaptiveStreaming

## 1. csproj guidance under-emphasized linked shared sources
- The Project File Updates section listed `<Compile Include>` only as "drop", risking the agent ignoring linked shared sources entirely (or re-adding them and causing duplicate-item errors).
- Improvement: callout that `<Link>`ed shared sources are auto-harvested into the cone and must not be re-added as `<Compile Include>` on top of the default glob.
- Generalizes: every shared-content sample.
