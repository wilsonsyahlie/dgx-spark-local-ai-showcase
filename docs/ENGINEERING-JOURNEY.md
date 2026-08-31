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
