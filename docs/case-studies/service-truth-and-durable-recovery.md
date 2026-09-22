# When a green dashboard is not a working service

An operator-facing dashboard exposed a recurring reliability mistake: a successful
page load was being used as evidence that the service behind it could do useful work.
A reachable assistant interface lacked its model dependency, while a visualization
interface could open without a running measurement collector.

The repair separated those claims. Dependency readiness determined the displayed
status, and memory attribution followed the actual owning process. Restoring metrics
preserved existing history and required successive natural samples plus a query
through the visualization interface. Restoring inference required explicit operator
authorization and proof that the competing workload was idle, including queued work
and ownership state rather than a single utilization reading. A temporary admission
boundary closed the race between that proof and the handoff. A local assistant turn
and native desktop/phone navigation then verified the user-visible result.

The related browser-automation investigation showed why staging fidelity matters.
A simplified network lab passed, but a real container could not complete its own
proxy round trip. Source translation and an earlier ingress filter were independent
causes. Corrected tests included the platform's full packet path and proved both the
intended connection and rejection of unsolicited or cross-session traffic. A later
service-sandbox issue was caught by a strict namespace identity check; the check was
preserved while an isolated service probe identified the mount-visibility mismatch.

The most consequential finding concerned recovery history. A request appeared
accepted, but its receipt disappeared when the database was reopened independently.
The investigation reproduced a SQLite locking hazard: closing a second raw file
descriptor could release process-owned advisory locks and disrupt the library's
write-ahead-log lifecycle. A defensive file check had crossed a boundary owned by
the database library. After the correction, real recovery and duplicate-request
checks preserved a durable receipt and did not repeat the network change. An older
uncertain incident remained quarantined as unknown. The lesson is to test durable
acceptance from an independent reader; missing history must never become permission
to repeat an action.

The restoration and production runtime checks passed: actual browser connections
used distinct expected outbound addresses, protected state survived unchanged, and
workers remained paused after promotion. Staging also verified that one unavailable
item did not prevent navigation to another. Native entry, group navigation, reload,
scoped access and isolated error/retry also passed on desktop and phone layouts.
Real account login, CAPTCHA completion and provider-side ordering were not tested. No purchase, external test message, account
reset or reboot is part of the claim.

The reusable engineering rule is to define success at the boundary the user relies
on: actual dependency readiness, correctly attributed resources, an observed packet
round trip, and a receipt that survives a separate read. Keep failed tests and unknown
outcomes visible until those boundaries have been proved.
