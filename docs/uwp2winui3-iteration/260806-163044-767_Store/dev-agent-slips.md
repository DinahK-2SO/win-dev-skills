# Dev-agent slips

## S1 — MainWindow namespace mismatch

The agent left `x:Class="Store.MainWindow"` while changing code-behind to `SDKTemplate`. The fidelity rule and build loop already cover preserving paired XAML/code-behind.

## S2 — Unnecessary x:Bind rewrite

The agent introduced an x:Bind DataTemplate and compiler warning/errors (`WMC1509`, `WMC0909`, `WMC1111`, and `WMC9999`), then restored the source Binding template. The skill already says not to regenerate XAML.

## S3 — Nullable warnings

The first build retained nullable warnings; the existing zero-warning build gate exposed them and the next edits fixed them.

## S4 — Mapping statuses not completed

Ten rows remained `copied` at first validation. Step 1 explicitly requires status updates, and Step 4 caught the slip.

## S5 — Unsupported Mica guess

Removing `MicaBackdrop` did not change the crash. The startup-crash section already says to diagnose the captured cause rather than guess; the missing deterministic resource check is separately classified as D3.
