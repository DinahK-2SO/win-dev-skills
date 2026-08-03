# Discrepancies — Compass (83)

- **Req 1 Data Events** — pass.
- **Req 2 Polling** — pass.
- **Req 3 Calibration** — partial. Radios present; **calibration bar never shows** on 'Unreliable'. Popup opened without `XamlRoot` = silent no-op in WinUI 3. Skill covered `XamlRoot` for `ContentDialog` only, not `Popup`.

Visual: UWP shows the calibration banner; WinUI shows nothing (`03_Calibration__a03_Unreliable.png`).
