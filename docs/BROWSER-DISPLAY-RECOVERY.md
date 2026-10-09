# When a display survives the application it should show

A browser viewer showed a blank image while reporting a successful connection.
The display service survived after the browser driver failed. Cached connectivity
and received pixels were both true, but neither proved that an application was
still running.

The repair checks actual browser responsiveness before reusing a session.
Connected-session checks are tied to the exact browser and view generation, so an
old monitor cannot close a newer view. Repeated failed checks retire the affected
connection; ordinary reconnect then reopens the saved profile. Healthy handoff
preserves helper state, while a full relaunch starts the helper stopped.
Explicitly closing the application still prevents automatic reopening.

Failure tests terminated only an isolated owned driver and verified its exit,
protocol failure and the return of a rendered browser view. They also checked
ownership handoff, interruption during recovery, refresh, narrow layouts and
request boundaries. Review found that a monitor exception could skip cleanup;
an injected cleanup failure verified the correction. Early signal-based tests
failed to establish process exit and were retained. A first live viewer test also
timed out without proving its cause; a later instrumented check passed without a
production change and separately verified visible output and the deployed source.

The result qualifies crash recovery, not the unknown initiating crash or sustained
reliability. Physical-device behavior, actual game actions, reboot and rollback
execution were outside the checks. The general lesson is that a connected
transport is weaker evidence than a responsive application and visible output.
