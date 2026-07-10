# Parity Report — Store C# Sample

Generated 2026-07-10T08:50:31.3966141+08:00 by Compare-Parity.ps1.

**Parity score: 100 / 100**  ·  pass=7 partial=0 fail=0  ·  7 scenario(s)

| # | Scenario | Verdict | Coverage | Actions | Screenshot | Notes |
|---|----------|---------|----------|---------|------------|-------|
| 1 | Trial-mode | PASS | 1/1 | 1/1 live | 01_Trial_mode.png |  |
| 2 | In-app purchase | PASS | 3/3 | 1/2 live | 02_In_app_purchase.png |  |
| 3 | Unmanaged consumable product | PASS | 5/5 | 1/4 live | 03_Unmanaged_consumable_product.png |  |
| 4 | Managed consumable product | PASS | 5/6 | 0/4 live | 04_Managed_consumable_product.png | Missing 1/6 control(s): ComboBox (QuantityComboBox) |
| 5 | User collection | PASS | 2/2 | 1/1 live | 05_User_collection.png |  |
| 6 | App listing URI | PASS | 1/1 | 1/1 live | 06_App_listing_URI.png |  |
| 7 | Business to Business | PASS | 2/2 | 1/2 live | 07_Business_to_Business.png |  |

All scenarios reached `pass`. ✔

> Coverage is a structural proxy (AutomationId / name / label text found in the
> captured UIA tree). A `pass` here is necessary but not sufficient: also confirm
> visually (screenshots) and behaviourally that each control does what the UWP
> source does. Set `AutomationProperties.AutomationId` on controls to make this
> check reliable.
