# Rejecting an acceleration candidate with complete-task evidence

A local-agent acceleration experiment passed startup and a behavioral warm-up, then failed its first measured task. The assistant said it would begin, but used no tool and produced no required file. The candidate was rejected and the retained serving artifact was recovered. No performance gain was claimed.

The evaluation had frozen requirements, behavioral checks, repetitions and a meaningful complete-task speed gate. Baseline errors stayed visible. A short failed turn could not count as faster successful work, and a successful warm-up could not stand in for the missing task result. Remaining work was not retried to manufacture a favorable comparison.

The experiment also exposed two engineering boundaries. A container engine normalized a nullable field during creation; the guard was corrected only for the measured platform-dependent equivalence, while other fields remained strict. A passive measurement observer needed exact child ownership and cleanup that survived logging failures. Actual controls kept failure outcomes negative and demonstrated owned-child closure.

Recovery evidence distinguished a healthy retained artifact from an exit code or optimistic status message. Original operating policy and exact owned request settlement were checked. Failed artifacts and imperfect preparation history remained in the private audit.

This retrospective records a rejected live experiment and improved evaluation guards. It does not establish a speedup, a causal decoding regression, general agent competence or phone-interface acceptance. Startup, request completion, task correctness and user benefit are separate claims.
