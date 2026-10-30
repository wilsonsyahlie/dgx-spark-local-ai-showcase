# A smaller recovery loop

A media request could remain missing without ever entering a download queue. Existing applications retried recognized failures, but an item that never started needed a separate nudge. An experimental replacement engine grew beyond that narrow problem and was abandoned before deployment.

The smaller design reused the existing supervisor and application search capabilities. It checked approval and identity, skipped active work, respected protected acquisitions, and limited retries with a cooldown. Episode numbering stayed with its owning application. Caption search and synchronization stayed with their existing service.

The critical boundary was the outgoing action. A saved intent preceded the request, uncertain acknowledgements prevented automatic repetition, and a successful search did not count as a completed download. A final check caught requests revoked or files arriving during the earlier scan. Backups remained on the storage system. Unknown action incidents stayed open instead of falsely recovering on a quiet sweep.

Twenty-eight focused checks passed, including deadline expiry, backup failure, duplicate prevention and recovery reporting. A natural scheduled run completed a real application search, initiated no download and correctly stayed quiet. A read-only follow-up verified its cooldown; no completed download was claimed. Caption timing and automatic replacement of truncated copies were explicitly unproven. The lesson was to repair the missing transition using the existing owner before introducing a second recovery system.

This retrospective contains no deployment recipe or production configuration.


## Regression found by a real request; added retry retired

A later request exposed an incorrect assumption in the added retry handler: the existing dispatcher intentionally monitored individual episode IDs while leaving parent season flags off. The new handler required both flags and skipped valid requested episodes. Existing operating notes already documented that distinction, but the initial tests did not include the real request shape. A focused regression failed before the predicate correction and passed afterward. Thirty focused and integration checks then passed.

The owner reported that the extra retry behavior was worse. Rather than add another coordination layer, the added backlog-search branch was retired completely. The existing health, import recovery and notification functions stayed active. Independent source review, a side-effect-free disabled-handler check, running-artifact verification and a natural scheduled disabled result passed. This supersedes the earlier active-retry checkpoint; its code and action journals remain historical evidence, not an activation backlog.

The affected whole-show request was repaired through the existing applications. Only its remaining episode-monitoring flags changed, with complete resource comparison preserving file identities and other settings. Requested seasons were searched serially. Where existing queued selections blocked viable complete-season releases, narrowly selected profile-allowed alternatives were grabbed through the normal application API without changing global quality policy or deleting old payloads. Advertised seeds and search acknowledgements were kept separate from actual storage-side byte flow. Download completion remained in progress.

The prevention rule is to test the real application's ownership and monitoring semantics, not infer them from a familiar flag name. An existing approval dispatcher should not gain a competing historical-backlog search loop merely because a scheduled search can pass. Retire a rejected regression and preserve evidence; do not relabel its unit-test success as fulfillment.


### A request handoff stopped before monitoring
A newly approved series reached its library manager but every episode remained unmonitored. A permanent review state in the request handoff prevented further progress. The historical failing assertion could not be established; a generic error label was insufficient to diagnose it.

A narrowly scoped recovery used the approved whole-season authority, preserved the original history and admission policy, backed up state, enabled only the requested episode flags, and verified complete resource readback. A normal application search targeted released episodes while future episodes remained monitored. Actual transfer bytes were observed on the storage server. Transfer start is not completed import, and this recovery does not prove a generic permanent fix. The owner-rejected competing retry loop remained retired.

### Repairing a request handoff without adding another worker
A request adapter converted every failed assertion into a permanent review state. An otherwise approved request could therefore leave every episode unmonitored indefinitely. A separate shortcut also treated aggregate library availability as completion of a newly requested season.

The repair stays inside the existing dispatch owner. Only a known generic hold with confirmed ownership and no uncertain current or predecessor action can revalidate. All original request, provider, admission and episode checks still run. A genuine mismatch remains blocked, while a later valid observation can continue. Uncertain effects retain their reservations and are never replayed. A newly approved season reaches the normal outbox even when an older season is already available.

Before-and-after regressions cover recovery, identity changes, uncertain acknowledgements, restart, future episodes and duplicate searches. The replacement image changes only the two intended sources. Deployment retained the old container and full state backups. Normal job timing did not provide the measured maintenance window, so only the existing timer was temporarily rescheduled through its supported control. A later verification timeout required a separately reviewed stopped-state continuation; the consumed stop was never repeated. This was a rollout failure to correct, not evidence that the application itself had failed.

Live scheduling, preservation and request behavior require separate evidence from isolated tests and image builds. Neither this change nor a successful search guarantees that a release exists or that every subtitle is correctly timed.

A real scheduled run after deployment resumed a previously held request. Protected state and the exact original schedules passed readback checks; the resumed health job completed with delivery explicitly suppressed. New-approval dispatch has isolated regression coverage; no synthetic request or external test notification was created. The original historical assertion trigger remains unknown.
