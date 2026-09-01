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
