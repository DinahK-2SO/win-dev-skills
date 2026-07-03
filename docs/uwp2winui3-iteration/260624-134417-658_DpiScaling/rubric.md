# UWP Feature Rubric — DpiScaling

**Scenario:** `DpiScaling`
**UWP capture status:** partial — Scenario 1 golden captured from the live UWP app (PID 2504, window "DPI Scaling C# Sample"); Scenario 2 golden not captured (legacy UWP CoreWindow exposes no child UIA tree and mouse injection is unavailable in this headless session, so the scenario ListBox could not be actuated).

---

## Shell / Scenario navigation list

**ID:** `scenario-navigation`
**Weight:** 2

Left-hand ListBox to switch between the two DPI scaling scenarios.

**Expected behaviour:**
- Exactly two items: "1) Load images for different scales" and "2) Override default scaling of UI elements".
- Selecting an item navigates the content frame to that scenario page.

**UWP reference screenshot:**
![scenario-navigation](screenshots/00_launch.png)

## Scenario 1 / Current scale and logical DPI readout

**ID:** `s1-scale-readout`
**Weight:** 1

**Expected behaviour:**
- Shows "Current scale:" with the live scale percentage (e.g. 150%).
- Shows "Logical DPI for this scale:" with the matching DPI (e.g. 144 DPI).

**UWP reference screenshot:**
![s1-scale-readout](screenshots/01_Load_images_for_different_scales.png)

## Scenario 1 / Not scaling aware image demo

**ID:** `s1-not-scaling-aware`
**Weight:** 1

**Expected behaviour:**
- Projector image beside "Not scaling aware (not recommended)".
- Text notes the asset is distorted at scales other than 100%.

**UWP reference screenshot:**
![s1-not-scaling-aware](screenshots/01_Load_images_for_different_scales.png)

## Scenario 1 / Scaled packaged assets demo

**ID:** `s1-scaled-packaged`
**Weight:** 1

**Expected behaviour:**
- Projector image with a scale badge (e.g. "1.8x") beside "Scaled packaged assets".
- Text describes the image.scale-100/140/180 naming convention.

**UWP reference screenshot:**
![s1-scaled-packaged](screenshots/01_Load_images_for_different_scales.png)

## Scenario 1 / Vector graphics (XAML path) demo

**ID:** `s1-vector-xaml-path`
**Weight:** 1

**Expected behaviour:**
- Projector graphic rendered from XAML path data beside "Vector Graphics Using XAML Path".

**UWP reference screenshot:**
![s1-vector-xaml-path](screenshots/01_Load_images_for_different_scales.png)

## Scenario 1 / Scaled external assets demo

**ID:** `s1-scaled-external`
**Weight:** 1

**Expected behaviour:**
- "Scaled external assets" section with a projector image and a status/URL readout.

**UWP reference screenshot:**
![s1-scaled-external](screenshots/01_Load_images_for_different_scales.png)

## Scenario 2 / Resolution / scaling header readout

**ID:** `s2-resolution-readout`
**Weight:** 1

**Expected behaviour:**
- An "Overriding scaling" header / resolution readout at the top of the scenario.

**UWP reference screenshot:**
_UWP screenshot not captured (Scenario 2 not reachable in the legacy UWP CoreWindow via UIA; mouse injection unavailable in headless session)._

## Scenario 2 / Default scaling UI element measurements

**ID:** `s2-default-scaling`
**Weight:** 2

**Expected behaviour:**
- DefaultRelativePx shows a "view px" value (e.g. 100.0 view px).
- DefaultPhysicalPx shows a "raw px" value (e.g. 150 raw px).
- DefaultLayoutText shows the default point size (e.g. 20pt).

**UWP reference screenshot:**
_UWP screenshot not captured (see above)._

## Scenario 2 / Override scaling UI element measurements

**ID:** `s2-override-scaling`
**Weight:** 2

**Expected behaviour:**
- OverrideRelativePx shows a reduced "view px" value (e.g. 66.7 view px).
- OverridePhysicalPx shows a "raw px" value (e.g. 100 raw px).
- OverrideLayoutText shows the overridden point size (e.g. 13pt).

**UWP reference screenshot:**
_UWP screenshot not captured (see above)._
