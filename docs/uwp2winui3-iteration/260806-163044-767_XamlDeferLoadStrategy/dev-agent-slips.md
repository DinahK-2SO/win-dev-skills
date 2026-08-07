# Dev-agent slips

- **Bootstrap race:** Commands explicitly numbered 1-3 were run concurrently.
- **Namespace inconsistency:** Related partial classes and XAML type references were changed piecemeal.
- **Generated activation break:** Speculative `required` members were added and then reverted to initialized properties.
- **Build-tree race:** Build, launch, and validation were run concurrently despite the documented sequential loop.
