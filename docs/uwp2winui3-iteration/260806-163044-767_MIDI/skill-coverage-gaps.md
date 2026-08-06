# Skill coverage gaps

1. **Bootstrap ordering was not explicit enough.** Step 0 named the first three commands but did not say they must be separate sequential tool calls. The agent parallelized them, so bootstrap and self-check ran before scaffolding completed. Make the dependency and wait requirement explicit.
