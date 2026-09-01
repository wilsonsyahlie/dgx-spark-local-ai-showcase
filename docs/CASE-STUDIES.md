# Troubleshooting case studies

These cases are retrospective and intentionally omit production identifiers, endpoints,
paths, and current private state. Each follows the same structure: symptom, competing
hypotheses, measurement, decision, verification, and reusable lesson.

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
