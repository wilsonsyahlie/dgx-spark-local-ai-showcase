# Patient native-channel speech and ownership

A voice integration can recognize speech correctly yet still feel impatient.
The original transport waited for silence before processing a whole
recording. Replacing that boundary with incremental recognition required a
separate decision about when a person had actually finished a thought.

The revised design accumulated recognition fragments and waited through a
meaningful pause before submitting an agent task. Partial speech delayed the
decision, bounded input expired visibly, and background speech during work was
discarded. Existing agent authorization stayed authoritative; a spoken yes was
not converted into a tool approval.

Review exposed several ownership mistakes that ordinary successful requests
would miss. Two components disagreed on identifier format. A repeated join could
report success for an unusable session. Cancelling a playback operation could
affect its caller. A disconnected response could appear finished before its
producer released the protected resource. The corrections bound each operation
to its own session or worker and required cleanup evidence before reuse.

The audio path then delivered bounded chunks while synthesis was still running.
Speaking over the final answer stopped its audio worker while preserving the
agent task. The person needed to resume or repeat afterward; this was not a
claim of seamless conversational interruption or reversal of completed work.

Focused fixtures exercised a deliberate hesitation, new partial speech, stale
events, early playback, bounded queues, disconnect and both cancellation
directions. A runtime probe checked native audio framing with the installed
libraries. Further service, gateway and independent protocol checks passed
before scoped activation. A real local speech fixture combined a deliberate
pause, exact approval, tool execution and audio that began before synthesis
finished. The agent was reached through a separate authenticated interface, and
a native audio sink consumed the reply. That result does not establish actual
channel dispatch or a physical call. Physical acoustics, phone use, subjective
delay, echo and sustained use remained outside the evidence.

The transferable lesson is to measure when audio starts, when a thought is
complete, who owns the task and when the resource is actually free. A fluent
reply or successful transport response establishes only part of that chain.
