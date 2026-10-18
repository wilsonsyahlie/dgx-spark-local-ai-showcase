# Adding software inspection without changing the reasoning model

An assistant needed to investigate selected software using REA. The design favored a version-pinned analysis command and focused workflow instructions over adding a large tool catalog to every ordinary conversation. The extension reused an existing command interface and preserved the reasoning model.

Verification separated package installation, instruction discovery, real analysis and actual agent use. Every file from the published package matched the installed copy. A deliberately inert sample application supplied a known message channel and exposed API. Static analysis recovered their relationship; source digests and an execution sentinel checked that the sample was neither modified nor run. A missing-target case produced a structured error. A separate binary-inspection check returned assembly, which was explicitly distinguished from decompiled source.

The local assistant itself invoked the analyzer and generated the same Evidence record as the independent control. A successful installer exit would not have established that behavior. Final explanation and cleanup were treated as separate acceptance criteria.

Review improved the verification harness before the live request: preserve the first failure, observe cleanup independently and require positive closure before releasing the watchdog. Command and runtime lookup mistakes were retained in the private evidence record.

This exercise did not establish universal format support, native pseudocode recovery or runtime observation. Optional engines remained prerequisites, and static findings were not presented as proof of execution. No general speed improvement was inferred.

The reusable lesson is to add specialist capabilities at the existing interface, then verify an agent actually uses them. Package presence, tool output and a supported conclusion are distinct claims.

[REA project](https://github.com/morluto/rea). This is a retrospective engineering account, not an installation guide or deployable system description.


The live explanation correctly identified the message flow and transformation, but misattributed a component digest as the application-root digest. The original answer was retained and this supporting-citation check failed. The bounded integration passed with that accuracy limit; it did not establish that every generated citation is correct. Positive session, backend and lease closure, unchanged settings and preserved prior conversation rows were separately verified.
