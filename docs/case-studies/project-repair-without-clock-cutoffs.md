# Productive work needs recovery, not a clock cutoff

A local project agent had saved substantial work when its orchestration layer
cancelled it at a fixed elapsed-work deadline. A second handler replaced the
specific cancellation reason with a generic stopped message. The resulting task
looked like another unexplained agent failure.

## Correct the cause and preserve the work

Receipt times, completed file writes and positive native stop evidence separated
a deadline cancellation from a permission failure. The owner explicitly rejected
replacing the cutoff with a larger arbitrary cutoff. The project workflow therefore
removed its total elapsed-work and human-wait cancellation. Explicit Stop, current
execution ownership, transport liveness and uncertain-outcome handling remained.
Other callers retained their own settings. The initiating stop reason is now recorded
before cancellation and survives the asynchronous result race.

The affected project continued through the existing recovery protocol. Completed
planning and the full artwork inventory survived; failed predecessor runs remained
in history. The local agent resumed the saved implementation and completed its
coding stage. That stage result was not treated as final gameplay acceptance.

## Let the agent repair observed project failures

Project correction now follows observation, repair and independent verification.
Known schema defects, missing outputs and fresh browser failures return to the local
agent without a fixed correction count. A rejected review triggers a separate
developer context, another browser check and then a fresh reviewer context. Failed
reviews and previous file fingerprints remain available; publication still requires
a verified passing result.

A typed terminal-failure result distinguishes a positively settled native error
from a lost connection or unknown acceptance. Only the former can continue after
correlated idle checks. Every correction has a distinct registered turn identity,
and Stop remains available during repair and resource waits. An early browser check
may distinguish exactly identified artwork that is still pending; the final check
retains complete artwork and provenance requirements.

## Evidence and limits

The original implementation failed the elapsed-cutoff and lost-cause regressions.
Focused tests cover indefinite work, Stop, uncertainty, missing outputs, corrections
beyond the former ceilings, distinct repair identities, resource deferral and fresh
review after changes. Existing native transport regressions also pass. Activation
was checked against the running artifact and preserved the current project stages.

The repair workflow does not claim that every possible failure is automatically
recoverable. Unknown artwork effects, infrastructure or authorization failures and
uncertain publication stay visible for reconciliation. Final game appearance and
full gameplay acceptance remain separate from orchestration verification.

A live qualification used the deployed repair loop, actual local agent tools and
a real browser on an isolated broken-page fixture. The agent corrected the error;
a fresh browser run verified a working button, no script/resource failures and
a phone-width fit. The task-authority seam was isolated from real project records.
This is evidence of agent-owned repair, not acceptance of the unfinished game.
