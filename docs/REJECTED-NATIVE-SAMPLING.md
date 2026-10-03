# A sampling recommendation that failed the task gate

A local assistant experiment tested whether a model publisher's recommended sampling settings improved useful work. They did not qualify: the baseline completed3/6 measured tasks correctly and the candidate completed2/6. No runtime change was retained.

The comparison used fresh matched executions covering exact instruction following, strict JSON extraction and file/tool repair. Pair order alternated, with two excluded warm-ups. The file-repair contract had been used previously; the record does not describe every task as unseen. Inputs, model, reasoning mode, native schemas and limits were held fixed. The candidate changed only its declared sampling bundle.

The acceptance rules were fixed before execution. A quality improvement needed every candidate task and warm-up correct, at least two additional correct completions, enough comparable successes and bounded time/token regressions. A speed-only alternative needed all tasks correct in both conditions, at least25% lower summed task time, at least five faster pairs and the declared cost limits. Neither rule passed.

| Category | Baseline correct | Candidate correct |
|---|---:|---:|
| Exact instruction following |0/2|0/2|
| Strict JSON |1/2|1/2|
| File repair |2/2|1/2|

Both warm-ups failed exact output. One JSON pair returned correct extracted content inside prohibited Markdown fences; that remained a failed interface contract. A candidate repair also failed invalid-update preservation where its matched baseline passed. Responses were never repaired, retried or rescored. Observed failure under candidate settings does not establish causation.

Only two pairs succeeded in both conditions, below the minimum comparison count. Their descriptive time/token observations did not establish a general performance effect. The claim remained a rejected recommendation, not an upgrade.

Measurement controls checked actual serialized requests, effective backend parameters, grading, process ownership and failure cleanup. Synthetic fixture release results stayed separate from actual model-request settlement proof. All14 native executions and22 real requests closed cleanly. Offline CLI rollback checks used the actual execution user and preserved private permissions.

The engineering lesson is practical: official defaults are useful hypotheses, but useful task completion decides whether to adopt them. Strict output requirements, failure preservation and positive cleanup evidence prevented a plausible recommendation from becoming an unsupported performance claim. This retrospective contains no runtime configuration, deployment procedure, current topology or private task data.
