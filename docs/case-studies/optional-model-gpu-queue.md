# Queue the loading, not just the generation

A user wanted GPU execution for two specialist models while keeping the main assistant resident. A previous attempt to keep all models resident had failed. The revised design gave the optional specialists one shared slot: incoming requests entered a FIFO before model loading, and the old model had to close before the next could load. Serializing only token generation would not have solved the memory problem.

The application retained its familiar model choices. A narrow local gateway preserved tool, image and streaming requests for the secondary assistant, while the writer kept its native story-completion format. Ownership checks, mutually exclusive service lifetimes and measured admission constrained switching. The primary stayed resident. Once the writer's queue drained, the secondary returned automatically. Interrupted requests were recorded rather than silently replayed, and the rejected CPU mode remained inactive.

Real requests exercised the complete sequence, including a secondary request waiting during writer loading, device allocation, writer closure and restored secondary output. A browser generated and saved a neutral scene through the queue and recovered it after refresh. Restart, authentication, existing conversation preservation and narrow-screen checks supplemented focused fixtures. A live observer initially failed because it followed a temporary name through a legitimate rename; the corrected observation used explicit ownership labels and kept that failure in the record.

The result qualifies a bounded serial workflow, not permanent availability or universal writing quality. Waiting includes model verification and loading; cancellation and client timeouts still matter. The earlier outage is not retroactively considered preservation. The general lesson is to schedule the resource-heavy transition itself and to distinguish request waiting, model loading and actual completion.

The application also issued automatic metadata work after the visible story. A brief drain window lets immediate same-model requests reuse the resident model before restoration. Its final timing policy passed focused fixtures and an idle activation; the browser story check preceded that timing-only addition. Native model updates required preserving the existing access-grant list, and a copied audit-snapshot filename was corrected without touching production history. Draft edits before first activation were not each separately versioned; production predecessors were protected.


## 2026-11-23 — Empty queues should not force a cold start

A follow-up report exposed a policy mistake: after a writing request completed, the scheduler eagerly restored another model. That made the next writing request pay the loading cost again. A short grace period helped immediate background metadata requests but did not keep the writer warm across normal pauses.

The revised scheduler retains the last-used specialist while idle. An actual request for the other specialist still triggers the existing serialized switch; an empty queue alone does not. Focused FIFO and HTTP checks, actual consecutive story requests across an idle interval, an explicit cross-model switch and exact primary preservation qualified the change. Model settings and safeguards stayed intact.

This is a residency improvement, not a guarantee of instant output. Prompt processing and real competing requests still take time. A previous simultaneous-load failure does not prove that all models can never fit; that question remains separate from removing unnecessary reloads. The lesson is to treat residency policy and request scheduling separately: exclusivity need not mean eviction after every job.


## 2026-11-23 — Measure file cache before declaring residency impossible

The user wanted several models resident rather than repeatedly swapped. An earlier concurrent load had failed, but that did not establish a hardware capacity limit. A new measurement separated reported available memory from physically free memory and found a substantial clean file cache alongside device-resident tensors.

Releasing only an owned model file's clean cache preserved the GPU process and its real output. A revised profile used bounded loading without whole-file mapping and released redundant clean asset cache after readiness. Model contexts and GPU execution were retained. Ordered startup replaced overlapping loading, while the request queue controlled execution rather than residency.

In a finite local trial, all requested models stayed resident through alternating real requests, idle and a gateway restart. Writer output began promptly without another model load. Focused ownership and protocol checks supplemented actual responses and device attribution. A health fixture's empty-body assumption was corrected with the failed evidence retained.

This result established a working bounded profile, not the sole historical failure cause or permanent uptime. Existing memory and thermal guards remained, and heavier host work could still force a safety yield. The general lesson is to separate residency, loading strategy, file cache and execution scheduling before turning one allocation failure into a claim that models cannot coexist.


## Permanent retirement includes bootstrap and demand paths

The owner later retired an optional model permanently. Stopping its current process would not have delivered that intent: shared bootstrap and request dispatch could load it again. The bounded change added durable disabled intent, a native service condition and a direct-owner refusal, then removed startup links and made the shared gateway skip or explicitly reject the retired route. The remaining warm workload and assistant processes were preserved.

Focused and retained cases covered disabled bootstrap, pre-admission rejection, truthful catalog and health responses, unchanged authorisation and direct-owner refusal. Live service-start and direct-start attempts stayed unloaded, as did a second shared-gateway restart. The remaining workload returned real output; original queue rows and protected process/configuration identities were retained. Existing model assets and histories were kept. A real reboot and every client's cached selector were not part of this qualification.

Earlier co-resident and temporary-video restoration instructions were explicitly marked historical. This replaces the previous restoration intent for the retired role; it does not authorize deleting assets or silently substituting another model. Re-enabling requires a fresh owner decision.
