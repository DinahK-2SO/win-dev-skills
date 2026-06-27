# Parity Rubric — BasicInput (UWP → WinUI 3)

Feature: **Basic Input sample** — 5 scenarios. Ground truth = original UWP app
(`Basic Input C# Sample`, launched live, pid 13160) plus the UWP source.

| # | Scenario | Expected controls (from UWP source) | Expected behavior |
|---|----------|--------------------------------------|-------------------|
| 1 | Input Events | 4 target areas: Pointer Pressed/Released, Pointer Enter/Exit, Tap/Double-Tap, Right-Tap/Press-and-Hold (Border targets) | Each area reacts to pointer/tap events with status text |
| 2 | PointerPoint Properties | Canvas + instructional text "Touch or click the screen to see…" | Pointer movement reports PointerPoint properties |
| 3 | Device Capabilities | Keyboard / Mouse / Touch property readouts | Live capability values populated at load |
| 4 | XAML Manipulations | ComboBox `movementAxis`, ToggleSwitch `inertiaSwitch`, Button `resetButton`, draggable Border `manipulateMe` | Drag/scale/rotate the border; Reset restores; Inertia toggles; axis filters movement |
| 5 | Gesture Recognizer | ComboBox `movementAxis`, ToggleSwitch `InertiaSwitch`, Button `resetButton`, Canvas `mainCanvas` + Border `manipulateMe` | GestureRecognizer-driven manipulation; Reset/Inertia/axis controls |

Verdict scale: **pass** = scenario present, controls match source, controls respond;
**partial** = present but a control is missing or dead; **fail** = scenario missing /
blank / unreachable.
