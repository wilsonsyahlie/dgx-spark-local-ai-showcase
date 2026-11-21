# Isolating uncertain imports

A completed episode was missing from the viewing library because a separate older import had an uncertain outcome. The importer reserved the whole application until that uncertainty was resolved. That safety rule unnecessarily made unrelated work unavailable.

The repair narrows reservations to exact content targets. A competing source for the same target remains blocked, including a batch containing that target. Unrelated targets continue. Missing or malformed target information fails closed, and a final check repeats exclusion immediately before submission. Original receipts remain intact and uncertain work is never replayed automatically.

Eight focused regression checks covered unrelated work, same-target conflict, another episode in the same show, mixed batches, verified completion, unverified completion, malformed scope and the caller's final submission boundary. The live incident episode imported successfully with full-length packet evidence, native audio and English captions, and appeared in the library. A natural scheduled run loaded the new implementation and continued past the old failure. A human playback session was not performed.

The lesson is to match the scope of a reservation to the scope of the uncertainty. Serialization of concurrent writes remains useful; indefinite application-wide exclusion does not.
