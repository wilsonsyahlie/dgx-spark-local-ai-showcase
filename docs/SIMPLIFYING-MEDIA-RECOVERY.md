# A smaller recovery loop

A media request could remain missing without ever entering a download queue. Existing applications retried recognized failures, but an item that never started needed a separate nudge. An experimental replacement engine grew beyond that narrow problem and was abandoned before deployment.

The smaller design reused the existing supervisor and application search capabilities. It checked approval and identity, skipped active work, respected protected acquisitions, and limited retries with a cooldown. Episode numbering stayed with its owning application. Caption search and synchronization stayed with their existing service.

The critical boundary was the outgoing action. A saved intent preceded the request, uncertain acknowledgements prevented automatic repetition, and a successful search did not count as a completed download. A final check caught requests revoked or files arriving during the earlier scan. Backups remained on the storage system. Unknown action incidents stayed open instead of falsely recovering on a quiet sweep.

Twenty-eight focused checks passed, including deadline expiry, backup failure, duplicate prevention and recovery reporting. A natural scheduled run completed a real application search, initiated no download and correctly stayed quiet. A read-only follow-up verified its cooldown; no completed download was claimed. Caption timing and automatic replacement of truncated copies were explicitly unproven. The lesson was to repair the missing transition using the existing owner before introducing a second recovery system.

This retrospective contains no deployment recipe or production configuration.
