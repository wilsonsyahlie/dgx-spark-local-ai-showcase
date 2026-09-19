# Teaching a text-only coding model to art-direct a game locally

A text-only coding model can build a game loop, but it cannot judge the images it asks
another model to create. A useful local workflow therefore needs a recoverable transaction,
not only an image API.

In this project, the coding model described an asset in a bounded brief. A local director
produced two candidates, asked a separate local vision model for structured feedback,
applied one revision, and kept the stronger result with a provenance record. Two was a
deliberate limit: it bounded accelerator use and prevented endless aesthetic iteration.

The harder work was in the handoffs. Reviews were bound to exact image and project
identities. Critique was treated as untrusted data and could not alter commands,
destinations, models, or the candidate limit. Project, path, cache, and link checks stopped
replay from publishing into an unrelated location.

Shared-accelerator cleanup needed stronger evidence than an empty queue. The serving layer
therefore admitted every generation and model-release request through one machine mutex
and recorded a monotonic operation sequence. A worker could release global model residency
only while that sequence still proved ownership. A clean baseline also required the
service to report no loaded models; free memory alone was insufficient. A competing
request caused cleanup to refuse rather than unloading another user's model.

Several measured failures sharpened the contract. One successful release returned an empty
body. A visual critique contained a Unicode symbol that a legacy console could save but
not emit. Later review found weak cache binding and a possible ownership race. The final
workflow accepted valid empty controls, used ASCII-safe JSON, revalidated cached records,
and required sequence-bound release. It also bound completed replay to the exact project,
controller, paths, asset, and manifest, and recovered an interrupted candidate only from
its matching deterministic receipt. The earlier Unicode failure used replacement
candidates under a new asset identity; it was not presented as exact replay.

For final acceptance, the real text-only coding model received an empty game project and
only the desired outcome. It discovered the capability, wrote a vertical arcade game,
recovered its own long-running asset launch, integrated the vision-selected local artwork,
and wrote 18 passing tests. Real browser verification at a laptop viewport measured about
56-58 frames per second with no console errors. Keyboard play passed seven interaction
checks, and a background-only capture matched the selected raster at R2 0.885.

The reusable lesson is that autonomy comes from constrained interfaces and evidence.
Generation, perception, coding, and browser verification can remain separate while durable
state and explicit ownership make them one understandable local workflow.
