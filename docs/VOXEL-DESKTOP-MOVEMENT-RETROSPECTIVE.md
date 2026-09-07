# Making desktop voxel movement feel coherent

The first desktop playability pass addressed a subtle but important problem: controls can
be mathematically camera-relative and still feel wrong when slow frames silently discard
movement time. The repaired loop keeps a bounded amount of elapsed time and advances player
physics in smaller collision-safe steps. Keyboard movement now follows view direction while
jumping and wall collision remain stable.

The browser journey was made more truthful too. Instead of expecting one click to destroy a
block, it holds the mining input, observes the drop entering inventory, selects that acquired
block, and places it with the secondary action. This tests the actual survival loop rather
than a shortcut that the game does not offer.

Evidence included 69 passing player assertions, a clean production build, live desktop
movement/collision/jump/mining/placement checks, zero browser and console errors, and an
independent review with no blocking desktop finding. Phone interaction was intentionally
excluded from this milestone.

The broader lesson was equally useful: a capable local model still made plausible-looking
test mistakes and once consumed its full bounded turn allowance. Reliable local coding came
from combining the model with automatic backups, strict runtime ceilings, fixed test gates,
diff inspection, and independent evidence—not from trusting a confident final summary.
