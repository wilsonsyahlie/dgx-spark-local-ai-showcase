# DGX Spark Local AI Engineering Showcase

This repository documents the engineering journey behind a local-first AI workstation
built on NVIDIA DGX Spark. It focuses on the problems solved, trade-offs made, failures
investigated, and evidence used to decide whether a change was safe to keep.

The platform combines a conversational agent, local language and vision inference,
private retrieval, media workflows, and operator controls on one shared-memory machine.
The defining constraint is simple: inference stays local, private information stays
private, and heavy workloads cannot silently compete for the same resources.

## What this demonstrates

- Designing an agent platform around structural privacy boundaries
- Operating several GPU-heavy workflows on one shared-memory system
- Turning unreliable background work into observable, recoverable state machines
- Building evidence-grounded retrieval over separately scoped collections
- Diagnosing failures across application, model-serving, scheduling, and operating-system layers
- Treating rollback, negative tests, and unresolved limits as part of delivery

## Start here

- [Architecture](docs/ARCHITECTURE.md)
- [Engineering journey](docs/ENGINEERING-JOURNEY.md)
- [Troubleshooting case studies](docs/CASE-STUDIES.md)
- [Reliability and safety](docs/RELIABILITY-AND-SAFETY.md)
- [Verification](docs/VERIFICATION.md)

## Publication boundary

This is a retrospective, privacy-scrubbed portfolio. It contains no production
configuration, credentials, private data, hostnames, network addresses, account or task
identifiers, raw logs, databases, backup artifacts, model files, or deployable secrets.
Current operational details and the private repository history are intentionally omitted.

The public Git history reconstructs the genuine milestone sequence from reviewed private
evidence. Commit dates reflect publication of this sanitized showcase, not the original
production activation dates. No artificial activity commits are added.

