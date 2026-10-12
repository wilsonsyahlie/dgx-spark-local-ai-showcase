# Failure evidence before changing a model guard

A local agent workload repeatedly lost its shared backend after a resource guard stopped inference. Restarting restored service, but did not establish a permanent repair. Historical failure evidence lacked the effective resource limits and charge disposition needed to identify the initiating cause.

Source inspection suggested that a counter could briefly include an attempted charge before rejection. That possibility was not enough to label the observed failures false positives. Independent review rejected a proposed filter because peak-reset and limit-transition races could defeat its proof. The guard was preserved. A small isolated mechanism experiment did not reproduce the suspected counter path and was recorded as inconclusive.

Successful bounded native concurrency and a longer actual-context diagnostic established present operation only. The saved request timeline showed the other roles starting after the backend stop, so the investigation did not attribute the failure to concurrent roles without evidence.

A finite read-only observer was qualified to capture actual guard reads and attributable resource-charge outcomes. Nine lifecycle regressions covered deadline, positive event, lost evidence, attachment failure, output ceiling, identity change, uncooperative child cleanup and positives arriving during final drain, including a split marker. A short live attachment produced five matched reads and clean detachment. Independent review required an outer finite observer-only lifecycle so a wrapper crash could not leave tracing indefinitely. No model settings, restart policy or production guard correction was introduced.

## Evidence limits and prevention

The historical cause and permanent repair remain unproven. Clean requests do not replace a reproduced failure. Identity polling is not atomic proof, rate-limited details require retained aggregates, and missing or truncated terminal evidence is inconclusive. The prevention rule is to preserve attributable failure evidence before changing a safety decision, and to report restoration, diagnostic qualification and permanent repair as separate outcomes.


## Closing the limit-transition and peak-reset evidence gap

A renewed review identified two specific missing observations: attempted limit changes and per-descriptor peak resets. The finite diagnostic was extended to pair those write entries and returns, distinguish success from failure, and keep descriptor peak state separate from global and local watermarks. It collects no write buffers. Missing attribution, incomplete pairs and suppressed details remain explicit.

Qualification attached twelve probes and observed six paired ordinary guard reads, with clean detachment. No natural writes occurred, so write attribution remains unexercised rather than passed. The earlier observer ended deliberately with one pending read; that segment has incomplete coverage. The replacement preserves the original observation deadline and records a discontinuity instead of silently restarting a fresh window.

The historical cause and permanent repair remain unproven. This closes a diagnostic design gap, without validating a counter classifier or weakening the production guard.
