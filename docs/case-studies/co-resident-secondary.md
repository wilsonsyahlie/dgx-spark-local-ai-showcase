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


## Optional writer follow-up: test the actual chat path

A renewed writing-model trial reused an existing web-chat interface while preserving the assistant services. An earlier candidate had failed user acceptance and a long-prefix retrieval fixture; those failures remained recorded rather than being reclassified as successes for its replacement.

The first renewed launch failed while creating a CUDA context, before reading model weights, despite reported available memory. A bounded model-free device query with a scoped CUDA connection setting succeeded. Device enumeration was weaker evidence than context initialization, so the next step was one reviewed full retry, with the setting applied only to the optional process and recorded in its runtime specification. Release validation rejected absent, different or duplicate values. No host cache flush, compaction, driver change, assistant restart or reduced safety threshold was used.

The full retry loaded and answered. This does not isolate the setting as the cause: timing and memory-state differences remain possible. Twenty-two ownership and release controls passed, including environment drift rejection. Three overlapping requests produced correct assistant answers and coherent neutral prose from the writing model while protected process identities and runtime settings stayed unchanged. One sample reported roughly twenty generated tokens per second, with a substantially longer initial prompt stage; it is not a general performance benchmark.

The real browser test selected the replacement, submitted one message despite repeated Enter, waited for the asynchronous saved answer and verified visible text after refresh at desktop and phone widths. A former test harness had mistaken an asynchronous task receipt for streamed answer content; the corrected method waited for the completed saved assistant message. Consistent database comparisons preserved every earlier chat row and credential field, adding only the attributed neutral test conversation. Refreshing provider discovery used identical configuration values.

After the temporary loader-serialization lock was released, a finite observation retained healthy endpoints and unchanged protected identities. Boot activation stayed separate from a successful running trial. Full-window quality, cancellation stress, extended endurance, physical-device behavior and refusal behavior were not qualified. The result is usable local chat access with stated limits, not a guarantee that a fine-tune never refuses or that one short story proves long-form quality.

The practical lesson is to distinguish driver context creation, device enumeration, weight loading, real generation and the user's saved conversation. Each proves a different part of availability. Preserve failed tests, compare complete wrapper commands accurately, verify only the scoped change and retain history during provider refresh.


## Follow-up: replacing a secondary backend behind the same connection

A requested expert-model replacement reused the established secondary connection while preserving the higher-priority assistant. Keeping an alias and address was insufficient: review found that the proposed server window was smaller than the client's advertised context. The replacement preserved that contract and the existing local authentication boundary, then qualified the actual model and its embedded tool-aware template rather than borrowing a writer engine's compatibility claim.

The exact published quantized asset was pinned and hashed before GPU release. The old secondary was stopped at an observed idle boundary under its original owner, positively closed and retained before switching the unit. The new owner preserved memory, swap and temperature policies while protecting only the main assistant. Review also found an interrupted-retention retry defect; exact ownership and closure checks now make the rename step idempotent and reject unrelated names or receipts.

Twenty-eight ownership, release and recovery controls and twenty-two memory-attribution controls passed. Real chat, function-call/result exchange, streaming and an actual agent terminal turn succeeded. The first agent fixture hit existing unattended-command permissions and exhausted its budget; it remains failed evidence. A later permitted read-only command passed without weakening policy. Existing conversation rows and configuration files were preserved.

An owned stop, positive closure, new process and real reply qualified restart recovery while the main model retained its identity and health. Exact accelerator-process membership attributed the replacement to the secondary memory category. Desktop and phone-width checks covered loading, stale responses, errors, retry, duplicate reads and refresh. A verification helper repeated a known wrapper-offset mistake; preserved failing evidence and independent review led to comparing the entire command contract instead of a guessed slice.

These bounded checks do not establish full-window retrieval, creative-writing quality, refusal behavior, native image support, hardware-temperature stress, reboot behavior or endurance. The text-only secondary leaves the existing primary image-analysis route unchanged. Rollback retains the old model and owner, protects fresh state and reverses only the owned service change; it never rewinds conversation databases or restarts the main assistant.


## A smaller active model still needs a complete integration test

An owner-selected model reused its middle layers across several passes. That unusual architecture made the active parameter count a poor shortcut for deployment planning: the engine, template and tool parser all needed compatible support. The model files and runtime were qualified separately before replacing an existing assistant backend, while the old implementation was retained.

The resulting checks went beyond a successful text response. Structured tool calls were followed through their results and through the actual assistant client. Streaming, image input, overlapping requests and a fresh-process restart were tested. Resource readings were tied to the new process owner, with desktop and narrow-phone recovery checks. Existing client contracts and resource protections were retained.

One preservation check failed because a scheduled session was completing during the test. Comparing stored rows separated appended work from destruction: earlier messages remained intact, while the scheduled session's counters reflected its new messages. Another failed probe had omitted the device runtime required by the binary. Neither failure justified weakening an assertion or silently changing history.

The bounded result established integration and recovery, not universal quality or optimal speed. Large cold prompts remained noticeable. Full-window retrieval, long coding tasks, refusal behaviour, physical devices and endurance were not qualified. The useful lesson is to validate the complete application path and keep concurrency visible rather than equating a model's advertised size with a finished installation.
