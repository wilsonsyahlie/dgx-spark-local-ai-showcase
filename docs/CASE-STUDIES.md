# Troubleshooting case studies

These cases are retrospective and intentionally omit production identifiers, endpoints,
paths, and current private state. Each follows the same structure: symptom, competing
hypotheses, measurement, decision, verification, and reusable lesson.

## Evidence-bound generation for a high-consequence document

**Problem.** A job-specific CV needs persuasive emphasis, but a general language model
can silently broaden scope, add years, or turn preferred qualifications into implied
experience.

**Decision.** Separate selection from truth. Keep an approved fact catalogue with stable
identifiers, treat the job page as untrusted input, and require every generated claim to
cite evidence. Validate identity, role ownership, and numbers deterministically, then use
a second local entailment check. If generative drafts repeatedly fail, use exact approved
language rather than weakening the gate. Target employer and role labels are separately
grounded in the supplied job or replaced with neutral wording.

**Verification.** Focused tests covered prompt-control text, malformed or mismatched
evidence, unsupported numbers, unsafe filenames and file types, session tampering,
restart recovery, and exact two-page output. The real encrypted workflow processed an
injection-bearing description, surfaced unsupported qualifications as gaps, preserved
the employment chronology, and produced the PDF, editable source, and evidence report.
Responsive intake and result views were inspected separately.

**Lesson.** For consequential writing, the model should choose and explain evidence—not
become the source of truth. A safe fallback is less eloquent but more valuable than an
unverifiable success.

## 1. A healthy local model was not receiving conversations

**Symptom.** The local inference service was loaded and responsive, yet interactive
messages produced no local request activity.

**Initial hypotheses.** The likely causes appeared to be a stale gateway, network
namespace mismatch, or an incompatible model API.

**Measurement.** Gateway configuration inspection showed that an installer default had
selected a cloud provider. Local health checks were therefore irrelevant: the working
local service was simply not on the conversation path.

**Decision.** Restore an explicitly local base URL, remove cloud fallback, and make the
effective route part of reinstall and restart verification.

**Verification.** A real interactive turn reached the local endpoint, used the expected
logical model identity, and produced a user-visible reply. A configuration check was added
so a future reinstall cannot silently repeat the mistake.

**Lesson.** Verify the path actually used by the product, not the component you expected
it to use.

## 2. Two individually safe models failed when their lifetimes overlapped

**Symptom.** A scheduled media workflow intermittently failed during transitions between
vision analysis, text selection, and hardware rendering. Each model fit in memory when
tested alone.

**Competing hypotheses.** The first suspicion was a driver fault or an undersized memory
floor. Process and kernel evidence instead showed that the outgoing model remained
resident while the next model began loading.

**Root cause.** Keep-alive behaviour crossed phase boundaries. The pipeline was sequential
at the application level but concurrent at the memory-residency level.

**Decision.** Add explicit unload boundaries before every incompatible phase and keep the
shared workload lock until final cleanup completes.

**Verification.** A bounded vision-to-text-to-render run showed only the intended model at
each phase, ended with transient inference empty, preserved the resident assistant, and
produced no new allocation warning.

**Lesson.** On shared-memory systems, phase order is insufficient; model lifetime is part
of the workflow contract.

## 3. A scheduled job said success while its children had failed

**Symptom.** The scheduler reported success because it had queued work, but the resulting
artifacts were missing.

**Competing hypotheses.** The launcher exit code suggested success. Resource metrics did
not show an out-of-memory event. Child receipts revealed that processing failed later at a
shared-lock access boundary.

**Root cause.** The scheduler tracked acceptance, not outcome, and the unprivileged worker
could not reach the lock through a private parent directory.

**Decision.** Expose the same lock inode at a non-secret runtime path, fail the guard with
an actionable error, and persist separate launcher, child, artifact, and delivery states.

**Verification.** Focused lock-access tests passed; the worker failed closed when the lock
was unavailable; later natural execution produced terminal child receipts and artifacts.

**Lesson.** `Queued` is a transport fact. Completion requires terminal work, an inspected
artifact, and a truthful delivery outcome.

## 4. A technically strong candidate model failed the actual agent contract

**Symptom.** A larger candidate passed throughput, long-context, coding, tool-selection,
and one-shot live checks. After promotion it mishandled a corrected multi-turn request and
ignored a safety-sensitive instruction.

**Decision point.** Keeping the candidate would have optimized benchmark results while
weakening the owner-facing contract. The correct action was rollback, not another prompt
patch.

**Action.** Restore the prior qualified model behind the unchanged logical identity,
remove candidate-only configuration through supported controls, and retain the failed
promotion as evidence.

**Verification.** Protected API checks, a local deployed-agent canary, and user-path tests
passed after restoration. The evaluation suite was expanded to include corrections across
multiple turns.

**Lesson.** Promotion criteria must model how the system is used. A rollback can be the
most evidence-driven release decision.

## 5. Retrieval looked grounded but could still cite invalid evidence

**Symptom.** A generated answer could include citation-shaped labels even when the labels
did not correspond to the selected evidence.

**Decision.** Treat model citations as untrusted output. Retrieve evidence first, number it
outside the prompt, range-check every returned citation, and refuse to present an answer
when the evidence set or labels are invalid.

**Verification.** Valid synthetic evidence returned a grounded answer; empty retrieval and
out-of-range labels produced safe review responses; test records were then removed from all
memory layers.

**Lesson.** Grounding is a pipeline property, not a tone of voice.

## 6. A powerful accelerator was busy in bursts but the pipeline stayed slow

**Symptom.** Thousands of selected files remained, yet the optional local accelerator
alternated between sharp utilization peaks and idle gaps. A dashboard also compared files
in the whole pipeline with instantaneous GPU requests, making the mismatch harder to
interpret.

**Competing hypotheses.** The obvious explanation was too few workers. Other candidates
included storage latency, model reloads, insufficient request parallelism, and a local
stage serializing otherwise independent workers.

**Measurement.** Adding two workers produced only a 2.6% average completed-file gain
across two fixed windows, so the prior topology was restored.
Stage traces then showed Personal workers converging on local embedding during final
index preparation.

**Decision.** Offload only Personal embedding batches to the accelerator. Keep file
orchestration, non-Personal private work, admission, pause controls, and semantic-index
mutation on the primary workstation. Require both resolved Personal scope and dedicated-worker
identity, validate the complete vector set before any index change, pin compatible local
model identities, and never fall back silently after remote failure.

**Verification.** A matched two-minute window improved from 22 to 64 completed files.
A separate hardware window averaged 74.4% utilization and peaked at 99%. Representative
local and remote embeddings had the expected dimension, cosine agreement of 1.0, and
identical rankings. Alternating language and embedding calls proved both models remained
resident. Pause drained active work within ten seconds with no orphan admission state.
Negative tests covered count, dimension, numeric type, non-finite values, zero norm,
endpoint failure, model identity, scope, and literal folder boundaries.

**Limit.** The utilization sample was separate from the throughput comparison, and both
results were workload-specific. They demonstrate a measured bottleneck removal, not a
promise of constant GPU utilization or universal speedup.

**Lesson.** Optimize completed useful work, not worker count or a single utilization
graph. Move the measured bottleneck while leaving trust and mutation boundaries intact.

## 7. Correct quarantine made an unrelated accelerator look broken

**Symptom.** A status interface said the optional accelerator might be healthy but the
Knowledge worker was not consuming its results. The background pipeline repeatedly
retried instead of completing files.

**Competing hypotheses.** The accelerator itself could have been offline, the worker
could have lost its remote route, or admission could have blocked a primary-machine
phase. Endpoint checks alone could not distinguish these cases.

**Measurement.** Interactive model front doors had reached their upstream read deadline
and correctly quarantined ambiguous reservations. After the front doors stopped accepting
new work, detached backend requests still appeared running with no clients and no token
progress. Repeated quarantined reservations had consumed enough shared capacity to prevent
the Knowledge background profile from entering.

**Recovery.** Both ingest lanes were paused and drained. An explicitly approved local
backend restart was performed only after frozen-work evidence was established. The
admission authority then used its own idle probe to reconcile exact quarantined leases;
the persistent state layer was never edited directly.

**Prevention.** Interactive requests now consume a second, narrower capacity whose cap
preserves the Knowledge reserve and a safety margin in the shared pool. The status
component reads the authority's live policy and distinguishes “another phase can
admit” from “the required phase is already admitted.” Quarantine, probe-gated release,
and intentionally exclusive workloads remain unchanged.

**Verification.** A contract simulation filled the interactive-only pool with quarantined
leases, refused the next interactive request, and still admitted Knowledge. Admission,
front-door, controller, guard, and responsive-layout suites passed. The deployed workflow then
showed terminal file progress, successful local accelerator language and embedding
results, an active user-facing state, and zero quarantine debt.

**Follow-up.** The model front door now gives each protected chat an exact backend
identity and observes downstream EOF while waiting for headers or stream chunks. A
private authenticated control aborts only that request; the lease is released only when
the backend proves that it existed and is now absent. Live streaming and pre-header
disconnects both returned engine and admission state to idle without restart, followed
by a normal agent canary. Failed, unknown, or ineffective abort still quarantines.

**Limit.** A fully quarantined interactive pool can still deny new chats when the engine
cannot confirm cancellation. That is the residual fail-closed tradeoff; unattended
backend restart or unproven lease deletion was not introduced. The reserve prevents
starvation by this failure class; it does not guarantee zero background latency under
unrelated intentional contention.

**Lesson.** Quarantine correctness is not enough. Bound one profile's failure debt so it
cannot starve an unrelated profile, make operational UI read the same live policy as
the authority it explains, and treat cancellation as a transaction whose commit is
verified backend absence.

## 8. A delivered briefing was not yet a trustworthy briefing

**Symptom.** A recurring local web scout completed and delivered its first professional-
opportunity report. The saved output included useful leads, but also stale or blocked
listings and one clearly low-fit role from an unrelated project domain.

**Competing hypotheses.** The search might simply have found a thin market, the fit score
might have been too generous, or the prompt's verification language might not have been
structural enough. Opening the artifact showed the last two were both true: search
snippets had been treated as verification and weak results had been used as padding.

**Decision.** Treat the delivered report as qualification evidence, not a verified
baseline. Classify each candidate into exactly one state. Verified matches must clear a
fit threshold, readable authoritative-page check, requirements-evidence check, and
recency/open-status check. Unverified leads are separate, unscored, and capped. Low-fit,
stale, closed, or domain-mismatched candidates are excluded entirely.

**Verification.** The direct run reached terminal completion and had a durable delivered
receipt. The artifact was opened and privacy-checked. An independent review rejected the
first correction because state separation remained advisory; the mutually exclusive
rewrite passed. Scheduler state, local inference, duplicate continuity, next-run state,
and preservation of an unrelated active workload were checked. No second external test
was sent.

**Limit.** The direct run proves the agent and delivery path. The first natural trigger
and the corrected prompt's next live report remain unobserved by explicit owner waiver.

**Rollback.** Remove the isolated schedule and restore the backed-up scheduler state;
unrelated briefings and active Knowledge work remain outside that rollback.

**Lesson.** Transport success is not content quality. Verify the artifact, make evidence
states mutually exclusive, and prefer an empty verified section to padded recommendations.

## 9. A polished meeting summary was less trustworthy than a sparse one

**Symptom.** A local agent produced well-structured meeting notes and senior summaries,
but live tests showed that polish could hide unsupported recommendations, inferred risks,
an invented action owner, and one wrong absolute date. It also created a document when
the request asked only for text suitable for pasting into chat.

**Competing hypotheses.** The model might simply need a stronger instruction, the skill
could be routing under an action-extraction name, or the requested bullet count might be
encouraging filler. Repeated synthetic tests showed all three contributed: natural skill
selection was probabilistic, ambiguous guidance invited inference, and sparse topics were
being padded to satisfy a presentation target.

**Decision.** Split the workflow into detailed-record and senior-summary modes. Require
every substantive sentence to map to supplied evidence; preserve uncertainty and speaker
attribution; never turn a decision into an assigned action; and verify relative dates with
a deterministic calendar utility. Use fewer bullets when the source is sparse. Treat
inline text, file creation, task creation, and external delivery as distinct permission
boundaries.

**Verification.** The skill schema and routing index passed. Synthetic requests exercised
both modes, missing deadlines, attributed claims, relative dates, and the inline-only
boundary. Unrequested test artifacts were removed from the live data area and retained
only in private rollback evidence; no external message was sent. The refreshed agent was
healthy and an independent review accepted the final instruction and evidence record.

**Limit.** A skill is prompt guidance rather than a deterministic factual validator. The
local model can still occasionally embellish or compress a relationship incorrectly, so
important client output requires human review before sending.

**Lesson.** Summarisation quality is bounded by evidence fidelity, not fluency. Prefer a
sparse truthful draft to a complete-looking one, and never let a formatting request imply
permission to create or deliver an artifact.

## 10. Two safe Resume controls deadlocked each other

**Symptom.** A large Knowledge backlog remained while both the primary queue and an
optional accelerator showed blocked Resume states. Demand existed, but neither lane
could produce the evidence required by the other.

**Root cause.** The controllers formed a circular dependency across two structural pause
walls. The UI added ambiguity by treating control-response success as proof of activation
even when the returned state was blocked.

**Decision.** Accelerator Resume now performs a stopped, request-bound preflight while
both walls remain. Queue Resume accepts only that fresh receipt, verifies worker topology,
commits the accelerator, and then requires terminal queue progress plus observed relay
work. Master Pause recreates both walls before verified remote shutdown.

**Verification.** Focused negative contracts rejected stale, future, mismatched, and
wrong-phase evidence. Independent review found keeper and rollback races. A periodic
keeper collision during live deployment failed closed and led to holding the keeper only
after stopped preflight. Two live activations, an immediate pause/recovery cycle,
responsive browser checks, and a subsequent natural keeper run passed.

**Limit.** Foreground work may still delay background Resume by design. The supported
recovery is to wait and retry through the control plane, never to delete a wall manually.

**Lesson.** Cross-controller readiness is a transaction, not a button order. Preserve
walls through preflight and claim success only after the requested hardware path performs
useful work.

## 11. A modular selector was not yet a safe model manager

**Symptom.** A separate creative-writing inference lane could switch allowlisted models,
but adding one still required manual operational work. A generic repository field would
have been convenient while also creating a path from browser input to a high-privilege
model runtime.

**Root cause.** The immutable built-in manifest was correctly read-only and loaded only
at controller startup. There was no separate authority for inspection, download,
verification, durable progress, or safe registry publication.

**Decision.** Keep the built-ins immutable and introduce an unprivileged manager with a
separate atomic registry. Accept only a narrow reviewed public safetensors class; freeze
the exact immutable proposal before explicit expiring confirmation; enforce disk reserve,
resumption, cancellation, and available artifact hashes; and map eligible models to a
fixed serving profile rather than repository- or browser-supplied arguments.

**Verification.** Verification covered malformed input, registry collision, interrupted-state
recovery, cancellation, expired confirmation, and a publisher changing repository head
between inspection and confirmation. Independent review found the head-drift and repeated
polling-confirmation defects before completion; both received dedicated regressions. Live
inspection and cancellation exercised the user path without downloading a new model, and
both isolated inference lanes generated afterward.

The first completion claim was subsequently falsified by the real chat UI. Its middleware
attached automatic tool choice to a plain greeting, which the writing runtime correctly
rejected because no tool parser had been qualified. The proxy made diagnosis worse by
discarding the upstream reason. The repaired boundary preserves structured errors and
removes implicit tool/provider fields for this text-only lane. The exact full middleware
payload then streamed successfully, while the primary agent remained unchanged.

**Limit.** Metadata and artifact checks do not prove runtime compatibility. A newly
registered model becomes proven only after a real load and generation; failure restores
the prior secondary model. Private repositories, remote code, adapters, unsafe weight
formats, and automatic deletion remain deliberately unsupported.

**Lesson.** Model modularity requires separate authorities. Freeze what the owner
approved, keep data from becoming commands, distinguish registration from promotion,
and prove the actual GUI payload rather than a simplified proxy canary.

## When enabled search was only presentation state

**Symptom.** A secondary local model claimed it could not browse even though the chat
interface showed search enabled. After being told a search engine was connected, it
merely agreed; no search request occurred.

**Root cause.** A prior compatibility boundary discarded native tool declarations, and
the model-server launch had not enabled its checkpoint-compatible parser. The search
backend also depended on public engines that were temporarily rate-limited.

**Repair and proof.** Tool behavior was enabled only for the matching checkpoint. A
continuation test exposed and then eliminated protocol-marker leakage. Repeated
structured calls, abstention, streaming, parallel calls, provider observation, and a
grounded cited response passed. The primary agent remained isolated and unchanged.

**Lesson.** Treat user-interface state and model self-report as hypotheses. Prove the
entire chain from tool injection to external retrieval to clean grounded continuation.

## A startup-ordering bug that consumed capacity after every restart

A local inference service repeatedly left stale resource reservations behind. The
authority required an exact absence proof, but the endpoint providing that proof was
not available until after reconciliation—the classic circular startup dependency.
The fix exposed only the narrow boolean proof endpoint during initialization, held all
ordinary traffic behind readiness, and failed closed if reconciliation did not finish.
Tests exercised ordering and cleanup, and a repeated live restart demonstrated that
no new stale reservation appeared. The broader lesson: safety probes must be available
at the lifecycle phase in which the authority needs them, without prematurely making
the application ready.

## Resource boundaries should follow where work actually executes

A remote acceleration pipeline appeared healthy but made no progress whenever a local
interactive model consumed substantial unified memory. Its workers were still blocked
by a safety floor designed for local heavy computation before they could even dispatch
remote work. The fix moved that boundary: remote queue admission may proceed, while any
fallback into local heavy processing must reapply the original floor. Tests pinned both
sides of the boundary, and a live run proved completed files plus remote inference before
the natural supervisor safely stopped the remote lane at zero backlog.

## A meeting-notes application should ask before it assumes

A disciplined summary prompt was extended into a durable private workflow for transcripts
and recordings. Evidence extraction and final writing are separated by an explicit
clarification stage, so unclear ownership, dates, terminology, speaker identity, or
decision status can be answered—or deliberately left unresolved—before the notes exist.

Synthetic live tests found that generation alone could still overwrite an explicit title,
confuse an action deadline with the meeting date, omit references, or drop a human answer.
Deterministic preservation rules close those gaps. Restart-safe history, bounded inputs,
retryable local transcription, cancellation, stale and duplicate action protection,
exports, negative request tests, and phone layouts were exercised as part of the product.
The published lesson is not that ambiguity can be eliminated; it is that ambiguity should
be represented, routed to a person, and retained when unanswered.

The workflow was finally surfaced through a dedicated category in the existing private
launchpad. The integration reused its established navigation state rather than adding a
second router or proxy, preserved the original app collection, and changed no backend.
Focused pairing, target, deep-link, refresh, and responsive checks proved that the new
entry remained visible on a phone and still opened the private application. The result is
a useful reminder: discoverability can be improved with a small reversible interface
change, without turning a launch card into a new trust boundary.

## Narrow reuse after a failed model promotion

**Problem.** A coding-oriented model was valuable on isolated engineering tasks but did
not meet the behavioural bar for the personal agent. Direct editor reuse risked coupling
developer traffic to personal context and agent authority.

**Boundary.** The retained model became an explicitly started editor-only lane with its
own authentication, logical identity, resource accounting, and exact-owned lifecycle.
It receives no personal memory or retrieval mounts and cannot automatically stop another
workload.

**What testing found.** A shared accounting-service restart invalidated the assumptions
of a dependent secondary-model controller, which safely unloaded its backend; the prior
state was restored and reloads now require zero active leases. A browser test also found
a synchronous duplicate-click race that ordinary rendered busy state did not prevent.

**Honest result.** Authentication, unloaded behavior, refusal gates, recovery, and real
responsive UI states passed. The full large-model lifecycle remains untested until an
owner-approved window satisfies the memory and pause gates. Preserving that gap is safer
than evicting unrelated work or lowering a predeclared limit to make the demo pass.
