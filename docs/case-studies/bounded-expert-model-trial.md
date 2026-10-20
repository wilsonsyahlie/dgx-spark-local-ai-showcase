# Evaluating a large model without confusing preparation with an upgrade

A community recipe promised to run a large expert model on compact local hardware by keeping part of its data on disk. The engineering question was whether a temporary trial could establish useful behavior while preserving the existing assistant and unrelated work.

Preparation exposed several different evidence boundaries. Downloaded bytes were verified, but an initial activation record did not prove those exact bytes remained unchanged. Container memory flags did not prove the kernel enforced the same swap policy. A safety stop affected the incumbent before the candidate ever loaded, so calling that a candidate capability failure would have been inaccurate.

Recovery preserved the assistant's existing settings and earlier conversation rows, and a real answer verified restored behavior. The investigation retained the original failure instead of treating a successful restart as an explanation of the paging cause.

Reusing completed compilation work introduced another lesson: a build cache is more than file contents. Its timestamps, extended attributes, symlinks and hardlink relationships matter. The real cache also contained hundreds of thousands of entries, which made a whole-tree verification strategy unsuitable for a small memory allowance. A streamed comparison with a disk-backed manifest kept the checker bounded.

Crash controls tested the actual lifecycle functions. Critical records appeared atomically, shutdown preceded logging, and uncertain stop or start replies did not justify replay. A desired-state marker was distinguished from proof that the previous process had stopped.

The engine build succeeded, but the first launch failed a startup admission check before loading weights. Source inspection supported one narrow correction without increasing the explicit cache allocation. A separately reviewed launch then reached partial weight loading before a stipulated host-swap-growth guard stopped it. Available memory remained above the free-memory floor; the deeper paging cause was not established.

The experiment remained unqualified. No candidate prompt or coding task ran, and no speed, quality, vision or complete-fit result was claimed. Both experimental runtimes were closed and the unchanged incumbent was restored and checked. The earlier failures and coverage gaps remained part of the record rather than disappearing behind a successful build.

The transferable lesson is simple: verified preparation, safe recovery and useful model performance require separate evidence. Time spent building an engine is not evidence that an upgrade has been delivered.
