# Bounding a local coding agent

A two-day game-building experiment exposed a recurring mistake in agent tooling: rules
such as “use two helpers,” “only the lead edits,” and “stop after repeated failure” are
not dependable when they exist only in a prompt.

The replacement design keeps inference local while moving authority into mechanics. A
single phase lead owns edits and may consult two named read-only investigators. A host
lock prevents another writer. A launch hook blocks any other worker profile and rejects
worker three. Write hooks protect control files and rollback evidence while preserving a
checksummed pre-change copy of source files. Network policy permits only the local model,
and fixed external test gates—not the model’s prose—decide whether a phase passed.

The most valuable result was not a green dashboard. Negative tests proved that wrong
workers, extra workers, concurrent writers, public network calls, protected-file changes,
and invented test names all fail closed. Existing gameplay test failures stayed visible
as the truthful starting point for later work.

The broader lesson is that a larger context window does not create discipline. Reliable
local agents need bounded phases and control-plane enforcement for concurrency, write
ownership, stopping, rollback, and verification.
