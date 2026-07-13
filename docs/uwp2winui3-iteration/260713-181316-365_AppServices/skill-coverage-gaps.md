# Skill coverage gaps — AppServices (→ WILL change skill)

- **App Service *provider* activation unsupported in WinAppSDK.**
  `ExtendedActivationKind.AppService` (CS0117) and `IAppServiceActivatedEventArgs`
  (CS0234) don't exist; the agent ported the UWP provider branch and had to strip it.
  - Evidence: session-log.txt:2797-2798, provider branch deleted at :2858.
  - Covered at: MIGRATION-PATTERNS.md 'Application Lifecycle and Activation' — lists
    File/Protocol/AppNotification kinds but never says which are absent, never mentions
    App Services (under-emphasized).
  - Improvement: add a callout — no AppService kind, drop/host-out-of-process the
    provider, client-side `AppServiceConnection` still works with package identity.
  - Generalizes: any app-service provider migration hits the same wall.
