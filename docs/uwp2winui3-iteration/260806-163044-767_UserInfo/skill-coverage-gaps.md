# Skill coverage gaps

- **Stateful commands were not explicitly serialized.** The existing ordered wording was too easy to interpret as parallelizable. Step 0 and the build/launch/validation loop now require waiting for each operation and identify the lock errors caused by overlap.
