# Dev-agent slips

- **Manifest reconciliation delayed:** exact asset and desktop-target checks already existed and the validator supplied the fixes.
- **Dependent build/run operations parallelized:** the documented build-then-launch-then-validate sequence was ignored, causing incomplete layouts and a file lock.
- **Missing controls namespace:** the agent added `Frame` without the already documented `Microsoft.UI.Xaml.Controls` import.
