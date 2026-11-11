# Adding capability while protecting the working assistant

A local-model experiment aimed to add a second assistant without displacing the one already in use. Preparation exposed a costly mistake: a background download and image extraction coincided with an existing swap-triggered policy stopping the working model. The interruption was retained as a failure. Recovery and the owner's explicit policy correction came before further qualification.

The useful engineering lesson was to give optional work its own lifecycle. Changes to the supervisor were checked around the existing engine, and the later model experiment retained separate ownership and resource boundaries. Other resource checks remained in place. A finite period of healthy operation did not become a promise of uninterrupted service.

## A working endpoint can still fail inside an assistant

Direct inference passed before the assistant could use the new endpoint reliably. One rejected setup advertised too little context; another requested an answer budget as large as the entire server window. A narrow provider setting corrected the outgoing answer cap, but the assistant's compressor did not use that setting to reserve space.

The final adjustment used an existing context-boundary rule to leave room for answers without changing the working model. Verification inspected the assembled assistant and actual outgoing request, then required a real response. This avoided treating successful configuration writes or a short standalone API call as sufficient integration evidence.

## What the experiment established

Fifteen focused lifecycle checks passed, along with overlapping inference, a deterministic tool exchange and one image example. An active nonterminal response returned to idle after disconnect and accepted a fresh request. Conversation preservation was compared against a consistent snapshot, and startup registration was verified separately from running readiness.

A stale readiness summary was revoked when it proved to belong to an earlier closed run. Evidence was then bound to the current configuration and running process. One generated predecessor lacked its required backup; retaining raw observations did not erase that provenance gap.

The exercise did not test a physical reboot, extended endurance, full-window stress, phone interaction or actual assistant tool execution. It demonstrated bounded coexistence and integration, while preserving the distinction between observed health and a continuous-availability guarantee.


## Follow-up: make added capability visible in resource accounting

A dashboard follow-up revealed that a newer model's generic worker processes were grouped as unknown GPU use. The correction attributed allocations through the running workload's full identity instead of guessing from Python or model names. Launcher and worker allocations were counted once each.

Both memory views gained an explicit secondary entry. The reporting contract and accounting sums changed together, while existing model controls retained their meaning. Sixty isolated checks and desktop/phone-width browser checks passed, including conservation, unavailable data, older responses, retries, repeated reads and refresh. No model action was used to test a display correction.

Only the dashboard restarted, and the observed model container identities and state remained unchanged. A physical phone, reboot, endurance and a deliberately induced real telemetry outage were not tested. An incorrect loading-text expectation failed in the first browser harness; the failure was preserved and an exact assertion against the established label then passed. The lesson was to verify every reporting view when introducing a new workload category, without turning allocation estimates into promises about physical memory accounting.


## Outage follow-up: separate loaders share the same memory

An optional model trial briefly reached readiness. A separate model server then accepted another substantial load whose own estimate left less shared memory than the assistant services required. Allocation errors and memory-floor shutdowns followed. The trial's watchdog did yield first, but that could not constrain the independent loader. A prior reassurance about assistant availability had not been checked; live status and requests disproved it.

Recovery preserved the failed ownership records, confirmed positive process closure and unloaded the exact interfering model only after proving it idle. The retained assistant recipes were started through their existing controls, with dependent work waiting for actual primary readiness. Both services subsequently returned correct answers in overlapping requests. Source, recipe, safety thresholds and swap allowance were retained rather than weakened to make a startup pass.

The owner separately approved disabling the extra model provider in the existing web chat. The supported configuration operation changed only its enable flag. Consistent database comparisons preserved every prior chat row and credential field; other connection settings and durable configuration values were unchanged. Refreshed desktop and phone-width browser checks found the provider absent without generating another chat or inference request.

This is a bounded recovery and a mitigation for one normal provider flow. It does not disable the host model service, wall off every administrative route, qualify other clients or prove continuous availability. A task observer was corrected after an overly short response allowance made its first answer check inconclusive; raw replies were retained before later assertions. The original failure was not relabelled a pass. Reboot, extended endurance, full-window loads and an induced memory-pressure recurrence were not tested.

The prevention lesson is to account for independent loaders before optional work is admitted. A per-process memory watchdog cannot reserve headroom against another server's abrupt allocation. Check live replies after disruptions, preserve evidence before assertions and distinguish a disabled user-interface provider from a host-wide access boundary.
