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
