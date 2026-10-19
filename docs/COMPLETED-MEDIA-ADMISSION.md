# When a quiet queue concealed completed work

A home media workflow had a subtle integration failure: downloads finished, but a separate admission check saw no work. The earlier activation checks had covered empty queues rather than a genuine completed transfer.

The native manager deliberately hid completed items while its automatic import feature was disabled. That disabled feature protected an audio-and-caption requirement, so enabling it would have removed the protection instead of repairing the integration.

Recovery separated discovery from admission. A narrowly scoped metadata join identified completed storage-side items and their unambiguous native owners. The existing checks still qualified the complete item, rejected replacements and uncertain outcomes, recorded intent before submission and verified the resulting files. All content processing remained on storage; orchestration received only metadata.

The engineering lesson is to test the actual transition across an integration boundary. A successful timer and an empty queue can both be accurate while useful work remains stranded. Twenty-one focused discovery checks and twenty-nine existing admission controls passed; a genuine scheduled import then passed retained-source checks, destination qualification and library visibility before the recovery scope expanded. Broader catalog coverage and physical playback were not claimed. This retrospective includes no configuration or deployment instructions.

## Testing the next request

The next iteration generalized discovery to future requests while retaining the same admission boundary. A future completed item must have corresponding new native acquisition history and an unambiguous requested owner. Historical items are excluded unless previously approved. Both episode and film branches were qualified in isolated tests.

Review found that a persistent cursor could still be unfair: a time-limited run advanced over sources that never received processing time. A second variation advanced past several resolved sources before qualification. Moving the budget check before advancement and giving each resolved source its own qualification turn corrected both. Alternating application priority prevents one busy branch from starving the other. Removing required policy now produces an explicit failure rather than silently changing behavior.

Forty-two additional controls passed alongside fifty existing controls. Natural deployed scheduling, durable overlap suppression and honest next-run state were verified. The selected recovery reached one hundred forty-four verified destination episodes with library visibility. A genuine subsequent request remains in transfer and admission qualification, so future-request end-to-end import, a new film import and physical playback remain unproven. This is a verified engineering checkpoint with those limits, not a claim that every future source will be available or acceptable.
