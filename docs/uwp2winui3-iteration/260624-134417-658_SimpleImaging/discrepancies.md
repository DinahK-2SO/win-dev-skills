# Discrepancies — SimpleImaging

- **Score:** 0 · **Builds:** yes · **Runs:** no (fail-fast `0xc0000409` at startup)

| # | Feature | Status | Why |
|---|---------|--------|-----|
| 1 | Image properties (FileProperties) | fail | App crashed at startup; 0/14 controls, blank screenshot. |
| 2 | Image transforms/encode (BitmapDecoder) | fail | App crashed at startup; 0/8 controls, blank screenshot. |

**Visual:** every WinUI screenshot is a 0-byte blank — the process fail-fasts before rendering.

**Suspected skill gap:** startup XAML-load crash from the verbatim `<Image Source="" />` placeholder on the first-navigated page; compounded by missing `0xc0000409`/no-1026 crash guidance and a crash-signature tool that reported a red-herring `REGDB_E_CLASSNOTREG` (from the agent's own unpackaged `.exe` run).
