# Rubric - DisplayOrientation

## Scenario 1 - Show and lock orientation
Controls: 4 checkboxes (Prefer landscape/portrait/landscape flipped/portrait flipped), Apply preferences button.
Outputs: Native orientation, Current orientation, Auto-rotation preferences text; Status block.
Action: Apply preferences (sets DisplayInformation.AutoRotationPreferences). Note: in UWP golden this produced no visible text change (device does not rotate), so behavioral response is not expected.
