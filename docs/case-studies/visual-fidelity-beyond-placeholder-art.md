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


## Follow-up: animation assembly and audible playback

User feedback exposed two limits in the earlier native-asset acceptance: the
character limbs separated during animation, and the player appeared to move
backwards. Each body part had been animated with its own pivot, while resting
and animated geometry used inconsistent coordinate conversion. The repair
merges the complete body before native transforms, converts coordinates once,
and uses a genuine player appearance rather than a similarly named character.
A location-specific character definition also replaced a misleading name match.
Native palette lighting, frame durations, texture and transparency are retained.

A separate silent-audio report reproduced a saved enabled preference with no
live audio context after reload. Playback now starts through a trusted gesture,
exposes enable, mute and retry controls, and fences stale asynchronous work.
The user also rejected the substitute melody. A locally served original
recording replaced it; decoded playback loops without creating duplicate
sources. Muting cuts the output immediately even if browser suspension stalls.

Validation covered nineteen coherent bodies and all five hundred eleven
exported frames, actual ground-click movement in four directions, nonzero
audio samples, immediate silence, failed loading and decoding, duplicate
activation, late completion, retry, save import, refresh and narrow layouts.
Eight existing game logic checks and thirty-two audio checks passed. A controlled
restart retained tested progress and recovered playback after another gesture.
Inspected browser images show connected bodies, and delivered artifacts were
checked against their reviewed sources.

The earlier native-asset record is superseded for character animation and
music acceptance. These checks do not establish physical speaker output,
owner-device smoothness or complete original-game fidelity. Restricted assets
and recordings remain outside this retrospective. The prevention rule is to
test assembled animated geometry and actual decoded output: source provenance,
a settings checkbox and a successful page load prove different things.
