# When a quiet queue concealed completed work

A home media workflow had a subtle integration failure: downloads finished, but a separate admission check saw no work. The earlier activation checks had covered empty queues rather than a genuine completed transfer.

The native manager deliberately hid completed items while its automatic import feature was disabled. That disabled feature protected an audio-and-caption requirement, so enabling it would have removed the protection instead of repairing the integration.

Recovery separated discovery from admission. A narrowly scoped metadata join identified completed storage-side items and their unambiguous native owners. The existing checks still qualified the complete item, rejected replacements and uncertain outcomes, recorded intent before submission and verified the resulting files. All content processing remained on storage; orchestration received only metadata.

The engineering lesson is to test the actual transition across an integration boundary. A successful timer and an empty queue can both be accurate while useful work remains stranded. Twenty-one focused discovery checks and twenty-nine existing admission controls passed; a genuine scheduled import then passed retained-source checks, destination qualification and library visibility before the recovery scope expanded. Broader catalog coverage and physical playback were not claimed. This retrospective includes no configuration or deployment instructions.

## Testing the next request (historical checkpoint)

The next iteration generalized discovery to future requests while retaining the same admission boundary. A future completed item must have corresponding new native acquisition history and an unambiguous requested owner. Historical items are excluded unless previously approved. Both episode and film branches were qualified in isolated tests.

Review found that a persistent cursor could still be unfair: a time-limited run advanced over sources that never received processing time. A second variation advanced past several resolved sources before qualification. Moving the budget check before advancement and giving each resolved source its own qualification turn corrected both. Alternating application priority prevents one busy branch from starving the other. Removing required policy now produces an explicit failure rather than silently changing behavior.

Forty-two additional controls passed alongside fifty existing controls. Natural deployed scheduling, durable overlap suppression and honest next-run state were verified. The selected recovery reached one hundred forty-four verified destination episodes with library visibility. A genuine subsequent request remains in transfer and admission qualification, so future-request end-to-end import, a new film import and physical playback remain unproven. This is a verified engineering checkpoint with those limits, not a claim that every future source will be available or acceptable.

The following follow-up supersedes the earlier pending-transfer state; the generic future-native-history live-test limitation remains.


## Completion depends on identity, not labels

A further completed-item check showed that finished files can remain in a directory labelled incomplete. The correction kept the same ownership, stable-completion, inventory and audio/caption checks while allowing the correctly bound category location. Ninety-five production controls passed across the original admission, recovery and future-discovery paths.

The subsequent request also exposed a scope error: two catalogs grouped the same episodes into different seasons. Matching season labels had left most requested episodes unmonitored. The repair compared individual episode identity, absolute order and original air dates, explicitly corrected the earlier interpretation, and selected only requested episodes. An item-specific ordering preference preserved the existing library files and other settings.

The complete requested batch subsequently passed repeated storage-side qualification, bounded copy generations, retained-source checks and actual destination/library episode coverage. Existing imported episodes were preserved rather than replayed. Additional controls exercised complete generation progression, changed file identity, uncertain submissions and late rejection.

The native bulk scan had also returned unparsed placeholders for a large unrecognized folder. Individual-file lookups established the real episode mappings; an empty rejection list was never treated as qualification. That operator resolution does not add an automatic fallback for every unrecognized large folder.

The source required explicit operator fulfillment because its original listing could not produce native acquisition history. This does not establish a generic future-history import pass. A new film import, physical playback and caption timing remain untested; source availability is not guaranteed. Content processing stayed on storage, and no automatic import bypass or fabricated history was introduced. The engineering lesson is to join actual identities across boundaries, preserve uncertain outcomes and separate verified files from catalog synchronization claims. This retrospective contains no deployment instructions.
