# Dev-agent slips

- **Bootstrap race:** ignored the explicit Step 0 ordering and ran scaffold/bootstrap/self-check concurrently.
- **Build/launch race:** ignored the explicit build-before-launch loop.
- **UWP splash-only baseline:** evaluation-side random failure; no migration-skill change can address it.
