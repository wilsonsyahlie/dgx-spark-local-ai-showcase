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
