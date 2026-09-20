# A wrong canvas scale is invisible to argument validation

**Date:** 2026-09-20

## Problem

A browser game's visual-polish pass fixed one defect and, in doing so, introduced a
worse one while every existing suite reported green. The renderer paints in logical
units under a single scale transform. The fix correctly made the frame bounds logical,
but the transform on the next line still derived its scale from those same logical
bounds. Because the logical width is itself computed by dividing the backing-store
width by the stored backing-store ratio, that derivation is identically 1 at every
viewport, and the correct ratio already held in state was discarded.

Measured consequences: on a 1920x1200 store the renderer painted only the top-left
960x600; at an 800x500 store it painted 960x600 into 800x500; on a phone the
camera-centred player landed at device x=480 on a 390-wide canvas, that is,
off-canvas.

## Why no test saw it

- Every canvas argument stayed finite, so the validating stub context was satisfied.
- The "frame is not blank" assertion passed, because 960x600 of pixels is plenty.
- The pixel census passed at one viewport size, because there the wrong scale
  **over**-paints, and over-paint is indistinguishable from correct coverage.

## Retained design

- **The scale comes from the stored backing-store ratio** (`canvas.width /
  logicalWidth`), never from the frame size that ratio was used to compute.
- **Device-space coverage test.** The validating context records the live transform
  and, for every paint whose logical rect spans the frame, the DEVICE extent it
  produced. The assertion is that the extent equals the backing store, at desktop,
  high-DPR and phone sizes. That is a geometric invariant rather than an argument
  check, so it is the thing that can actually fail.
- **Live coverage test.** The delivered page is driven in a real browser at four
  viewports with the page's own drawing context instrumented before its script runs.
  It reports the recorded device box, the transform scale, and how many sampled pixels
  are still fully transparent in the backing store, so an unpainted region cannot hide.
  (An interim revision compared RGB against the page's CSS background instead; reading
  canvas pixels returns the backing store, which never contains CSS, so that comparison
  measured nothing and was corrected.)
- **Mutation checks.** Reinstating the old expression failed 15 stub assertions and 9
  live ones, so both guards demonstrably detect the bug they were written for. A
  regression test that cannot fail is documentation, not a test.
- **Sprite passes inherit the sprite transform.** An outline pass built from a
  sprite's own alpha mask did not mirror when the player faced left, so with
  asymmetric art the fringe sat on the wrong side of the hull. It now takes the same
  flip flag, and a test compares the horizontal scale sign of the sprite blit against
  every outline blit at both facings.
- **Liveness from state, not copy.** A visual test had decided whether a frame was
  playable by matching overlay headlines in the first N characters of page text. It
  now reads the computed visibility of the overlay that actually blocks play.
- **Assert arithmetic rules, not empirical pixel claims.** Five darkness statistics
  were tried on a live descent and each was moved by a different legitimate cause: a
  transient light source, the black floor of a percentile, a band of warm
  environmental light, a creature sitting in a corner, and player death preventing a
  sample below that band. The empirical claim was removed, its limit documented, and
  the renderer's own veil alpha is now asserted in a stubbed frame, where nothing has
  to survive a run in order to be measured.

## Lessons

- A canvas that is never cleared needs an assertion that every pixel was painted this
  frame; a cleared canvas needs the same, or coverage bugs become the background.
- Never infer a defect's absence from one viewport size. The same wrong scale clips on
  one machine and hides itself on another.
- Where an empirical measurement keeps being unreliable, ask whether the claim is
  really a deterministic rule about the code. It usually is.
- For a project that is not version-controlled, record the exact per-file backup and
  rollback map, and bind the work-state file to the artifact directory whose
  screenshot hashes back the visual claims.
