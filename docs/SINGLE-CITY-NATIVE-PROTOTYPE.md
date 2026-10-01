# A single-city native prototype

A request for a close recreation of a large commercial open-world game exposed a familiar engineering distinction: reducing the map to one city does not reduce the rest of the production burden to a small task. A portable native prototype delivered original city geometry and a playable systems milestone, while the requested visual fidelity remained unfinished.

The prototype connected walking, driving, traffic, vehicle interactions, pursuit, missions and local progress. Controlled tests used the running native game, and actual rendered images were inspected. Independent review found that an occupied police vehicle could count as its own pursuer, blocked doors could defeat recovery, and failed saving could still close the game. These were corrected within the gameplay scope.

Verification itself required repairs. A launch wrapper could accept old closure evidence, and exact decoded floating-point equality rejected correctly serialized progress. Fresh-run evidence binding and byte-level persistence readback addressed those cases. Rendered images revealed map overflow and vehicle-height issues that logic tests missed.

The resulting evidence supported a functional prototype. It did not prove physical controls, heard sound, sustained performance or commercial-game quality. Simplified city art, animation and simulation remained explicit limitations. A retained engine shutdown diagnostic was also kept separate from positive operating-system process closure.

The lesson is to protect the quality claim as carefully as the executable. Testable system behavior, native rendering, lifecycle safety and visual acceptance are separate deliverables; none should stand in for the others.
