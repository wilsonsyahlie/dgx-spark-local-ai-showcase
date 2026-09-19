# From model card to verified local web chat

A large local model can appear installed while remaining unusable, misconfigured, or
unsafe to load beside another workload. This change qualified an official 70B assistant
for an existing local web interface by treating availability as a chain of evidence.

The publisher-provided Q4_K_M artifact was selected instead of the original-precision
release. A friendly local alias preserved the ChatML conversation format and set a 32K
context cap rather than inheriting the artifact's 128K maximum. The download passed digest
verification, model inspection proved the expected family and quantization, and the web
interface's authenticated catalog showed the alias from its local runtime.

The final check used the same authenticated chat route as the interface. It returned an
exact canary at 5.37 output tokens per second. The prior large experimental workload was
stopped only after zero active and waiting requests were measured, and it was not restarted
beside the new model.

This evidence supports immediate single-user chat at the configured context policy. It
does not claim full 32K saturation, parallel throughput, or long-duration stability.
Rollback unloads the model, removes its two catalog entries, verifies their disappearance,
and restores the former workload only after its existing memory floor passes.

A later greeting exposed a template boundary. The weights supported the model's documented
tool protocol, but the imported artifact lacked a tokenizer template and the local alias
used a prompt-only fallback. The runtime therefore rejected requests whenever the web
interface attached tools. A temporary alias qualified a current ChatML tool template:
ordinary chat with tools attached returned normal text, and an explicit request returned
a parsed function call. The production alias was updated only after both cases passed, and
the same paths then passed through the authenticated web endpoint. No external tool was
invoked, and the weights and context policy did not change.
