# Parity discrepancies — DatagramSocket

Score **100/100**, 5/5 pass, builds ✔ runs ✔. No functional migration defects.

| # | Feature | Status | Note |
|---|---------|--------|------|
| 1 | Start Datagram Listener | pass | 7/7 controls, matches live UWP golden |
| 2 | Connect to Listener | pass | 4/4 controls, graded vs UWP source XAML |
| 3 | Send Data | pass | SendHello + SendOutput |
| 4 | Close Socket | pass | CloseSockets='Close' |
| 5 | Multicast/Broadcast | pass | 9/9 controls incl. code-set values |

**Visual discrepancies:** none observable — WinUI screenshots were blank (headless
swapchain-compositor limitation; a measurement caveat, not a migration defect). Fidelity
was judged from the fully-populated UIA tree.

**Actionable evidence:** the only substantive issue is a build-time CS0118 collision
(RootNamespace `DatagramSocket` vs the WinRT type of the same name). It did not lower the
score but is uncovered by the skill and generalizes → see skill-defects.
