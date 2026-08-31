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

