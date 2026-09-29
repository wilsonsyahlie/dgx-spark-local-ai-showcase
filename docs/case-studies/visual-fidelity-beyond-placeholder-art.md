# Visual fidelity requires the right source material

A requested recreation of a classic game location initially used procedural
low-poly scenery. It ran, but the user rejected its visual similarity. A working
renderer did not establish fidelity to the requested place.

The replacement used locally extracted native terrain, geometry, textures and
character animation data. Matching inventory sprites and font shapes completed
the main asset changes. Restricted game assets were kept out of these engineering
records. The work did not alter the separate ongoing game-generation project.

Two implementation defects mattered. One decoder rejected valid model data and
left its promise pending, making a parser defect resemble a slow model load. An
independent parser recovered the complete models and animation frames. Native
stair collision also exposed walkable but disconnected landing tiles; choosing
a connected interior landing restored access to the upstairs bank.

Native assets required native interaction coordinates, wall-aware movement,
opening doors, height-aware placement and floor visibility. The milling workflow
was updated to use a hopper, controls and a downstairs flour bin. Overlapping
click targets now expose their alternatives in the context menu. Lossless
compression reduced the scene transfer by approximately eighty-eight percent.

## Evidence and its boundaries

Unit checks passed for experience thresholds, atomic inventory exchanges,
one-time quest rewards, save validation, native wall/door flags, staircase
connectivity and resource reachability. Browser checks walked continuously from
the starting point to the quest giver. Separate resource interaction checks used
position and inventory fixtures to test grain, milling, milk, egg collection and
quest completion. A subsequent fresh-game test completed the entire quest through mouse controls, including purchases and opening farm gates, without changing save data, positions or inventory through fixtures.

Browser checks also covered refresh recovery, another tab deleting a save,
loading failure and retry, and a phone-sized layout. Local graphics performance
was measured in a headless browser; performance on the owner's device and
physical touch use were not established. Combat and the wider skill/economy
systems remain simplified and do not have full gameplay acceptance evidence.

The result is a substantially closer visual prototype with verified starter-quest
interactions, not a complete or pixel-identical replacement for the original game.
The general lesson is to separate asset fidelity, source correctness, live
interaction evidence and final user acceptance. Preserve a rejected approach in
the engineering history rather than relabeling it a success.
