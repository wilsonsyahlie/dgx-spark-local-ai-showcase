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


## When the first real call was silent

The first physical attempt connected successfully but produced no response to
spoken input. Typed requests still worked. The earlier local audio fixture had
qualified speech processing and playback boundaries without exercising the
actual connection setup, so its passing result did not contradict this failure.

The receive investigation found a timing gap: authoritative speaker information
could arrive during connection setup, before the audio consumer subscribed to
those events. Later audio would then have no trusted speaker identity. Relaxing
that identity check would conceal the defect and weaken the privacy boundary.
The repair captures trusted identity before connection setup begins
and retains it only for that connection; old or unknown identity remains invalid.

Focused regressions and an installed-runtime receive probe passed. The latter
used an actual control-event handler, transport decryption and audio decoding,
while unknown identities and old connection data stayed blocked. Independent
review preceded scoped activation. A physical retry remains pending: external
packets and channel end-to-end encryption were outside the probe. The observed
timing defect explains why connection success is insufficient, but no claim
that every cause of silence is resolved follows from these fixtures.
The transferable lesson is to install control-event capture before starting an
asynchronous handshake and test the gap before the main consumer exists.
