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
