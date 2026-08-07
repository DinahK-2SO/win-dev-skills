# Dev-agent slips

- **Manifest assets:** ignored a dedicated checklist and validator; fixed after registration failed.
- **Packaging mode:** added `WindowsPackageType=None` despite retaining package identity.
- **Completion gate:** never ran the mandatory final validator and stopped with launch known broken.
- **Compile-loop mistakes:** introduced namespace/import/color errors and compiled a temporary XAML file; these were local mistakes resolved by the existing build loop.

