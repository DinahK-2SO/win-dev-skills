# Dev-Agent Slips — Compass (iteration 1)

**None.** The single problem (no `.csproj` produced) is not a dev-agent decision at all —
it is a Tier-0 environment failure: the first model call returned HTTP 401 and the
session terminated before the agent could act. A re-run with valid credentials is
required; this is recorded as an env issue / human-deferred item, not a slip. No items.
