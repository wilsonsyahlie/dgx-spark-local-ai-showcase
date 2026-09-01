# Reliability and safety

## Why reliability became a product feature

Early iterations exposed a recurring pattern: a process could exit successfully while
the user-facing outcome was stale, incomplete, or never delivered. A model endpoint could
return health while failing real generation. A schedule could claim success after only
starting a child task. A rebuilt container could exist without becoming the running
artifact.

The project therefore adopted an evidence hierarchy:

1. Measure the current failure or baseline.
2. Back up the exact artifact and define rollback.
3. Test the smallest responsible component.
4. Test the integration boundary.
5. Activate deliberately.
6. Exercise the live user path.
7. Record what passed, what was not tested, and what remains limited.

## Structural controls

### Workload admission

Every heavy workflow checks the same admission state before allocating a transient model
or starting a render. Operating modes express owner intent; a cross-service lock prevents
overlap; memory floors protect the resident assistant. Low-priority ingestion also checks
for foreground activity at safe checkpoints and returns to a recoverable waiting state.
Fail-closed reservations remain blocking until downstream absence is independently
proved. A profile-specific debt ceiling ensures those reservations cannot consume the
background reserve belonging to another workflow.
Protected chat requests also receive proxy-owned backend identities. The proxy observes
client liveness while blocked on upstream I/O and can request private, authenticated,
exact cancellation. It releases only after verified backend absence; a failed or unknown
abort remains quarantined.

### Scope isolation

Personal and work documents use separate retrieval scopes and vector collections. Source
storage is mounted read-only. Generated private media is not silently moved to shared
storage. Missing pause markers are treated as drift, not permission to resume work.

### Bounded side effects

Operator actions use allowlisted operations, opaque one-use proposals, explicit
confirmation, and narrow writable paths. Scheduled delivery distinguishes accepted,
completed, delivered, failed, suppressed, and unknown. Unknown delivery is never blindly
replayed.

Text transformation follows the same boundary. Asking for an email body or chat-ready
summary authorises an inline draft, not a document, task, post, or send. Meeting records
also preserve source certainty: sparse evidence stays sparse, owners are never inferred,
and relative dates are verified rather than guessed.

### Safe model changes

Candidate models are evaluated against context handling, coding, tool selection,
protocols, recovery from correction, latency, and memory. Promotion is a reversible
transaction. A later behavioural failure can invalidate an earlier technical pass, and
rollback is treated as a successful engineering outcome when it restores the stronger
user contract.

## Verification layers

| Layer | Evidence sought |
|---|---|
| Source | Syntax, schema, privacy rules, and explicit configuration intent |
| Unit | State transitions, parsers, admission decisions, and negative paths |
| Integration | Real service boundaries, durable artifacts, and dependency behaviour |
| Activation | Running process/image fingerprint and preserved safety controls |
| User path | Actual response, UI state, retry behaviour, and restart recovery |
| Scheduled | Natural execution, next-run truth, terminal child state, artifact, delivery receipt |

## Lessons retained

- A build is not an activation.
- An HTTP success is not a completed workflow.
- A queue receipt is not delivery.
- An empty command result is not proof that nothing happened.
- Model throughput does not predict multi-turn agent behaviour.
- A rollback with preserved evidence is better than a fragile promotion.
- Stale UI responses require request identity, not faster polling.
- Private defaults must cover both existing state and newly created files.
- Reproduction and negative tests prevent the next agent from rediscovering the same failure.
- A downstream timeout and missing clients do not prove backend work stopped; require
  running/waiting and forward-progress evidence before recovery.
- Quarantine needs cross-profile capacity isolation so correct failure containment does
  not become indefinite starvation elsewhere.
- Health displays must read the same live policy as their authority and distinguish
  additional feasibility from a lease that is already admitted.
- Client EOF is a cancellation trigger, not completion proof. Bind cancellation to an
  exact backend identity and require verified absence before releasing admission.
- Fluent meeting prose is not evidence fidelity. Map each substantive sentence to the
  source, avoid padding, separate decisions from assigned actions, and keep human review
  for important client-facing output.
