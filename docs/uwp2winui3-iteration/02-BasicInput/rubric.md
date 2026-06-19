# BasicInput – UWP Feature Rubric

> **UWP capture status:** failed — App crashed at startup in Windows.UI.Xaml.dll (0xc000027b): native XAML stowed exception on newer OS build. Rubric derived from source code only.

---

## Navigation / Scenario list navigation

**ID:** `scenario-navigation`  
**Weight:** 2  

The main page shows a SplitView with a left pane listing all 5 scenarios. Selecting a scenario loads its content in the right frame.

**Expected behaviour:**
- A ListBox in the left pane displays 5 items: 'Input Events', 'PointerPoint Properties', 'Device Capabilities', 'XAML Manipulations', 'Gesture Recognizer'
- Clicking a scenario item loads the corresponding page in the content frame on the right
- The currently selected scenario is visually highlighted in the list

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Navigation / Hamburger menu toggle

**ID:** `splitview-toggle`  
**Weight:** 1  

A hamburger toggle button in the header opens/closes the SplitView pane containing the scenario list.

**Expected behaviour:**
- A toggle button with the hamburger icon (&#xE700;) is visible in the top-left header area
- Clicking the toggle button collapses or expands the left navigation pane
- The pane starts in the open (IsPaneOpen=True) state

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 1 – Input Events / Pointer Pressed / Released

**ID:** `pointer-pressed-released`  
**Weight:** 2  

A bordered rectangle responds to pointer press and release events by changing background color and displaying status text.

**Expected behaviour:**
- A 150x100 LightGray bordered rectangle is displayed with the label 'Pointer Pressed / Released'
- Pressing (mouse down) on the rectangle changes its background to RoyalBlue and text to 'Pointer Pressed'
- Releasing (mouse up) changes background back to LightGray and text to 'Pointer Released'

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 1 – Input Events / Pointer Enter / Exit

**ID:** `pointer-enter-exit`  
**Weight:** 1  

A bordered rectangle responds to pointer enter and exit events by changing background color and displaying status text.

**Expected behaviour:**
- A 150x100 LightGray bordered rectangle is displayed with the label 'Pointer Enter / Exit'
- Moving the pointer onto the rectangle changes its background to RoyalBlue and text to 'Pointer Entered'
- Moving the pointer off the rectangle changes background back to LightGray and text to 'Pointer Exited'

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 1 – Input Events / Tap / Double-Tap

**ID:** `tap-doubletap`  
**Weight:** 1  

A bordered rectangle responds to tap and double-tap gestures with distinct visual feedback.

**Expected behaviour:**
- A 150x100 LightGray bordered rectangle is displayed with the label 'Tap / Double-Tap'
- A single tap changes background to DeepSkyBlue and text to 'Tapped'
- A double-tap changes background to RoyalBlue and text to 'Double-Tapped'

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 1 – Input Events / Right-Tap / Press-and-Hold

**ID:** `righttap-hold`  
**Weight:** 1  

A bordered rectangle responds to holding and right-tap gestures with distinct visual feedback and state transitions.

**Expected behaviour:**
- A 150x100 LightGray bordered rectangle is displayed with the label 'Right-Tap / Press-and-Hold'
- Press-and-hold starts showing DeepSkyBlue background with text 'Holding'
- Completing the hold changes text to 'Held' with LightGray background
- Right-click (or hold-release) shows RoyalBlue background with text 'Right Tapped'

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 2 – PointerPoint Properties / Pointer properties display canvas

**ID:** `pointer-properties-canvas`  
**Weight:** 2  

A full-area canvas tracks pointer contacts and displays a floating popup with pointer ID, position, and contact state at the pointer location.

**Expected behaviour:**
- An instruction text reads 'Touch or click the screen to see information about the current pointer(s)'
- Clicking/touching the canvas creates a popup showing pointer ID, X, Y coordinates, and contact state
- The popup follows the pointer position while the button/finger is held down
- Releasing removes the popup from the canvas

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 2 – PointerPoint Properties / Device-specific pointer properties

**ID:** `pointer-device-specific-props`  
**Weight:** 1  

The pointer popup displays device-specific properties color-coded by input type: red for mouse, green for touch, yellow for pen.

**Expected behaviour:**
- Mouse input shows button states (left, right, middle, X1, X2) and wheel delta in red text
- Touch input shows contact rect dimensions (X, Y, Width, Height) in green text
- Pen input shows barrel button, eraser, and pressure properties in yellow text

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 3 – Device Capabilities / Keyboard capabilities display

**ID:** `device-capabilities-keyboard`  
**Weight:** 1  

Displays whether a keyboard is present on the current device.

**Expected behaviour:**
- A 'Keyboard Properties' header is shown
- Text displays 'Keyboard present = 1' (or 0 if no keyboard)

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 3 – Device Capabilities / Mouse capabilities display

**ID:** `device-capabilities-mouse`  
**Weight:** 1  

Displays mouse capability properties including presence, button count, wheel support, and swap status.

**Expected behaviour:**
- A 'Mouse Properties' header is shown
- Text displays: Mouse present, Number of buttons, Vertical wheel present, Horizontal wheel present, and Buttons swapped values

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 3 – Device Capabilities / Touch capabilities display

**ID:** `device-capabilities-touch`  
**Weight:** 1  

Displays touch capability properties including presence and supported contact count.

**Expected behaviour:**
- A 'Touch Properties' header is shown
- Text displays: Touch present and Touch contacts supported values

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 4 – XAML Manipulations / Rectangle drag and rotate

**ID:** `xaml-manipulation-translate-rotate`  
**Weight:** 2  

A 200x200 LightGray rectangle can be dragged (translated) and rotated via direct manipulation events. It changes color during manipulation.

**Expected behaviour:**
- A 200x200 LightGray rectangle is displayed on a Canvas
- Dragging the rectangle moves it (translates on X and Y axes)
- Multi-touch rotation rotates the rectangle
- During manipulation the rectangle turns DeepSkyBlue; during inertia it turns RoyalBlue; when complete it returns to LightGray

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 4 – XAML Manipulations / Movement axis selector

**ID:** `xaml-manipulation-axis-lock`  
**Weight:** 1  

A ComboBox allows restricting manipulation movement to X only, Y only, or both axes.

**Expected behaviour:**
- A ComboBox labeled 'Movement Axis' with options: 'X and Y', 'X only', 'Y only'
- Default selection is 'X and Y'
- Selecting 'X only' restricts dragging to horizontal movement only
- Selecting 'Y only' restricts dragging to vertical movement only

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 4 – XAML Manipulations / Inertia toggle switch

**ID:** `xaml-manipulation-inertia`  
**Weight:** 1  

A ToggleSwitch enables or disables inertia (momentum) after releasing the manipulated rectangle.

**Expected behaviour:**
- A ToggleSwitch labeled 'Inertia' is present and defaults to On
- When On, releasing a flick causes the rectangle to continue moving with deceleration
- When Off, the rectangle stops immediately when released

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 4 – XAML Manipulations / Reset button

**ID:** `xaml-manipulation-reset`  
**Weight:** 1  

A Reset button returns the rectangle to its original position and resets all manipulation options to defaults.

**Expected behaviour:**
- A button labeled 'Reset' is visible
- Clicking Reset returns the rectangle to its original position (no transform)
- The Movement Axis combo resets to 'X and Y' and Inertia switch resets to On

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer-based drag and rotate

**ID:** `gesture-recognizer-translate-rotate`  
**Weight:** 2  

A 200x200 rectangle is manipulated via the GestureRecognizer class (not XAML manipulation events). Behaviour mirrors Scenario 4 but uses a lower-level API.

**Expected behaviour:**
- A 200x200 LightGray bordered rectangle is displayed on a Canvas
- Dragging the rectangle moves it; multi-touch rotates it
- During manipulation the rectangle turns DeepSkyBlue; during inertia it turns RoyalBlue; when complete it returns to LightGray

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer movement axis selector

**ID:** `gesture-recognizer-axis-lock`  
**Weight:** 1  

A ComboBox allows restricting GestureRecognizer-based movement to X only, Y only, or both axes.

**Expected behaviour:**
- A ComboBox labeled 'Movement Axis' with options: 'X and Y', 'X only', 'Y only'
- Default selection is 'X and Y'
- Selecting 'X only' restricts movement to horizontal; 'Y only' restricts to vertical

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer inertia toggle

**ID:** `gesture-recognizer-inertia`  
**Weight:** 1  

A ToggleSwitch enables or disables inertia for the GestureRecognizer-based manipulation.

**Expected behaviour:**
- A ToggleSwitch labeled 'Inertia' defaults to On
- When On, flicking the rectangle causes momentum-based continued movement
- When Off, movement stops immediately on release

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_

---

## Scenario 5 – Gesture Recognizer / GestureRecognizer reset button

**ID:** `gesture-recognizer-reset`  
**Weight:** 1  

A Reset button returns the GestureRecognizer rectangle to its original state and resets options.

**Expected behaviour:**
- A button labeled 'Reset' is visible
- Clicking Reset returns the rectangle to original position and resets axis/inertia options to defaults

**UWP reference screenshot:**  
_UWP screenshot not captured (app crashed at startup due to legacy projection incompatibility)_
