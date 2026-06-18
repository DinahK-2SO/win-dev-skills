# BasicInput – UWP Feature Rubric

> **UWP capture status:** Failed — App crashed at startup in `Windows.UI.Xaml.dll` (`0xc000027b`): native XAML stowed exception (legacy projection incompatibility on newer OS). Rubric derived from source code only.

---

## Navigation / Scenario list navigation

**ID:** `scenario-navigation`  
**Weight:** 2  

The app displays a list of 5 scenarios in a sidebar/list on the left. Clicking a scenario name loads the corresponding page in the content area on the right.

**Expected behaviour:**
- A list with 5 items is visible: 'Input Events', 'PointerPoint Properties', 'Device Capabilities', 'XAML Manipulations', 'Gesture Recognizer'
- Clicking a scenario name loads the corresponding page content in the main area
- The selected scenario is visually highlighted in the list

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 1 – Input Events / Pointer Pressed / Released interaction

**ID:** `input-events-pointer-pressed-released`  
**Weight:** 1  

A grey bordered rectangle responds to pointer press and release. On press, background changes to RoyalBlue and text shows 'Pointer Pressed'. On release, background reverts to LightGray and text shows 'Pointer Released'.

**Expected behaviour:**
- A 150×100 bordered rectangle labeled 'Pointer Pressed / Released' is displayed
- Clicking/pressing the rectangle changes its background to blue and displays 'Pointer Pressed'
- Releasing the pointer reverts the background to light grey and displays 'Pointer Released'

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 1 – Input Events / Pointer Enter / Exit interaction

**ID:** `input-events-pointer-enter-exit`  
**Weight:** 1  

A grey bordered rectangle responds to pointer enter and exit. On pointer enter, background changes to RoyalBlue and text shows 'Pointer Entered'. On pointer exit, background reverts to LightGray and text shows 'Pointer Exited'.

**Expected behaviour:**
- A 150×100 bordered rectangle labeled 'Pointer Enter / Exit' is displayed
- Moving the pointer into the rectangle changes its background to blue and displays 'Pointer Entered'
- Moving the pointer out of the rectangle reverts the background to light grey and displays 'Pointer Exited'

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 1 – Input Events / Tap / Double-Tap interaction

**ID:** `input-events-tap-doubletap`  
**Weight:** 1  

A grey bordered rectangle responds to tap and double-tap gestures. On tap, background changes to DeepSkyBlue and text shows 'Tapped'. On double-tap, background changes to RoyalBlue and text shows 'Double-Tapped'.

**Expected behaviour:**
- A 150×100 bordered rectangle labeled 'Tap / Double-Tap' is displayed
- Single-clicking the rectangle changes its background to sky blue and displays 'Tapped'
- Double-clicking the rectangle changes its background to royal blue and displays 'Double-Tapped'

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 1 – Input Events / Right-Tap / Press-and-Hold interaction

**ID:** `input-events-righttap-hold`  
**Weight:** 1  

A grey bordered rectangle responds to right-tap and holding gestures. Right-clicking shows 'Right Tapped' with RoyalBlue background. Holding shows 'Holding' with DeepSkyBlue, then 'Held' or 'Hold Canceled' on completion/cancel.

**Expected behaviour:**
- A 150×100 bordered rectangle labeled 'Right-Tap / Press-and-Hold' is displayed
- Right-clicking the rectangle changes its background to blue and displays 'Right Tapped'
- Press-and-hold changes background to sky blue and displays 'Holding', then reverts on release with 'Held'

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 2 – PointerPoint Properties / Pointer properties display canvas

**ID:** `pointer-properties-canvas`  
**Weight:** 2  

A canvas area where clicking or touching displays a popup showing pointer properties (ID, X, Y, contact state) at the pointer location. The popup follows the pointer while in contact and disappears on release.

**Expected behaviour:**
- A canvas area is displayed with instruction text 'Touch or click the screen to see information about the current pointer(s)'
- Clicking on the canvas displays a popup near the click position showing pointer ID, X, Y coordinates, and contact state
- The popup follows the pointer while the button/finger is held down
- The popup disappears when the pointer is released

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 2 – PointerPoint Properties / Mouse-specific pointer properties

**ID:** `pointer-properties-mouse-details`  
**Weight:** 1  

When using a mouse, the popup displays mouse-specific properties: left/right/middle button state, X1/X2 button state, and mouse wheel delta, with the text colored red.

**Expected behaviour:**
- Mouse click on the canvas shows additional mouse-specific properties in red text
- Properties include left button, right button, middle button, X1 button, X2 button states, and mouse wheel delta

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 3 – Device Capabilities / Keyboard capabilities display

**ID:** `device-capabilities-keyboard`  
**Weight:** 1  

Displays whether a keyboard is present on the device under a 'Keyboard Properties' heading.

**Expected behaviour:**
- A 'Keyboard Properties' heading is displayed
- Below the heading, text shows 'Keyboard present = 1' (or 0 if no keyboard)

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 3 – Device Capabilities / Mouse capabilities display

**ID:** `device-capabilities-mouse`  
**Weight:** 1  

Displays mouse capability details under a 'Mouse Properties' heading: presence, number of buttons, vertical/horizontal wheel presence, and button swap state.

**Expected behaviour:**
- A 'Mouse Properties' heading is displayed
- Below the heading, text shows mouse present status, number of buttons, vertical wheel present, horizontal wheel present, and buttons swapped status

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 3 – Device Capabilities / Touch capabilities display

**ID:** `device-capabilities-touch`  
**Weight:** 1  

Displays touch capability details under a 'Touch Properties' heading: touch presence and supported number of simultaneous contacts.

**Expected behaviour:**
- A 'Touch Properties' heading is displayed
- Below the heading, text shows touch present status and number of supported touch contacts

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 – XAML Manipulations / Rectangle drag and rotate via XAML manipulation events

**ID:** `xaml-manipulations-drag-rotate`  
**Weight:** 2  

A 200×200 light grey rectangle can be dragged and rotated using pointer/touch manipulation. During manipulation the rectangle turns DeepSkyBlue; during inertia it turns RoyalBlue; on completion it reverts to LightGray.

**Expected behaviour:**
- A 200×200 light grey bordered rectangle is displayed inside a canvas area
- Dragging the rectangle moves it across the canvas
- The rectangle changes to blue during active manipulation
- The rectangle reverts to light grey when manipulation completes

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 – XAML Manipulations / Movement axis ComboBox control

**ID:** `xaml-manipulations-axis-lock`  
**Weight:** 1  

A ComboBox labeled 'Movement Axis' with options 'X and Y', 'X only', 'Y only'. Selecting an option restricts the rectangle's drag movement to the specified axis/axes.

**Expected behaviour:**
- A ComboBox labeled 'Movement Axis' is visible with 'X and Y' selected by default
- Dropdown contains three options: 'X and Y', 'X only', 'Y only'
- Selecting 'X only' restricts rectangle dragging to horizontal movement only
- Selecting 'Y only' restricts rectangle dragging to vertical movement only

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 – XAML Manipulations / Inertia ToggleSwitch

**ID:** `xaml-manipulations-inertia-toggle`  
**Weight:** 1  

A ToggleSwitch labeled 'Inertia' controls whether translate and rotate inertia is enabled. When on (default), the rectangle continues moving after the pointer is released.

**Expected behaviour:**
- A ToggleSwitch labeled 'Inertia' is displayed and is on by default
- Toggling it off disables inertia — the rectangle stops immediately when released
- Toggling it on re-enables inertia — the rectangle glides after release

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 4 – XAML Manipulations / Reset button

**ID:** `xaml-manipulations-reset`  
**Weight:** 1  

A 'Reset' button restores the rectangle to its original position, resets the movement axis ComboBox to 'X and Y', and re-enables inertia.

**Expected behaviour:**
- A button labeled 'Reset' is visible
- Clicking Reset moves the rectangle back to its original position
- The Movement Axis ComboBox resets to 'X and Y'
- The Inertia toggle resets to on

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 5 – Gesture Recognizer / Rectangle drag and rotate via GestureRecognizer

**ID:** `gesture-recognizer-drag-rotate`  
**Weight:** 2  

Functionally identical to Scenario 4 but implemented using the GestureRecognizer class instead of XAML manipulation events. A 200×200 light grey rectangle can be dragged and rotated with the same color feedback.

**Expected behaviour:**
- A 200×200 light grey bordered rectangle is displayed inside a canvas area
- Dragging the rectangle moves it across the canvas
- The rectangle changes to blue during active manipulation
- The rectangle reverts to light grey when manipulation completes

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer movement axis ComboBox

**ID:** `gesture-recognizer-axis-lock`  
**Weight:** 1  

A ComboBox labeled 'Movement Axis' with options 'X and Y', 'X only', 'Y only'. Controls axis restriction via GestureSettings instead of ManipulationMode.

**Expected behaviour:**
- A ComboBox labeled 'Movement Axis' is visible with 'X and Y' selected by default
- Dropdown contains three options: 'X and Y', 'X only', 'Y only'
- Selecting 'X only' restricts movement to horizontal only
- Selecting 'Y only' restricts movement to vertical only

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer inertia ToggleSwitch

**ID:** `gesture-recognizer-inertia-toggle`  
**Weight:** 1  

A ToggleSwitch labeled 'Inertia' controls translate and rotate inertia via GestureSettings. On by default.

**Expected behaviour:**
- A ToggleSwitch labeled 'Inertia' is displayed and is on by default
- Toggling it off disables inertia
- Toggling it on re-enables inertia

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer reset button

**ID:** `gesture-recognizer-reset`  
**Weight:** 1  

A 'Reset' button restores the rectangle, resets axis ComboBox, re-enables inertia, and reinitializes the GestureRecognizer settings.

**Expected behaviour:**
- A button labeled 'Reset' is visible
- Clicking Reset moves the rectangle back to its original position
- The Movement Axis ComboBox resets to 'X and Y'
- The Inertia toggle resets to on

_UWP screenshot not captured (app crashed at startup due to legacy XAML incompatibility)_
