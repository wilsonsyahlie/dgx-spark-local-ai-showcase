# Engineering journey

This chronology reconstructs the genuine milestone sequence from the private project
record. It is intentionally more candid than a feature list: rejected approaches,
rollbacks, and incomplete evidence remain visible.

## 1. Establish a local inference baseline

The first objective was a stable local language-model endpoint with enough context for
agent work. Measurements covered model residency, available memory, prompt/decode
throughput, concurrency, and real generation—not only process health. A stable logical
model identity was introduced so downstream tools did not depend on a physical model
name.

## 2. Replace fragile sandbox assumptions with explicit boundaries

An earlier sealed environment could quarantine itself after ordinary configuration
changes. The replacement used an isolated agent service with explicit mounts. This kept
the operating-system boundary while making writable and read-only locations visible and
auditable. A migration incident also exposed a cloud-provider default, leading to an
explicit zero-cloud inference check after installation and restart.

## 3. Introduce shared resource admission

Conversation, image/video generation, transcription, and background analysis initially
behaved like separate products. On unified memory they were one resource problem. A
cross-service admission mechanism and named operating modes were added. Later failures
showed that locks alone were insufficient: model phase boundaries needed explicit unload
and final cleanup.

## 4. Build an operator control plane

The project added a private dashboard for service state, workload modes, queues, model
experiments, and narrowly scoped actions. UI verification expanded beyond the happy path
to loading, retry, stale responses, repeat actions, restart recovery, and phone-sized
layouts. Broad shell access was rejected in favour of allowlisted operations and
one-use confirmations.

## 5. Add retrieval with evidence and scope separation

Local ingestion grew from basic document search into separate personal and work scopes,
read-only source cataloguing, OCR/vision extraction, embeddings, and evidence-grounded
answers. Retrieval and citation validation were made independent of model confidence.
Background reading was changed to yield structurally to foreground work.

## 6. Make background work durable and truthful

Research and media workflows gained persisted state, checkpoints, run receipts, artifact
validation, and delivery outcomes. The project stopped treating a successful launcher,
HTTP acceptance, or queue entry as completion. Natural schedule runs became part of
verification whenever scheduling behaviour changed.

## 7. Evaluate specialised and replacement models

Several routing and model-promotion experiments were measured against coding, tool use,
context, protocols, latency, memory, and live behaviour. Specialist routing exposed
context-loss and handback-boundary problems and was retired after its lessons were
captured. A later single-model candidate passed broad qualification but failed a corrected
multi-turn interaction, so the system rolled back rather than normalize weaker behaviour.

## 8. Formalise the reliability program

Repeated investigations revealed a common failure class: success claimed from indirect
evidence. The final engineering standard requires reproduction, backup, rollback, layered
tests, live user-path evidence, and a requirement-by-requirement completion record. Known
limits remain explicit instead of being hidden behind a green summary.

## 9. Optimise an optional local accelerator by completed work

A large selected knowledge backlog made an attached desktop GPU look underused. The
first hypothesis was insufficient worker concurrency. A controlled experiment added two
workers, but two matched windows averaged only 2.6% more completed files, so the prior
topology was restored.

Stage-level evidence showed that every file eventually converged on embedding work on
the primary workstation. The retained design moved only Personal-scope embedding batches
to the already-local accelerator while keeping orchestration, scope enforcement, semantic
index mutation, memory admission, and pause controls on the primary machine. Non-Personal
private scopes remained structurally local.

In a matched two-minute comparison, completed files increased from 22 to 64—about 191%.
A separate one-minute hardware sample averaged 74.4% accelerator utilization and peaked
at 99% while retaining memory headroom. Compatibility checks compared embedding
dimensions, cosine agreement, and retrieval rankings. Negative tests rejected malformed
vectors before index mutation, and remote failure yielded instead of falling back to a
second device. Browser tests also covered watched-folder filtering, Select all, stale
responses, retry, duplicate submits, independent result scrolling, and 390/320-pixel
layouts.

These measurements describe one large, media-heavy backlog. Accelerator utilization is
workload-shaped, and the separate hardware sample does not promise constant utilization
or the same throughput gain for different file mixes.

## 10. Isolate fail-closed inference debt from Knowledge

A later status alert showed that healthy accelerator endpoints did not guarantee the
pipeline could consume their results. Interactive model proxies had timed out while
detached backend computations stopped making progress. The proxies correctly preserved
ambiguous reservations, but repeated quarantine debt could exhaust the shared
admission pool and prevent Knowledge from entering its own phase.

Recovery first paused and drained the affected lanes. Backend running/waiting state,
client absence, and forward-progress counters were measured before an explicitly
approved local restart. Only then did the authority's own idle probe reconcile the
exact quarantined reservations. No persistent state was edited directly.

The retained prevention added a narrower primary-request capacity alongside shared GPU
capacity. The ceiling preserves the Knowledge background reserve and a safety margin, so
active or quarantined interactive requests cannot recreate this cross-profile starvation.
Unproven automatic restart and release were deliberately rejected: a full interactive
quarantine may deny new chats until reviewed, but this failure class cannot starve
Knowledge. The status component also moved to the authority's live policy and now distinguishes an
already-admitted background phase from capacity for an additional phase.

The follow-up addressed the timed-out request lifecycle directly. The proxy now assigns
an exact backend identity, watches downstream EOF even while blocked before response
headers or between stream chunks, and asks a private authenticated control to abort only
that request. It releases admission only after the backend confirms the request existed
and disappeared. Live streaming and pre-header disconnect tests returned both engine and
admission state to idle without restart. Failed or unprovable abort still quarantines,
with the capacity ceiling retained as a second containment layer.

## 11. Turn a delivered web briefing into an evidence-gated scout

A recurring local-agent workflow was added to search public sources for professional
opportunities matching a bounded profile. It used a staggered morning schedule,
local-only inference, continuity for repeat detection, a separate owner-selected
delivery destination, and explicit prohibitions on applications, outreach, private-data
disclosure, and fabricated requirements.

The owner authorised an immediate qualification run. It completed and delivered in
about three minutes, but opening the artifact exposed the real defect: useful leads were
mixed with stale or search-snippet-only listings and one clearly low-fit role from an
unrelated domain. A green scheduler and delivered receipt had proved transport, not
recommendation quality.

The first prompt correction added fit, recency, and live-page gates. Independent review
still rejected it because the separation remained advisory. The retained design forces
every candidate into exactly one mutually exclusive state: verified match, unverified
lead, or excluded. Only verified roles may be scored in the main list; unverified leads
are visibly separate and capped; low-fit, stale, closed, and domain-mismatched candidates
never appear. Repeated roles must be reopened and reverified on every run.

The final contract passed review, preserved unrelated active work, and retained the next
anchored run. The owner waived waiting for the first natural trigger. Therefore the
manual run proves only the agent and delivery path: it does not prove scheduled firing,
and it does not prove the corrected prompt's next report. Both remain explicit limits.
Rollback requires removing the isolated schedule and restoring the backed-up scheduler
state; neither the separate briefing nor the active Knowledge workload needs to change.

## 12. Separate meeting records from senior summaries without inventing substance

A local writing skill originally treated meeting work mainly as action extraction. It
did not clearly distinguish a governance record from the shorter summary a senior reader
may want, and its generic language encouraged polished but unsupported implications.

The retained design defines two modes. Detailed notes may carry supplied meeting context,
participants, discussion, decisions, and assigned actions. A senior email or chat summary
uses plain topic headings, only as many bullets as the source supports, and one consolidated
action list. Missing owners and dates stay visibly unresolved; relative dates require a
deterministic calendar check; sensitive or competitive claims remain attributed.

Synthetic live tests mattered more than a schema pass. They exposed invented strategy,
an inferred action owner, incorrect calendar arithmetic, and unrequested document
creation. The final boundary makes inline text the default and treats file creation and
external delivery as separate permissions. It also prefers one faithful bullet to three
padded ones and performs a sentence-level source audit before returning a draft.

The skill and routing index validated, the refreshed agent remained healthy, and the
final side-effect check left no generated document or external message. A residual limit
remains: prompt guidance cannot deterministically prevent every paraphrase error in a
generative model. Important client-facing drafts therefore retain human review before
delivery.

## 13. Replace a mutual Resume deadlock with a coordinated state machine

A later operator check found pending Knowledge work but both the primary queue and the
optional accelerator were blocked. Each controller required evidence that could be
produced only after the other's structural pause wall disappeared. The dashboard also
treated a successful control response as activation even when the returned state was
blocked.

The retained protocol starts with a stopped, request-bound accelerator preflight while
both walls remain. The queue controller consumes only that fresh receipt, verifies its
workers, commits the accelerator, then captures its progress baseline. Success requires
stable worker topology, terminal file progress, and observed relay work. Master Pause
recreates both walls before synchronous remote-stop verification.

Review and live activation exposed several races: stale or future receipts, invalid
controller phases, an old keeper removing a newly asserted wall, and the periodic keeper
overwriting a consumable preflight. Each failed closed. The final design holds the keeper
only after stopped preflight succeeds and restores it during coordinated activation. It
passed focused contracts, two live activations, an immediate pause-and-recovery cycle,
responsive browser checks, and a natural keeper run.

## 14. Make secondary model choice permanent without turning a URL into shell access

A creative-writing model proved useful enough to justify a stable secondary inference
lane, but the first selector was only structurally modular: adding another model still
required a manual download, manifest edit, and controller restart. Reusing the primary
agent's model workflow would have crossed the isolation boundary the second lane was
created to preserve.

The retained design introduced a dedicated unprivileged manager and a separate atomic
registry. Inspection resolves a public repository to an immutable proposal containing
the exact artifact list, sizes, available hashes, and configuration digest. An expiring
one-use confirmation precedes transfer. Downloads preserve a disk reserve, resume partial
artifacts, support cancellation without deletion, and publish only after verification.
Browser and repository data never become runtime arguments.

Independent review caught two pre-completion defects: confirmation originally re-read
repository head, and UI polling could repeatedly initiate confirmation. The proposal is
now frozen and must compare unchanged before transfer, while polling only renders durable
state and an explicit button performs confirmation. Regression tests proved changed-head
refusal before network transfer and expiry failure. No second model was downloaded during
qualification; therefore future models remain artifact-eligible, not runtime-proven,
until their first load and generation succeeds or rolls back.

The first GUI claim was also too strong. A minimal proxy canary passed, but the real chat
middleware attached automatic tool choice and the writing runtime had no reviewed parser;
the front door then hid the useful validation detail. The retained writing-only boundary
removes implicit tool and provider-extension fields while preserving chat, sampling, and
streaming. The formerly failing full middleware payload passed afterward. This reinforced
the broader rule: test the user-visible harness, not merely its backend-compatible subset.

## 15. Add one action view without creating a second source of truth

A chief-of-staff workspace can easily become an unsafe super-dashboard: if it copies and
edits records from every subsystem, ownership, freshness, and retry rules become ambiguous.
The retained design gave the workspace authority only over personal commitments and status
overlays on finalized meeting actions. Other systems remain authoritative and are opened
through explicit handoffs.

The local action vocabulary is intentionally small: create, complete, defer to an exact
date, and reopen. Every accepted mutation records an atomic durable receipt and revision.
That lets exact retries return the original outcome while rejecting a reused request ID or
a stale tab. Browser duplicate-click suppression is a usability layer, not the transaction
guarantee.

Meeting actions are read-only source material. Their identity includes the source record and
exact semantic fields, so an edited action cannot inherit an old completion marker. Each
upstream source also fails independently: one unavailable summary cannot hide local work or
disable unrelated handoffs.

Verification covered validation, concurrency, stale state, source changes, partial failures,
action transitions, refresh, restart persistence, desktop overflow, and phone layout. The
production source contained no finalized real meeting action during qualification, so that
path remained fixture-proven instead of being described as live-proven.

## Progression at a glance

| Stage | Question answered |
|---|---|
| Local baseline | Can the machine serve useful agent workloads locally and predictably? |
| Boundary redesign | What must the agent see, and what must remain structurally unreachable? |
| Admission control | How can incompatible workloads share one memory pool safely? |
| Control plane | How can an owner understand and operate the system without a terminal? |
| Private retrieval | How can answers remain scoped, evidence-based, and locally processed? |
| Durable automation | How do we know scheduled work actually completed and delivered? |
| Model experiments | Which improvements survive realistic behavioural evaluation? |
| Reliability standard | What evidence is required before calling a change complete? |
| Accelerator optimisation | Which stage increases completed work without weakening scope or safety boundaries? |
| Admission-debt isolation | How can quarantine remain fail closed without starving an unrelated workflow? |
| Exact request cancellation | How can a disconnected client stop only its backend work without turning uncertainty into release? |
| Evidence-gated discovery | How can a delivered web briefing distinguish verified matches from attractive but unproven leads? |
| Evidence-bound meeting writing | How can one local agent serve both governance and senior-summary needs without padding sparse evidence or creating unrequested artifacts? |
| Coordinated Resume | How can two structurally paused lanes establish readiness without bypassing either wall? |
| Isolated creative model management | How can an owner add local writing models without granting repository input authority over commands or the primary agent? |
| Self-service credential rotation | How can a person change a local app secret without weakening revocation, durability, or brute-force protection? |
| Isolated editor inference | How can a useful but rejected agent model serve coding clients without inheriting personal context or eviction authority? |
| Bounded action aggregation | How can one view support safe local action without taking ownership from every system it summarizes? |

## A rejected agent model can still have a narrower safe job

A large coding checkpoint passed isolated repair, tool, and long-context work but failed
the behavioural standard for promotion as the personal agent. Treating that as a binary
choice—primary agent or deletion—would have discarded useful local capability. The safer
reuse was a standalone, owner-started editor lane with independent authentication,
workload identity, lifecycle state, and an ephemeral model process.

The separation is structural. Editor requests receive no agent conversation history,
memory service, private retrieval mounts, or orchestration instructions. Start is confirmed
and fails closed on operating state, pause walls, current work, memory, immutable artifacts,
runtime identity, and accounting. It does not unload anything else. Stop waits for proven
request drain and acts only on the exact owned process.

Activation produced two useful failures. Reloading a shared accounting service while a
secondary model lease existed restarted its dependent controller, which deliberately
unloaded the now-ambiguous backend. The prior model was restored, and service reloads are
now treated as zero-active-lease operations. Separately, a resource-control button used
rendered state as its only duplicate guard; two same-tick clicks could outrun the render.
A synchronous ref lock closed that gap, and phone-width browser tests covered loading,
failure/retry, stale responses, duplicate actions, reload, and overflow.

That full-live gap was later exercised when the owner made room without automatic
eviction. The first load revealed that an exact predicate expected a command-line spelling
rather than the runtime's canonical security value, and that an internal-only network had
not created the presumed host mapping. Recovery stayed fail closed until exact identity,
an authenticated backend, and the matching live lease agreed. The corrected backend
remained unpublished behind private-network resolution.

A mandatory fresh start then exposed a fixed loading floor that contradicted the smaller
selectable model's observed stable headroom. The failed attempt cleaned up correctly; a
measured adjustment preserved the per-model admission gate and hard process ceiling. The
second start, generation through both clients, and supported stop with memory recovery
passed. A delayed accounting check then rejected the apparent restart adoption: the lease
still belonged to the old controller process. Corrected restart recovery unloads the exact
idle backend, releases its persisted lease, returns Stopped, and requires a fresh owner
start; that canary and final start passed. The larger model remains an explicit
model-specific gap. This is why “available in a selector” and “routine-ready” must remain
different evidence states.

The first control also landed in the agent dashboard while the person expected it beside
the machine's other memory controls. Moving it into that established workspace—and
removing the duplicate dashboard surface—was a usability correction with a security
benefit: one obvious authority surface. Desktop, phone, stale-response, failure/retry,
and same-tick duplicate tests passed without starting the large model.

## A settings button is also a security lifecycle

Adding “Change PIN” to a private application looked like a small usability request. The
real system crossed several boundaries at once: prove knowledge of the current secret,
validate the replacement twice, survive interrupted writes, serialize competing changes,
revoke every older browser session, and keep the successful browser usable with fresh
request-verification state.

The first implementation passed the change and restart flow, yet independent review
found a subtle contradiction: failed-attempt throttling lived only in memory. Restarting
the service reset the defense protecting a low-entropy PIN. The counter moved into the
transactional private state store, and a regression now performs repeated failures,
restarts the service, and confirms the lockout remains in force.

The final evidence combined unit and integration tests, simultaneous-change pressure,
simulated storage failure, encrypted live rotation and restoration, stale-session
rejection, and a phone-width browser check. The lesson is that self-service settings are
not presentation work alone; credential changes are complete only when persistence,
revocation, concurrency, recovery, and abuse controls agree.

## A search toggle is not a search

The secondary writing model once displayed web search as enabled while receiving no
usable search tool. Earlier compatibility work had removed tool declarations after the
backend rejected them, so the interface state and the model's confident prose were both
misleading.

The repair stayed checkpoint-specific: a matching native tool parser was qualified, the
front door preserved supported tool fields, and the first continuation test caught an
internal protocol marker leaking into user-visible text. Adding the corresponding
reasoning parser fixed that measured defect. Repeated call, abstention, streaming,
parallel-call, and continuation checks passed before the authenticated chat path was
allowed to count. The local metasearch service then returned an authoritative result and
the model cited it, while the primary agent process stayed untouched.

The lasting rule is simple: a colored icon and a model saying “I can search” prove
nothing. Native web access is established only when the model emits a parsed call, the
search service receives it, the result returns cleanly, and the final answer is grounded.

## A tailored CV should be an evidence-selection system

A private career tool was built to turn a supplied job description into a focused CV
without turning fluent generation into permission to invent. The intake accepts pasted
text or a saved page and deliberately avoids account credentials, authenticated scraping,
applications, and outreach.

The design treats the job description as untrusted data. Local generation maps each
requirement to stable approved evidence identifiers; deterministic checks reject unknown
facts, facts assigned to the wrong role, and newly introduced numbers. A second local
review checks whether free-written profile language is actually entailed. If two drafts
fail, the workflow falls back to exact approved wording and validates that result too.

The product makes uncertainty visible: strong and partial matches are separate from
gaps, and its percentage is evidence coverage rather than a hiring prediction. Every
successful run creates a two-page PDF, editable source, and an evidence report, then
leaves submission to the person. Security and recovery are part of the product: private
authentication, request verification, throttling, restart-safe history, duplicate and
stale-response guards, safe upload limits, and phone layouts were exercised through the
real encrypted interface.

## Meeting notes become safer when uncertainty has its own stage

The earlier meeting-writing workflow proved that sparse evidence should stay sparse, but
an agent-only process still made clarification feel incidental. A private application
made uncertainty a first-class stage: ingest a transcript or recording, extract evidence,
pause on a short set of questions, then generate detailed notes and a compact leadership
summary only after the person has answered or explicitly skipped each gap.

Live synthetic checks caught subtle fidelity failures that polished prose can hide. A
supplied title was replaced, a task deadline became the meeting date, references
disappeared, and a human answer was omitted. Deterministic safeguards now preserve those
four boundaries and visibly carry unresolved items forward. The product also treats
operational uncertainty honestly: input limits reject rather than truncate, failed local
transcription remains retryable, history survives restarts, and loading, error,
cancellation, duplicate-action, stale-response, and phone layouts are real states rather
than happy-path mockups.

A later iteration addressed voice separation without pretending it could prove identity.
Recording segments receive local provisional voice groups, and the interface shows sample
utterances plus confidence before asking a person to name every group or explicitly keep
generic labels. A partial map cannot reach finalization. Confirmed names are then applied
deterministically throughout the evidence and output rather than left to generative
consistency. A real two-voice path and responsive failure/retry, duplicate, stale-response,
restart, and refresh checks passed. Overlap, noise, similar voices, short turns, and
standard rather than forensic deletion remain stated limits.

Discoverability was treated as a product concern rather than a new platform project. The
existing private launchpad gained a small Useful Apps workspace with one meeting-notes
card, while its established Apps area and backend remained untouched. Reusing the
launchpad's generic deep-link and remembered-selection behavior kept the change narrow.
Focused structure and responsive tests, live old/new routes, and desktop/phone renders
proved the integration. A host-gated restart was not bypassed because the static interface
was already demonstrably live.

A coordinated follow-up waited for that work to finish before placing the evidence-bound
CV tool beside it. That browser check exposed a useful distinction: the first card stored
the correct destination and the destination itself was healthy, yet the runtime anchor
still pointed back to the dashboard because it did not match the launchpad's initializer
contract. Completing that contract for both cards, then asserting the resolved anchors in
a real browser, fixed the interaction. A URL in markup plus a healthy service is not proof
of a working launch path; the click target itself must be observed.

## Compatibility should follow the runtime, not a developer's short list

A compatibility inspector rejected a newer coding checkpoint solely because its architecture
class was absent from a small handwritten list, even though the serving runtime already
recognized that class. The list had turned a temporary review snapshot into permanent policy.

The initial repair retained meaningful checks for public access, immutable revision, safe artifacts,
the absence of downloaded executable code, quantization, size, and context.
Architecture compatibility now comes from the complete capability registry generated from the
exact pinned serving image. Unknown classes fail before a large download; recognized but
previously unseen classes proceed without being forced onto an optimization qualified only for
older families.

Tests covered malformed and unknown classes, newer supported classes, context limits, and explicit
coding metadata. The rejected family then reached confirmation-ready state through the live
owner-facing path. Download and generation remain a separate human-confirmed qualification.

A follow-up exposed another category error: the inspector and offline discovery still demanded
that a repository identify itself as a coding model. Names, tags, descriptions, and task labels
do not determine whether the pinned runtime can safely serve the artifacts. Both classification
checks were removed, category-specific interface copy was neutralized, and regressions proved a
neutral-name model could pass while concrete incompatibilities still failed. A compatible
general-purpose checkpoint then reached confirmation-ready state through the deployed path;
download, load, and quality remained deliberately unclaimed.

## Context metadata must match the backend allocation

An editor request slightly beyond the standalone lane's advertised window failed even though
the selected checkpoint's native context was much larger. The limitation was not in the client
or model: two registration paths had independently embedded the same conservative served cap.

The repair introduced one native-bounded context policy shared by network registration and
offline discovery, then atomically migrated the current registered entry. It deliberately did
not increase memory utilization, concurrency, or weaken loading floors. The exact prior model
and revision restarted within the existing budget, and an authenticated stable-alias request
above the former boundary completed successfully with no process/container OOM kill, restart,
quarantine, or residual work. Known transient driver allocation warnings recurred during
startup as on the prior baseline, but not during the long request. A test near the new maximum
and tests of other physical checkpoints remain explicit gaps.

## Observability must survive an unloaded model

The first serving dashboard watched only the always-resident inference process. On-demand
creative and coding lanes were invisible because their physical backends either did not exist
while stopped or were deliberately unpublished. Scraping those backends directly would have
traded a monitoring gap for a security and lifecycle regression.

The correction put a small metrics bridge at each controller boundary. A bridge remains
reachable while unloaded, reports model readiness separately from telemetry availability, and
emits backend serving metrics only after a bounded complete response passes structural and
collision checks. Stopped lanes therefore render as zero rather than disappearing, while a
ready model with failed telemetry is visibly degraded instead of falsely healthy. The original
resident series identity stayed unchanged so its history remained continuous.

The dashboard was tested against natural scrapes, a real post-scrape generation delta, exact
stop-and-restore lifecycle evidence, and desktop plus narrow browser layouts. The inactive lane
was not loaded merely to manufacture a graph. The broader lesson is that an on-demand service
needs an always-present observability contract, but that contract must not expose the private
workload it observes.

## A real document exposed an implicit format contract

An evidence-bound CV tool produced the correct number of pages, but the first real user
review rejected it: content had been poured into a generic PDF design, and the file needed
manual renaming. Existing checks had treated page count and evidence traceability as the
entire output contract.

The repair made the approved editable template the source of truth. Generated text is
escaped before bounded local compilation. The renderer rejects page-geometry, font, and
layout-diagnostic failures; links and editable-source pairing are verified before release.
A single safe company/role stem now follows the PDF and source automatically. The rejected real
run was staged, opened page by page, and switched recoverably only after hostile-input,
artifact, and authenticated-download tests passed. The first narrow browser pass caught
a blank interface caused by a completed build and stale watching web process disagreeing
about asset names; restarting only that web surface restored the assets, and the repeated
authenticated view passed tap-target and overflow checks. A stronger subprocess sandbox proved
incompatible with retained service hardening, so the service was not weakened and that
limit remains explicit.

## A model context window is not an image-processor budget

A local coding model accepted long text but failed when a chat supplied two large screenshots.
The model identity and overall context allocation were correct; the failure came from a separate
visual preprocessing path that expanded the images beyond its internal token boundary.

The correction reads processor metadata from the exact selected snapshot at launch and applies a
measured pixel range only to that processor family. It also sets a small item-count boundary so an
oversized request receives a clear client error instead of an opaque token mismatch. Registry
entries cannot override those controller-owned limits, and text-only or differently packaged
models are unaffected.

Verification checked content, not merely status codes: one, two, and three colored images were
identified in order; a fourth was rejected clearly; text and forced tool calls still worked; and
the original two-image shape passed again after a full supported stop/start. The stability tradeoff
is explicit: very small screenshot text may need a crop because bounded resizing reduces detail.
The broader lesson is that multimodal admission needs its own measured budget, distinct from the
language model's advertised context window.

## A factual CV can still be poorly tailored

A later real review exposed a different defect in the same private document workflow. Nearly
every approved employment fact had been selected, all self-directed AI projects were present,
and a fixed heading recast personal work as an industry program. Individual bullets were true;
the document-level story and provenance were not.

The repair preserved the frozen design while adding a bounded evidence-selection contract.
Employment history remains complete but selective. Personal projects carry explicit nature
metadata, use a truthful heading, and pass an alias-aware relevance gate across every place
evidence can appear. Requirement-match strength joins entailment review and the displayed score
is derived from those evidence states. Generic keyword overlap cannot qualify a project, and
fallback follows the same rules.

Focused tests covered selection limits, duplicates, acronyms, synonyms, false positives,
hidden leakage and exact two-page compilation. A requested artifact was drafted directly by
the agent when the owner chose not to wait for local inference, then validated and visually
opened. Future live-model adherence remains unclaimed. Accuracy, relevance and provenance are
distinct obligations.
## A local agent factory needed less authority, not more orchestration

Adding coding jobs to an operator portal looked like a queue-and-cards feature. The real design
problem was preventing the portal, coordinator, and agent from inheriting one another's authority.
The final workflow split admission, coordination, execution, model access, status attestation, and
bounded results. It offers only a short pre-admission withdrawal window and creates a new linked job
for reruns; it never pretends an upstream active job can be cancelled.

Each agent turn is tied to the exact physical local model captured at submission rather than a
friendly alias. If that model stops or changes, execution fails instead of silently switching.
The agent receives one isolated no-remote repository, a fixed command path, an empty account state,
and no public network or production credentials.

The first post-change review found important gaps behind that shape: network policy replacement was
not yet deny-first, allowed peers were broader than necessary, runner execution resources and retained output were not
bounded, disconnect cleanup could miss detached descendants, and uncertain submission needed a
durable reconciliation state. Closing those findings made the factory smaller and more predictable:
exact peer-only paths, bounded execution, one-shot scoped access, no automatic replay, and explicit
unknown or ambiguous delivery.

Process-death and storage stress added another lesson: cleanup code cannot revoke a credential after
its own process is gone, signals do not remove zombies, and a per-file cap does not bound a filesystem.
The retained system therefore ties access to a live kernel-observed lease, explicitly reaps adopted
children, caps every agent-writable storage class, and places time and cgroup ceilings around the
threaded security proxy. A fresh canary on those final boundaries produced the exact file and restored
the prior unloaded model state.

The strongest lesson arrived during verification. An early run exited successfully and explained
what it intended to create, but the file was absent because its internal sandbox commands had all
failed. Direct artifact inspection rejected the false positive. After correcting several exact
upstream grammar, permission, and namespace assumptions, a fresh run produced the requested file,
drained its model request, and returned the system to its prior unloaded state. For autonomous work,
terminal status is evidence about a process; the artifact and its tests are evidence about the task.
Desktop and phone-width browser checks also proved stopped-state controls, bounded result display,
stale-response suppression, and overflow behavior.

The operator still needed visibility during long runs, but a raw transcript would have crossed the
same authority boundary the factory was designed to protect. The follow-up added a sanitized operational
view over a bounded, nonblocking side channel. Only allowlisted status, tool, command, output, and file
activity is eligible; raw prompt, reasoning, environment, and arbitrary upstream fields are not emitted,
while allowed output may still echo task text. Credentials and internal markers are scrubbed, with an explicit
warning that transformed sensitive text cannot always be recognized. Missing records, disconnects, and reconstruction limits are explicit rather
than silently presented as complete. In a recovery exercise, restarting only the monitor disconnected
the live view while the agent continued and completed successfully. Observability became useful without
becoming a dependency of execution.

Visibility also revealed a separate reliability limit: one verbose job reached handoff with more result
data than the receiving side accepted. Because that defect was outside the observability request, it was
recorded as unresolved instead of being folded into the change. Better monitoring should narrow uncertainty;
it should not quietly broaden implementation authority.

Once that repair was separately approved, the safest answer was not a global increase. Routine control
and progress messages kept their smaller ceiling; only the authenticated final-result direction received
the already-defined larger allowance. Results beyond it become a small explicit failure without echoing
discarded content. Boundary tests and a harmless live result above the old receiver limit passed while
the loaded coding model remained untouched. Message limits are contracts by direction and purpose, not
one convenient constant for an entire protocol.

The last security review found another useful distinction: data that a page ignores is still data sent
to the browser. Mutation receipts carried internal correlation metadata even though no component rendered
it. With explicit approval, list and mutation responses moved behind one recursive public projection, and
both handler tests and a broker-only create/replay/withdraw exercise proved the narrower contract without
starting an agent job. Presentation safety begins at serialization, not at the DOM.

The next natural failure came from incomplete JSON in one local-model tool call. Restarting the full
agent would have risked repeating earlier work, so the response boundary now withholds one bounded
inference and permits one narrowly classified regeneration only after fresh run, client, exact-model,
stateless-mode, and local-tool checks. Other failures are forwarded truthfully. Independent review drove
terminal event ordering, nested-tool validation, disconnected-client suppression, honest telemetry, and
separate memory/concurrency ceilings.

Package behavior remains deliberately offline. A measured read-only inventory advertises what the
agent can import, while pip is no-index, noninteractive, and zero-retry with no package artifact source.
A harmless live shell check proved available imports and immediate missing-package failure. No package
was installed and the previously failed project was not rerun.

The owner later chose a different tradeoff and explicitly accepted public-Internet exfiltration risk.
Enabling it exposed why “online” is not one switch: the harness still sought unavailable approval, a
clean exit produced no artifact, firewall counters destabilized naive verification, an inbound rule
depended on a stopped service group, and broad path masking initially hid required channels too.

The final boundary uses the existing externally sandboxed runner as authority. Public-address egress is
allowed only after local and private destinations are rejected; new inbound flows to runner-owned
listeners are denied; and private runtime/state views reveal only the workspace and required local
channels. A natural job fetched public metadata and produced its exact artifact, while independent tests
proved private-route denial, hidden host state, inbound rejection, unchanged peer behavior, and continued
local-model identity. Package and prompt settings remain policy, not containment. The durable lesson is
that accepted egress risk still requires a deliberate readable-data and bidirectional-network review.

The next reliability failure looked successful only because the agent harness exited zero. In reality,
the local model had invented a function name outside the request's tool vocabulary, and no requested app
was created. The repair validates exact flat and namespaced function pairs over a fully buffered response
before any call can reach the harness. One safe undelivered response may be regenerated; repeated or mixed
invalid calls become a generic failure with neither response released. If an online response has already
performed a hosted search, it is never regenerated. A second guard recognizes the harness's exact router
failure after complete output drainage and overrides a misleading zero exit. The important lesson was that
model output, tool authority, and process status are separate trust boundaries.
