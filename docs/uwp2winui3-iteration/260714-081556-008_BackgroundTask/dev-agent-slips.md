# Dev-agent slips — BackgroundTask (NO skill change)

## S1 — UWP manifest copied to a nested folder
- Two `Package.appxmanifest` files ended up in the tree; only the project-root one is the build
  manifest. Harmless, scenario-specific artifact of the copy step.
- The substantive general failure (extensions never merged into the build manifest) is handled as a
  skill-defect + coverage-gap, so no slip-oriented skill edit is needed.
