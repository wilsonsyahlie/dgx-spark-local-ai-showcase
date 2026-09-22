# When an accepted request never starts

An approved media request remained at its requested state. The downstream library
manager had received and monitored the intended item, but matching original-language
listings were rejected by a single-language audio policy. The user's preference
was original audio with subtitles in a different language. Request handoff had worked; the language
decision did not represent the requested viewing contract.

The reviewed correction separated those two requirements: an item-scoped original-audio
allowance and a verified subtitle-language target. Live search showed that the language
rejections disappeared; other series assignments and shared policies stayed unchanged.
Existing source-health checks remained in force, so only a subset of matching listings
was eligible. A catalog entry can identify a plausible release without proving that a
peer can deliver it.

Online state backups passed integrity checks before the change. Rollback was scoped to
the affected item and retained prior policy, with later transfer state treated separately
from configuration. No service restart or broad policy relaxation was part of the repair.

The acceptance ladder separates request acceptance, candidate eligibility, content
transfer, media import, and verification of the requested audio and subtitles. Each
stage needs its own observation. An API acknowledgement or
an assigned subtitle preference cannot stand in for the remaining stages.

Initial transfer attempts remained stalled or were still obtaining metadata without
transferring content bytes. An alternative listing
advertised the requested audio and embedded subtitles. It was admitted stopped, its
file selection was checked while no content bytes had moved, and only one intended
episode was enabled; promotional and unrelated entries stayed excluded. The attempt
reused existing source-discovery mechanisms without changing global settings.

The alternative subsequently connected to a source and its received content bytes
increased across observations. The transfer was slow and intermittent. Independent
review then approved enabling the complete requested set of episodes using the
source-specific published audio and subtitle claims, without treating the partial
transfer as track verification. The expanded file selection retained the promotional
exclusions. Earlier unsuccessful attempts were paused with their state preserved.
A later observation found the alternative stalled again with no active source;
historical byte growth proved an actual attempt, not a continuously healthy transfer.

This milestone repaired policy eligibility and established real transfer progress,
but did not establish completed delivery, import, actual audio or subtitle tracks,
or playback. The incomplete header did not provide usable track evidence. Published
source metadata remained a claim to test against delivered media.
