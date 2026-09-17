# Retrospective: why a verified world build still regressed after a restart

Date: 2026-09-17. A retrospective engineering story from the local-first Spark program:
an isolated staging game server used to rehearse a large, scripted, staged world build.
Nothing here is deployable and no current configuration is described.

## The situation
A staged build ran to completion on a throwaway staging instance, reported all parts
applied, and its own verification pass reported every structural anchor intact. It looked
finished. It was not durable.

## What only a restart revealed
After the process restarted, one anchor - a decorative farmland block in a garden area -
had silently turned into ordinary dirt. Every other anchor stayed green, which made the
fault small, isolated, and easy to rationalise as noise.

The measured cause was a simulation rule, not a failed command. The build placed farmland
in an explicitly moist state and then spaced water channels every eighth block. Farmland
only survives while a hydration source is inside a bounded radius, so the middle of every
row never really hydrated, and the verification anchor happened to sit five to six blocks
from the nearest water - outside the rule. Dry farmland decays to dirt the moment its
chunk unloads.

The original "pass" was an artifact of ordering. The block had just been set by command
while the region was loaded, so the decay rule had never been given a chance to disagree.

## The smallest durable correction
Two missing water channels per row, so spacing is four and every farmland cell ends up
inside the hydration radius. No water in crop rows, no world rebuild, and only the single
affected build part was replayed.

While editing that build file a second, unrelated defect surfaced: a multi-line in-place
stream edit had left a stray bare command word on the first line, which made the entire function fail
to parse. That class of error is invisible until a reload, and it is easy to mistake for
the original bug.

## What verification actually had to include
Geometry recomputed against real coordinates before applying; a reload with a zero parser
error count; replay of the one affected part; the full anchor set plus a secondary check
suite; an explicit region unload and reload cycle; and finally a full stop, an offline
snapshot taken while the process was down, and a cold boot with re-verification. The
production instance was re-proved untouched by container fingerprint before and after
every step, and the staging instance was the only thing any command could reach.

## Lessons kept
1. If a placed thing only stays valid because of a simulated neighbourhood rule, verify
   the rule arithmetic against real coordinates at authoring time, then re-check it after a
   region reload. The placement command succeeding proves nothing about persistence.
2. Put verification anchors on the worst-case cell, not the convenient one. A pass that
   samples the easiest location is a blind spot with a green checkmark.
3. Treat "it passed before the restart" as unverified for any stateful change.
4. Never insert multi-line text into a script file with a line-addressed stream edit; use
   a scripted in-place insert and re-assert the first line plus a reload error count.
5. Isolation must be machine-proved at both ends of a risky session, not asserted from
   which server was intended.
