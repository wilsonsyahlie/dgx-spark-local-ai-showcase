# Recovering a desktop connection without restarting the application

A desktop client could remain open after its private transport ended. Its retry loop could not recreate that missing transport. A recent drop followed device sleep, but the evidence established correlation rather than the exact initiating cause.

The approved repair supervised the existing connection path instead of changing inference or the application. A single ownership lock serializes connection checks and creation. Recovery rejects ambiguous listener inspection, unexpected file ownership and foreign processes. It reuses healthy connections, uses bounded retries during failure and records concise rotating diagnostics. User-session supervision keeps the recovery process available.

The first independent source review identified incomplete listener validation and a timeout that could break serialization. Both were corrected before activation. A native test initially assumed the main application owned the persistent network socket; actual process evidence identified its network helper, so verification was corrected before the controlled disconnect.

Eleven focused guard cases passed. Simulated unavailable-network attempts exercised capped backoff. Three concurrent native launches reused one connection, lock contention returned within its deadline, and restarting the watcher preserved the healthy transport. A controlled exit of the verified owned transport recovered automatically in about fourteen seconds. The same main application and network helper remained running, with a renewed connection and a successful forwarded health response.

These results qualify controlled transport recovery. They do not qualify physical sleep and wake, network switching, next-login behavior, sustained outages or owner-visible UI acceptance. No application interface, model settings, credentials or device power policy changed. Recovery also does not restart an unavailable inference backend.

The lesson is to repair the missing connection layer while preserving ownership and application state. A successful controlled test must remain distinct from untested device lifecycle behavior.
