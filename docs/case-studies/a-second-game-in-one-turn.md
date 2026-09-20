# A second game in one turn, and the two assertions that were lying

## Outcome

A second tailnet-only browser game was built from an approved concept inside a
single autonomous turn: a fixed side-view survival game on a moving train — three
rail cars, a power-allocation decision, three enemy archetypes, periodic supply
stops, and a pursuing boss at minute ten. Keyboard, mouse and phone are all first
class. Eleven raster assets came from the local GPU pipeline, each with a
provenance manifest and a procedural fallback that keeps the game playable when an
asset is absent.

## What the first game's rules were worth

The earlier project had already established that a canvas transform scale must come
from the backing store rather than the CSS box. Because that rule was written down,
it cost nothing here: the sizing helper stores `canvas.width / logicalWidth` once,
and the render harness asserts the equality at four viewport sizes before a browser
is ever opened. An entire bug class simply did not arrive.

## What was genuinely new

**A device-pixel-ratio change fires no resize event.** The first high-DPI run
reported a backing store of 1272x715 while the page reported a ratio of 2 — the
canvas had been sized for ratio 1 and nothing had resized since. The page only
refit on `resize`, so it kept a stale scale and a stale transform. The fix
remembers the ratio the backing store was built for and refits whenever the live
ratio drifts from it. The pass recorded at a larger viewport in the same suite had
been luck: that case happened to run immediately after a genuine resize.

**A high-DPI test that never reads the ratio is not a high-DPI test.** The
assertion compared the backing store against the ratio the test had *requested*.
That cannot distinguish an emulated ratio-2 page from a ratio-1 page, which is
exactly the difference the test existed to catch. The harness now reads the page's
real `window.devicePixelRatio`, fails the case when it differs from what was asked
for, and derives the expected backing store from it.

**Touch affordances belong to the viewport, not to a pointer query.** The stick and
action button were armed by a load-time coarse-pointer test and by a first touch.
An emulated phone answers that query with "fine", so the game correctly laid itself
out for a narrow screen and then offered no controls until the player had already
needed one. They now appear for a coarse pointer *or* a narrow width, re-evaluated
on every resize.

**The asset pipeline has an unstated prompt budget.** Its vision stage composes the
brief prompt plus a critique into a revision prompt capped at 700 characters. Two
briefs written at 600+ characters failed inside generation with a length error —
and the only symptom that reached the test suite was a 404 for a missing PNG. Brief
prompts now stay near 430 characters, and a corrected brief needs a fresh asset id,
because the pipeline binds an asset's identity to the hash of its brief.

**Served art is not the art the pipeline writes.** Generated files land in the
project root; the browser can only read the document root. A sync step carries the
PNGs and their manifests across, and it belongs to the asset workflow rather than to
a human memory.

## Evidence

198 assertions across four harnesses: pure simulation, a recording canvas stub, a
thirteen-minute soak with no leak, no NaN, a bounded population and no wedged
phase, and real Chrome driven over the same URL a player uses — keyboard, mouse,
touch, overlay-visibility liveness, backing-store coverage at four viewport and
ratio combinations, restart recovery, and every request confined to the tailnet.

## Prevention

- Refit a DPR-dependent canvas when the *ratio* changes, not only when the *size*
  changes.
- Any high-DPI case must read the page's real device pixel ratio.
- Arm touch controls from the viewport.
- Keep generated-art brief prompts near 430 characters; a corrected brief gets a new
  asset id.
- Sync generated art into the document root as part of the asset step.

## The process defect

The turn was once returned to the prompt as a progress statement while two
assertions still failed and the documentation half of the checklist was untouched.
Nothing durable held the objective across tool calls, so a long background job —
the vision review — became a legal stopping point. The acceptance checklist now
lives in the project's own workstate file, and the standing rule is blunt: a
progress statement is not a completion. A turn ends when every criterion is
evidenced, or when a genuine external blocker is written down.
