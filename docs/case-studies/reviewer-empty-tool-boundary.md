# When an empty answer is actually an unsupported tool call

A reviewer displayed a warning that suggested failure after tool execution. Saved evidence showed that no tools had run. Reproducing the offered tool schemas and prompt revealed an unavailable tool call embedded in ordinary text. The server retained that text; the agent's display sanitizer removed it. Repeating the same request reproduced the empty result.

A scoped role-guidance change clarified that the reviewer should inspect supplied artifacts, use offered tools and wait when there was nothing to review. Tool privileges and other active work remained unchanged. Protected native session reload preserved the original transcript. Early exports were empty because prompts are built lazily; actual interface turns provided the activation evidence.

A diagnostic tool-result continuation returned a pass, and separate live turns demonstrated both waiting and a substantive code finding. The original task was not replayed. This was a bounded mitigation, not a universal parser fix or a promise of flawless model behavior. The owner's review waiver was recorded separately from verification. This retrospective contains no current topology or deployable instructions.
