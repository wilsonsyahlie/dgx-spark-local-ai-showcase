# Case study: baking the art instead of drawing it, twice

**Date.** 2026-09-19

## The ask

A browser game where the visuals are genuinely produced rather than assembled
from circles and rectangles, under the standing constraints of every project in
this line of work: three plain files, one canvas, nothing downloaded, nothing
fetched at runtime, and reachable only from the private mesh network.

The interesting part is that the obvious answer — generate everything at
runtime — is the one that had already been done twice here, and it always ends
with the same complaint: procedural shapes read as shapes. So this attempt used
two routes at once. Route A bakes real PNG atlases with an off-line script and
commits them into the project. Route B keeps a procedural drawing path for every
one of those images, so that a missing file produces an ugly frame rather than a
blank one.

## The design that fell out of the premise

The setting is a lightless trench, which means every living thing down there is
its own light source. That single fact decided the art direction: the frame may
be almost entirely black and the sprites carry the whole picture. So the sprite
sheet became the product.

It is baked as two aligned passes — a body pass and a separate emissive pass —
because glow composited from a body image cannot express "light with no mass".
The two passes deliberately have different alpha distributions. A drifting mote
is almost all glow and almost no body; a vent is almost all body with thin hot
cracks. Those ratios, the luminance level count, and the tiling-seam metric are
printed by the baker, because nobody looked at the output to check them. Tiles
use value noise whose period matches the tile size, so they repeat without a
visible seam. Baking the full set from a fixed seed takes seconds, so a
regenerated set is diff-comparable.

The serving model was reused unchanged from three earlier pages: resolve the
mesh address at startup and refuse to start rather than fall back to a wildcard
bind, with a per-user service unit owning the port from the first start so that
nothing ever competes with it.

## What the verification harness found

Three headless harnesses: rule assertions, a long autoplay soak that checks
invariants, and a renderer harness that drives the real renderer against a
canvas stub which fails on any non-finite argument, negative radius, zero scale,
unbalanced save/restore, broken colour string, or frame with no drawing calls.

1. **The fallback route had never run.** Every scenario that deleted an atlas
   threw a scope error — the procedural snow function referenced local variables
   belonging to the render function that called it. No earlier test could reach
   it, because with real PNGs loaded the fallback was unreachable code. A
   fallback that has never executed is not a fallback.
2. **A colour helper that passed its data test and painted nothing.** The depth
   palette interpolated the third channel of one stop with a two-argument call,
   so the deepest stop formatted as a colour string containing `NaN`. The palette
   table itself was correct, so no assertion on the input data noticed. The
   first assertion on the output *string* caught it at once.
3. **A blank-frame check that measured the wrong object.** The fake canvas minted
   a fresh context on every call, so the draw counters being asserted were not
   the ones the renderer incremented. Every scenario reported blank while
   actually drawing.
4. **A force that outran the player.** Hull pressure scaled with the square of
   the depth past the hull rating, so a deep run died in about a second while
   climbing out took three. That is not difficulty, it is an unholdable corner,
   and it presented as several unrelated movement failures. Fix: cap the force
   against the player's own control authority, add a bounded ascent assist, and
   keep it under a regression test.
5. **An encounter the player could not reach and survive.** The maximum ballast
   upgrade stopped shallower than the boss's depth, which made the announced
   boss fight a guaranteed death. Reachability is a level-design constraint, not
   a tuning detail.
6. **Auto-aim that shot the player's own supplies.** Pickups satisfied the target
   search, so the automatic weapon emptied the air pockets the run depended on.
7. **Clamping to the wrong space.** The avatar was clamped to screen edges rather
   than world geometry, so it swam through solid rock.
8. **Two layer mistakes.** Destination-out carving applied to the main canvas
   erased the background, and the device-pixel-ratio backing-store scale was
   never applied, which would have drawn everything at half size on a retina
   screen. Plus an allocation inside the render loop — a noise buffer per frame
   during screen shake — latched to one voice per event.

## Honest limits

Sprite quality was audited numerically, not by eye. Framerate under real load on a
phone GPU, actual sound, genuine finger touch on a real device, font fallback, and a
reboot cycle were not exercised — and neither was whether any of it looks good.

A later pass found a browser already installed on the build machine and drove the
delivered page in it, which corrected this file's first claim that no browser
existed and found a defect no headless layer could reach:
[the-browser-that-was-already-installed.md](the-browser-that-was-already-installed.md).

## Reusable rules

1. Any route that pre-bakes assets needs a test that deletes the asset. Scope
   and availability bugs live in the branch nothing reaches.
2. Assert on the formatted output of anything that builds a colour, transform,
   or URL string. An interpolated `undefined` survives every input-table
   assertion and paints nothing.
3. A fake canvas must return the same object on every context request, or the
   harness measures a different object than the code under test draws into.
4. Clamp every force against the control authority it competes with, and test
   that each encounter the game announces is actually survivable.
