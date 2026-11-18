# A hosted coding model that produces usable local files

The owner wanted a hosted model to build applications directly on a local machine. A browser chat alone could return code but had no local file or execution tools. The scoped solution connected a dedicated coding agent to that hosted model and gave it a new application workspace. Existing local assistants, inference routes, retired project histories and private knowledge stayed separate.

The model credential was held outside the agent environment. A narrow broker fixed the upstream and selected model, while a separate private browser origin served application previews. The agent ran without host administration, device access or broad host mounts. Resource and storage bounds protected the surrounding machine. Workspace checkpoints preceded model turns; tested legacy editing and shell tools also retained predecessors. That does not promise a snapshot of every intermediate write inside an arbitrary command.

Independent review found concrete boundary defects before the coding front door was enabled: an internal container network still reached host services, pathname-based backup traversal was raceable, and firewall rules reconstructed in the wrong order. Scoped network rules, anchored directory descriptors, bounded copying and a fresh-network rule test addressed those measured causes. Capacity failure stopped a model request rather than silently skipping its checkpoint.

The largest compatibility delay came from a hybrid coding-agent build. Its browser discovered models through a newer configuration loader, while prompt submission used the older tool path. The environment-selected settings that made an API task work were invisible to browser discovery. Current documentation also described shapes that the installed executable did not accept. Inspecting the installed loader established a compatible shared configuration instead of assuming API success meant browser readiness.

The actual private-browser path exposed two further failures: compressed model-list responses could not be parsed by the broker, and the client encoded its workspace header. Those were reproduced and fixed while retaining rejection of traversal, repeated encoding and outside paths. A model-created server also disappeared after its initial shell command returned. A later launch used an explicitly detached process, with real browser interaction required before accepting the preview.

Qualification covered model-authored file creation, editing, shell work, saved predecessors and an interactive application. Desktop and narrow layouts, refresh, loading, stale responses, duplicate suppression, failure/retry, shutdown and recovery were checked at their relevant layers. Earlier premature preview wording and failed observer assumptions were retained as failures, not credited as passes. Provider identity and observed tool behavior do not independently attest hosted weights, broad application quality, full context performance or physical-device behavior.

The retained recovery plan closes only the dedicated component and reverses its additive portal entry. Projects, histories, checkpoints and predecessor artifacts remain available; unrelated assistants and model defaults are not restored or rewritten.


## Follow-up: let the user answer an agent question

An actual browser submission exposed a missing lifecycle route: the private gateway allowed task creation but refused replies to questions asked by the agent. The correction admitted only the existing question reply and rejection operations, with strict method, identifier and payload checks. Authentication, workspace boundaries and unrelated mutation restrictions stayed in place.

Eighteen isolated checks proved exact answer forwarding and rejection of malformed or unauthorized requests. Live requests using a nonexistent fixture question reached the native service and returned its expected not-found response, including from desktop and narrow browser contexts. The real waiting question and agent process were preserved; no answer was submitted on the owner's behalf. An initial probe before gateway readiness returned a transient failure and was retained. Successful delivery of a real user answer was left for the owner's retry, rather than inferred from a routing test.

When introducing a narrow API gateway, verify the complete interactive lifecycle, including questions and their replies. Task creation alone does not establish a usable conversation.


## Recovering from checkpoint amplification

Full copies of unchanged dependencies exhausted a bounded workspace during a real task. Recovery preserved a cold data image, checked filesystem consistency, increased its finite capacity and introduced content sharing only for future snapshots. Old snapshots were neither migrated nor removed. Each reused object is checked for type, ownership, mode, size and digest; new contents are copied through anchored descriptors and published durably before an action can continue. Snapshot paths and version manifests remain available.

Tests covered unchanged and changed contents, predecessor retention, corrupt objects, symlink and special-file races, concurrent checkpoints, capacity denial and interrupted publication. Targeted interruption checks exercised object, snapshot-file and manifest directory persistence through both protected request paths. A failed final manifest persistence can leave a manifest alongside a failure marker; the request still fails and never forwards. An unavailable filesystem cannot guarantee a durable failure receipt. These are injected isolated faults, not live storage corruption tests.

The same coding session resumed after restart with its earlier messages retained. A repeated live checkpoint demonstrated a small incremental cost. Coaching stopped speculative browser searches and returned implementation to the application model. The resulting application and external service behavior were not certified by this repair. Browser runtimes remain unavailable inside the agent environment; no network expansion or automatic transaction was added.

Limits: sharing relies on protected storage and application immutability, not resistance to a privileged host administrator. Backup content sharing does not itself establish confidentiality from other host users; file-mode checks must cover backing and audit artifacts. Rollback keeps the expanded filesystem and newer histories while reverting only the gateway source; restoring an old image would require separate authorization. Long-term growth, full disaster restoration and endurance remain untested.
