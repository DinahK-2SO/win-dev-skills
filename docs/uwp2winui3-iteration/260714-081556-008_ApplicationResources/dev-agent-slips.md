# Dev-agent slips (NO skill change) — ApplicationResources

- The agent both wrote a working ResourceContext scenario9 AND removed Scenario9 from
  `constants.cs`. The nav-list omission is a one-off; the root driver is the
  `#getforcurrentview` defect (see skill-defects.json #1). Fixing that removes the
  deferral incentive, so no slip-specific skill edit is needed.
