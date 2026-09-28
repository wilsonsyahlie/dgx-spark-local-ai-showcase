# An audio studio that needed native CPU qualification

## Problem and decision

An audio-production application looked useful beside an established local voice
assistant. Its narration, cloning and dubbing interface served a different purpose
from interactive conversation with interruption and agent tasks. Installation was
therefore evaluated as a separate capability, without replacing the voice assistant.

Compatibility inspection found that published containers targeted x86-64 and the
source CUDA dependency selection excluded ARM64. A native CPU installation preserved
the upstream dependency pins. Successful imports established that the runtime could
load; they did not establish GPU support. GPU acceleration remained unqualified.

## What failed

One native audio dependency failed along its build-tool path and succeeded using an
existing system CMake installation. The first offline synthesis then stalled when
watermark initialization attempted a lazy model download. The bounded test service
was stopped, the pinned checkpoint was provisioned in advance, and inference was
repeated. A complete offline cache must include output-provenance dependencies.

## Evidence and limits

A short preset-narration test produced 6.71 seconds of audio in 9.96 seconds of wall
time with watermark processing. A synthetic-reference cloning test produced three
seconds of finite audio in 71.76 seconds with reduced generation steps. Neither
measurement establishes subjective voice similarity or conversational responsiveness.

A browser synthesis using default settings completed in about three minutes and
played successfully. Injected failure, retry, duplicate-action prevention, refresh
and service-restart recovery were checked. Saved output survived restart without
replaying generation, while old sessions were invalidated. Phone-width layout had
no horizontal overflow. Fifty-one selected tests passed, including stale-response
and persistence checks. An earlier test that observed only response headers was
explicitly rejected as completion evidence; the replacement waited for the full stream.

The trial applied private authentication, blocked external runtime egress, resource
limits and filesystem/socket containment. Missing or incorrect credentials and a
cross-origin mutation were rejected; logout invalidated its session. Actual service
containment denied external IPv4 with a successful host control. A reachable IPv6
canary was unavailable, so that verification remained limited to policy inspection.
This retrospective omits access details, topology and deployment instructions.

GPU support, advanced production workflows, subjective listening quality, physical
phone use, sustained load, reboot and rollback execution remained unqualified.

The cloning weights carry a noncommercial license; commercial use was not qualified.

## Reusable lesson

Keep compatibility and acceptance claims at the layer actually tested. Native CPU
success can justify a useful isolated trial while GPU support remains unresolved.
A valid audio file is only one part of completion: authentication, recovery and the
actual browser workflow need their own evidence.
