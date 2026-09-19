# Durable local asset staging

A coding model and an image model do not need to compete for one memory pool. This
project kept the coding lane in place and sent a bounded request to a separate local
GPU workstation. The worker owned a fixed image workflow, while the caller supplied
only prompt, size, seed and request identity. Generated files entered a review area and
never replaced game assets automatically.

The hard part was request ownership. The worker records intent before submission and
the engine's job identity afterward. If the response disappears between those points,
the result is uncertain and cannot be blindly repeated. Exact replay can reconcile;
the same identity with different data fails. Asset generation and visual review share
one cooperative accelerator lock, with queue, memory, activity and process checks at
admission.

The first review blocked release. A request identity could affect a path too early,
concurrent calls could race, ownership inspection failed open, and a crash could reveal
an image without its manifest. Input sizes and engine replies were also unbounded, and
resolved-path checks could miss a linked directory. The correction moved validation
before storage, added host and request locks, bounded both JSON directions, kept
submitted and uncertain states truthful, checked actual model files, rejected links
before resolution, and atomically published one complete image-and-manifest directory.

A fresh image then passed decoding and digest checks on both machines. Replay,
conflicting identity, oversized input, path escape and lock contention were exercised,
as were poll loss and a linked output directory. After the owned job and an idle-queue
check, model residency was released and headroom was measured. This evidence establishes draft text-to-image staging;
it does not establish transparent cutouts, animation, tileability, style consistency or
a machine-wide scheduler.

The final rereview found an interrupted-copy trap: a truncated hidden image could be
mistaken for reusable progress forever. The corrected path preserves bad bytes for
evidence, gives every retry a fresh unique download, and promotes only verified content.
An injected interrupted copy recovered on the next attempt.

## Quality is a fixed contract, not an arbitrary knob panel

The first fast proof looked generic despite passing every reliability check. The worker
therefore added one reviewed presentation profile while retaining the fast draft profile.
Profile choice is bound into request identity and provenance. Historical requests map
only to their original draft behavior, and reusing an identity across profiles fails.

The fresh presentation candidate showed stronger detail, lighting, framing, depth and
scale, while its stylized vehicle remained unsuitable as a literal gameplay sprite. That
distinction matters: extra sampling effort can support better art, but the actual image
still needs human assessment. It remained staged and unintegrated.
