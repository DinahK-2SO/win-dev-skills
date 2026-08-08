# XamlDeferLoadStrategy UWP rubric

_UWP capture was partial: the runner returned a live process and window, but the window remained on the Windows platform sample splash frame. The feature screenshots below were therefore not captured._

## Basic Deferral / Deferred content starts unrealized

**ID:** `basic-deferral-content`  
**Weight:** 1

The page explains lazy realization and initially omits the deferred two-by-two color grid.

**Expected behaviour:**
- The explanatory text and Realize Elements button are visible.
- The four colored rectangles are absent before the button is invoked.

_UWP screenshot not captured (the UWP window remained on its splash frame)._

## Basic Deferral / Realize deferred elements

**ID:** `basic-deferral-realize`  
**Weight:** 2

Invoking Realize Elements realizes the deferred grid through `FindName`.

**Expected behaviour:**
- Clicking Realize Elements displays a two-by-two grid of orange, green, blue, and yellow rectangles.
- The realized grid remains visible after the click.

_UWP screenshot not captured (the UWP window remained on its splash frame)._

## Adaptive Deferral / Mail list content

**ID:** `adaptive-mail-list`  
**Weight:** 1

The adaptive mail layout presents seeded messages with sender, subject, body preview, and received time.

**Expected behaviour:**
- Five seeded email rows are visible in the mail list.
- Each row includes sender, subject, body preview, and received time.

_UWP screenshot not captured (the UWP window remained on its splash frame)._

## Adaptive Deferral / Responsive pane realization

**ID:** `adaptive-pane-realization`  
**Weight:** 2

Visual states realize the reading pane at tablet width and the accounts pane at desktop width.

**Expected behaviour:**
- At widths of at least 768 pixels, the reading pane is visible.
- At desktop width, the account list is visible with four seeded accounts.

_UWP screenshot not captured (the UWP window remained on its splash frame)._

## Adaptive Deferral / Compose controls

**ID:** `adaptive-compose-pane`  
**Weight:** 1

The realized reading pane contains Send and Discard actions, To and CC fields, and an editable message body.

**Expected behaviour:**
- Send and Discard buttons are visible with their icons and labels.
- To, CC, and message body editing controls are present in the reading pane.

_UWP screenshot not captured (the UWP window remained on its splash frame)._

## Control Template Deferral / Conditional header template part

**ID:** `template-part-deferral`  
**Weight:** 2

Two `TitledImage` controls demonstrate that the deferred header presenter is created only when `Header` is supplied.

**Expected behaviour:**
- The Rainier image shows the Rainier header above it.
- The valley image appears without an empty header element above it.

_UWP screenshot not captured (the UWP window remained on its splash frame)._
