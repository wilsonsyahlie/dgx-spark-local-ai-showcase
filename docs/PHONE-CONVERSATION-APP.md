# Phone conversations without accidental task replay

An owner wanted an iPhone application for text and voice conversations with
Hermes, installed through Safari Add to Home Screen. The engineering work
qualified a standalone mobile interface and actual local conversation behavior.
Installation and hearing on a physical iPhone remained an owner-device check.
This is a retrospective, not a deployment guide.

## A working shell did not establish a working conversation

The first authenticated browser connection failed at an origin boundary even
though the interface assets loaded. The correction kept the established broad
guard and confined the necessary adaptation to the application. Native policy
and the existing voice behavior were preserved. All inference stayed local.

Independent review then exposed a deeper issue: authentication did not grant
authority over arbitrary native sessions. Session ownership, exact pending
control identity and initialized model policy needed explicit proof. Reconnects
also had to preserve uncertainty about submitted work. A late acknowledgement
could make a previously observed idle state obsolete.

The resulting checks bound session authority to its creator, retired consumed
control identities and required fresh state after late acknowledgements. Missing
runtime state fell back to saved-history viewing rather than task continuation.
Uncertain requests were never automatically repeated.

## Small screens made unfinished input part of correctness

Browser qualification reproduced polling that erased a pending answer and its
focus. Preserving the same question editor fixed the interaction. Loading,
errors, Retry, stale replies, duplicate actions and refresh were exercised at
narrow widths. Voice capture required an explicit start gesture; leaving Voice
ended capture and playback. Text and voice histories remained visibly separate.

## What the evidence established

Forty-four backend checks and thirty-three browser checks covered the authority
and interface boundaries. Eight deployed user checks established actual text
answers, refresh without prompt replay, saved-history recovery and an embedded
synthetic voice turn. Six deployed boundary groups covered authentication,
served artifact identity and rejected transport/method misuse.

A narrow read-only receipt matched the recognized speech and native assistant
answer by their input/output hashes. The browser received and continuously
scheduled two PCM buffers, then ended microphone tracks and its audio context
when leaving Voice. Those are separate observations: native conversation,
synthesized sample delivery and resource release. They do not establish audible
quality on a physical device.

The tested deployment was independently reviewed, with unrelated running work
and configuration preserved. A failed assertion caused by combining a role
label with the answer was retained as a harness correction. An offline browser
toggle did not actually stop worker networking; a truly unreachable owned
fixture established the unavailable state instead.

Physical Safari installation and permissions, owner-password login, hearing,
forced session compaction, a second global restart, destructive tool approval,
rollback and long-duration behavior were not claimed. A mobile browser result
is useful evidence, but it is not every part of phone acceptance.

The lesson is to preserve native authority and unknown effects through every
reconnection, test the user's unfinished input, and name exactly what each audio
measurement proves.


## Follow-up: the launcher is part of the user path

The owner could not find the qualified app in its usual launch interface.
The live page and its source both lacked a phone entry. This exposed an
omission in delivery acceptance rather than a newly measured conversation
failure. A single card corrected discovery while preserving existing behavior.

Fourteen actual browser checks covered narrow and desktop layouts, resolved
navigation after page scripts, the protected sign-in destination, refresh and
repeated clicks. An explicitly observed delayed status failure did not hide or
change the new entry. Source comparison and live response evidence qualified
the small static change without a service restart.

A syntax error before activation and a prematurely started browser check were
retained as caller failures, not relabeled as successful tests. Qualification
then followed measured activation, and fault injection proved both request and
delivery. Physical installation, permissions, password entry and hearing were
still untested. A usable application must be discoverable from the place where
its owner expects to start it.
