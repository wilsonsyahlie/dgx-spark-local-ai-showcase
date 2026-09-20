# Pixel-level visual QA for a locally generated browser game

**Date:** 2026-09-20

## Problem

A browser game whose art is generated on the local workstation reported two visual
defects after delivery: a flat bright band across the whole play frame, and flare
lighting that produced no warm colour at all. Every existing suite reported green while
both were present, because none of them looked at pixels.

## Measured root causes

1. **Coordinate-space mismatch.** The render path sized its work with the canvas backing
   store dimensions after applying a scale transform, which expects logical dimensions. At
   one viewport the background gradient covered about two thirds of the canvas area, and
   because the canvas is never cleared between frames, the additive bloom pass accumulated
   in the unpainted strip until it reached opaque white. At a larger viewport the same code
   *over*-covered, which is why every earlier wide-viewport probe reported a clean frame.
2. **Image colour mode.** The lamp mask was baked as a greyscale PNG. A browser decodes an
   opaque PNG with alpha 1 everywhere, so the darkness pass that subtracts the pool of
   light removed a hard square instead of a circle.
3. **Additive colour maths.** Flares are drawn additively over a blue water gradient. Their
   gradient stops kept a high blue channel, so the sum stayed white whatever the nominal
   amber hue. Warmth on an additive layer is decided by the stop's own channel balance, not
   by its colour name.
4. **The visual test measured the wrong thing.** It decided a run had started by matching a
   timer pattern in the page text, but the idle title screen already displays `0:00`, so it
   exited on the menu with no game object and every later keypress hit nothing; the flare
   looked dead because nothing was running. It also asserted darkening with the lit-pixel
   ratio, which a live flare transient lifts, and counted frames from a dead run as deep
   samples.

## Retained design

- A census test drives the delivered page over the real protocol with real input events and
  reads back pixels: no uniform bright full-width row in any frame, a minimum number of
  luminance levels, the cold palette dominant in shallow water, and warm pixels appearing
  when a flare fires and during descent.
  **Superseded 2026-09-20:** darkness is no longer asserted from frame pixels at all, not
  by a lit-pixel ratio and not by a luminance median. The percentile sits on the black
  floor, where shallow and deep frames differ by half a luminance level, so it ordered
  frames by sampling noise. The renderer's own darkness rule is now asserted
  deterministically in the stub harness, and the census documents that limit.
- Liveness is the overlay's computed visibility, and a run is started the way a human starts
  it, by clicking the button. A visual test must prove the state it claims to measure before
  it attributes anything to it.
- A character outline that has to separate from a glow field must be *dark*. A ring probe
  around the player returned mean luminance 100-140 in every direction because the player
  sits inside its own light, so a light fringe is invisible in it. The outline is dark navy
  and comes from the sprite's own alpha mask offset in eight directions, because a geometric
  circle landed inside the art's frame.
- A local vision model is the visual feedback channel. Taste-level preferences were not
  treated as defects; the loop was closed when consecutive rounds began contradicting each
  other about the same element.

## Lessons

- A canvas under a scale transform must measure the frame in the same coordinate space as
  its drawing calls, and a never-cleared canvas needs an assertion that every pixel was
  painted this frame.
- Any mask used to subtract must be authored and asserted as RGBA, never greyscale.
- Never infer a defect's absence from one viewport size; geometry bugs are viewport
  specific and can hide by over-correcting at another size.
- Two of the patches made during the pass were themselves defects, an outline drawn as a
  circle inside the sprite frame and an empty CSS border declaration, which is why every
  edit was followed by the render suite rather than by reasoning.
