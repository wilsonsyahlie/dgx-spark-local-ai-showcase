# Case study: when a spoken request needs real execution

**Engineering milestone:** September 2026. **Evidence status:** focused protocol
review, native artifact readback and bounded browser qualification passed.

A voice assistant could hear a request and produce a fluent reply, but its
first release had connected speech to a text model without an agent tool loop.
It could discuss work without carrying it out. The owner also found that brief
pauses ended an utterance too quickly. The follow-up addressed both parts of
the request: give speech time to finish, then submit one task to the established
local agent and expose its real progress.

Adding tools made the approval and cancellation boundaries more consequential.
Protocol review found that one candidate approval transport resolved the oldest
pending request. If that request expired, a late click could approve a different
command. The chosen path addressed the exact pending request, permitted a single
approval or denial, and refused commands too long to review in full.

Stopping required stronger evidence too. An asynchronous idle notification could
have been generated before the user pressed Stop. The repaired design required
a new, correlated observation after the stop acknowledgment. A separate race
allowed a delayed progress callback to submit work after cancellation; serializing
admission with cancellation closed that gap. Unknown submission or approval
outcomes were retained without automatic replay, and storage failures could not
prevent cleanup.

Eighteen focused bridge tests and an independent source review passed. A native
agent fixture then used real tools to create a small artifact whose content was
read back independently. The exercise exposed a separate warning inconsistency:
an earlier failed tool attempt still influenced the final warning after another
tool had succeeded. That limitation was recorded. A fluent answer and a tool
status label were both weaker evidence than inspecting the artifact itself.

The authenticated browser then processed fixture audio with a deliberate
hesitation as one task, waited for an exact on-screen approval, executed a
harmless tool operation and played the expected reply. Ending the conversation
released capture and playback resources. The longer approval wait also exposed
an audio receive ceiling that expired before the conversation budget; correcting
that mismatch passed a fresh fixture. A separate live interruption returned the
owned task to idle before the page resumed listening.

Review also caught one pending approval hiding another and nonfatal errors
appearing only inside a hidden panel. Queued decisions and visible errors passed
focused browser checks, including stale buttons and narrow layouts. The final
served page passed authenticated entry, asset, reload and phone-width checks.
The full speech fixture preceded these final interface corrections; focused
regressions and live cancellation qualified the final page.

These results do not establish physical microphone performance, echo handling,
subjective speech quality, sustained use or reboot recovery. Cancellation does
not undo completed actions. The retrospective publishes the reasoning and
evidence boundary without deployment instructions or operational identifiers.


## When auxiliary work delayed speech

A browser complaint first exposed audio arriving too slowly. Usage accounting
identified automatic conversation naming continuing after the main answer. The
bridge now confirms an explicit title before accepting a prompt. A marked
response-style hint asks for concise summaries while preserving requested detail;
native history includes it after substantive input, while browser transcripts
and receipt identity retain the raw text. Bare greetings keep their prior path.

Removing competing work exposed a bounded-queue failure when synthesis became
fast. Pacing output ahead of playback preserved the queue limit. Interruption
then exposed a lost completion marker missed by a component-only check; the
actual worker waited indefinitely. Forwarding completion during cancellation
released the worker while queued audio stopped. Instrumented playback and
interruption checks passed.

The user's physical retry still stuttered. That result reopened the investigation
rather than being dismissed because scheduling traces looked clean. Separate
memory-provider accounting revealed additional automatic reasoning during
playback. The main agent's usage record had established title suppression, not
an otherwise idle inference system.

A scoped session option now suppresses only new automatic memory reasoning at
startup, initial recall and post-turn speculation. Normal sessions retain their
defaults. Base and ready recall, synchronization, explicit memory tools and
approvals keep their existing behavior. Effective policy is checked after
initialization, and unsupported execution routing rejects the option.

The browser also adds a small initial playback cushion and prevents listening
from appearing while audio remains scheduled. Focused native and browser checks
passed; the active revision also passed two nontrivial browser turns without
meaningful scheduling gaps or errors. Effective memory policy was confirmed,
and separate provider logs showed no automatic reasoning performance records
in the test window. Speech returned ready and idle. The owner then confirmed
smooth playback for both replies in a renewed physical retry. This accepts a
two-reply sample without claiming sustained performance. The lesson is to account for every inference
producer and test both directions of a streaming imbalance, while giving the
user's actual listening result priority over synthetic scheduling evidence.


## When the page left before the task finished

A voice page is temporary, but a task may still be working when its owner leaves.
The original lifecycle coupled these two facts: page cleanup could also close the
agent connection. The correction separated task ownership from the replaceable
browser attachment. Ending voice stops capture and playback while admitted work
continues under its existing deadlines and permissions.

Returning restores the same task, its result and any exact pending decision.
It does not submit the original prompt again. Authenticated ownership and fresh
attachment identifiers reject foreign handles and late controls from an older
page. Audio from a detached turn stays silent; snapshots restore task information
without replaying sound. Explicit interruption still requests confirmed task
cancellation, and approvals still require the user's original decision flow.

Review found a subtler race: a task could finish during reconnect setup, deliver
its result, and then include it again in the snapshot. Holding live delivery until
acknowledgement and snapshot were queued removed that duplication. A regression
exercised the actual task bridge and worker while setup was deliberately paused.

Focused lifecycle and browser checks passed. A deployed browser canary then
left a real task while it ran, recovered its progress, left again and restored
the completed result. Multiple attachments kept one task submission and replayed
no old audio. The harmless command did not require approval; pending decisions
remain separately covered by protocol fixtures. Physical user navigation
acceptance remains untested. Retention is bounded and does not survive service
restart. Missing handles fail visibly without repeating an uncertain action.
The lesson is to give work and its view separate lifetimes, then test the boundary
when either finishes first.


## When a good preview was not enough

A requested voice was first demonstrated in a local reference-based preview.
The owner accepted its sound. That evidence did not establish whether the voice
would respond promptly in conversation: the preview produced a complete clip
before returning it. The next experiment therefore measured when real audio first
arrived and whether generation could stay ahead of playback.

A dependency mismatch stopped the first streaming candidate before speech.
A compatible pinned candidate passed the same experiment. Independent review also
found three less visible defects: closing a blocked transport could wait forever,
a full output queue bypassed a deadline, and text escaping could overflow the
message bound. Focused regressions covered those cases before promotion.

The eventual qualification separated four questions: was the voice acceptable,
did audio arrive promptly, did playback remain continuous, and could interruption
release the actual producer before the next reply? Fifteen focused checks and
real local audio tests passed. The surrounding task permissions and continuation
behavior were preserved. Deployed results follow below; the accepted preview is
not presented as physical acceptance of every device or call.

This retrospective illustrates a general lesson: a convincing media sample is
only one part of a conversational feature. Timing, backpressure, cancellation and
truthful failure states need their own evidence. No deployment instructions or
current infrastructure details are included here.


Deployed qualification then passed two consecutive replies with no measurable
scheduled gaps or browser errors. Explicit interruption stopped playback and
returned to listening. A real local task survived two page departures, restored
progress and its final result, and submitted the work only once. A narrow layout
also passed. The shared native speech interface produced consecutive incremental
replies; no external call or message was used as a test. These results qualify
local software behavior, while physical listening to the deployed voice and
long-running endurance remain separate limits.
