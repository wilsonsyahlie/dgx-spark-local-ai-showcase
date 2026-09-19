# Case study: the browser that was already installed

**Date.** 2026-09-19

## The situation

A browser game had been delivered with a delivery record that said, truthfully as
far as its author knew, that the page had never been run in a browser because no
browser existed on the machine that built it. Three headless harnesses covered the
rules, long autoplay invariants, and the renderer against a validating canvas stub.
That was the honest limit stated at delivery.

The limit was false. A browser was already on disk, cached by an automation
framework that was not itself installed as a package.

## Getting a browser automation API without a driver package

A Chromium headless shell starts, points at a URL, and writes the port of its
DevTools server into a file inside the profile directory it was given. Reading that
port, listing the targets over HTTP, and attaching a WebSocket to a target is a
complete automation API. From there it is method names: evaluate an expression,
dispatch a key event, override the device metrics, capture a screenshot, subscribe
to exceptions and console errors and network requests.

That made it possible to test the delivered artifact rather than a local copy of
the source: the same address a player types, served by the same server, loading the
same files. Twenty-six assertions now run there, and the harness exits green
without them when no browser is present, so the suite stays usable anywhere.

Two of the assertions are worth naming. One is a serving promise: every network
request the page makes must go to the host it was loaded from and nowhere else —
which catches a future edit that quietly adds a font or a CDN reference, something
no source-tree grep of the current files would need to catch. Another is that a
started frame is not blank, is not a flat fill, contains pixels in the intended
colour family, and differs between two samples ninety milliseconds apart, which is
what "the loop is alive" means without a human watching.

## Measuring pictures without looking at them

No image viewer was available on the machine, so the captured frames were censused
rather than admired: a sampled census of luminance and hue per frame. Three frames
gave lit fractions of 0.374, 0.613, and 0.546; between one hundred and one hundred
twenty-eight distinct luminance levels; and mean luminance falling from 53.9 in the
shallow band to 12.6 in the deep band.

Those numbers say something specific. A hundred-plus luminance levels means the
background gradient and the glow ramps are continuous rather than banded, which is
the failure mode of cheap gradient work. The fourfold luminance collapse with depth
is the art direction working as intended — the deeper the player goes, the more the
frame is carried by the creatures' own light rather than by anything ambient.

Screenshots are artifacts. The census is the assertion. That distinction matters,
because a screenshot in a repository proves nothing on its own and invites the next
reader to trust their eyes instead of a check.

## The defect only a real browser could find

Four assertions failed on the first run, all reporting a pure-black canvas — while
the phone-viewport assertion later in the same run passed.

The cause was in the harness, not the game. The probe sampled the canvas before a
game existed. The title screen is drawn in the document, over the canvas, and the
canvas is not drawn on at all until a run starts, so reading its pixels returned
zeros correctly. The later check passed for the accidental reason that the test had
started a run in the meantime to exercise the viewport.

The fix was ordering plus a new assertion: start a run before measuring, and assert
that the overlay rather than the canvas carries the title screen, so that if the
title is ever moved onto the canvas the harness notices instead of silently
measuring something different.

## Reusable rules

1. Probe a canvas only after the program has decided to draw on it. Menu, splash,
   and title states drawn in the document make a correct pixel read come back blank
   and look exactly like a rendering failure. Assert the state, then measure.
2. Before writing "this cannot be tested here", search for the capability. A false
   impossibility claim hid both the browser and, behind it, a real defect.
3. Prefer harnesses that exercise the delivered artifact over ones that exercise a
   local copy of its source. The delivered artifact can fail for reasons the source
   never shows: a wrong MIME type, a broken path, a script that loads in node and
   not in a page.
4. When pictures must be verified without eyes, census them — lit fraction,
   luminance level count, hue presence, change between frames — and keep the images
   as artifacts rather than as evidence.
