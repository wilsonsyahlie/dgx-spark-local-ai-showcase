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
