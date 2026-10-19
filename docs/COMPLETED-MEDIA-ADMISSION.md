# When a quiet queue concealed completed work

A home media workflow had a subtle integration failure: downloads finished, but a separate admission check saw no work. The earlier activation checks had covered empty queues rather than a genuine completed transfer.

The native manager deliberately hid completed items while its automatic import feature was disabled. That disabled feature protected an audio-and-caption requirement, so enabling it would have removed the protection instead of repairing the integration.

Recovery separated discovery from admission. A narrowly scoped metadata join identified completed storage-side items and their unambiguous native owners. The existing checks still qualified the complete item, rejected replacements and uncertain outcomes, recorded intent before submission and verified the resulting files. All content processing remained on storage; orchestration received only metadata.

The engineering lesson is to test the actual transition across an integration boundary. A successful timer and an empty queue can both be accurate while useful work remains stranded. Twenty-one focused discovery checks and twenty-nine existing admission controls passed; a genuine scheduled import then passed retained-source checks, destination qualification and library visibility before the recovery scope expanded. Broader catalog coverage and physical playback were not claimed. This retrospective includes no configuration or deployment instructions.
