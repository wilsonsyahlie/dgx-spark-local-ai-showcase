# Observed behavior before an assistant hands over a page

A page can load cleanly while its main button does nothing. An image reviewer can describe the page confidently while missing a real change. Those are different failures, and neither should be hidden behind a generic approval.

This retrospective describes a publishing check that separated observed browser behavior from visual opinion. Small data-only specifications described expected control transitions, repeated actions and refresh outcomes. The test runner read the specification from a frozen artifact, performed bounded interactions and observed the resulting interface. Unsupported or missing coverage remained unresolved; the page could not merely declare itself successful.

Independent review exposed useful edge cases. Repeated Reset actions can correctly do nothing. An invisible ancestor can hide a control whose own style appears visible. A control revealed briefly can escape an inventory taken only before and after a test. Caught errors can remain absent from uncaught-exception reports. Each finding became a focused regression rather than an ignored warning.

A supposed refresh regression initially failed for an unrelated sandbox restriction. Preserving that evidence and replacing the fixture demonstrated the intended refresh failure without weakening the check. Cancellation and duplicate handling were verified separately from successful actions.

The engineering lesson is to attach approval to observable, bounded claims. A working interaction does not prove good visual design, and a favorable visual judgment does not prove a working interaction. The resulting record keeps that distinction explicit rather than promising universal agent reliability.



## Bounded end-to-end evidence

A normal creator request exposed a broken toggle through the publisher, repaired its missing event handler and republished without another instruction. Browser checks then observed the requested first-action, repeat-action and refresh states at wide and narrow layouts. The test specification stayed unchanged across repair. This supported the bounded publishing workflow; it did not establish visual quality or universal agent compliance.
