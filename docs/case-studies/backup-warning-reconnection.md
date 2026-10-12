# Reconnection blocked by unrelated filesystem diagnostics

A desktop client lost its private transport while its server remained available. Automatic recovery refused to continue because a listener inspection reported an inaccessible backup filesystem. The mount-metadata warning concerned a separate inspection path from TCP sockets, but discarding arbitrary diagnostics would have weakened ownership verification.

The repair recognizes only the complete known backup-filesystem warning and corroborates the target listener set through an independent, full-width TCP table. It preserves process ownership, private-address, control-channel and command checks. Unknown diagnostics, failed inspections and conflicting snapshots still defer recovery. The latest connection receipt retains corroborated warnings; the incident record preserves the original evidence separately.

Independent review caught a platform-specific dual-stack protocol label omitted by the first parser. The corrected parser passed the original guard suite and additional cases covering the known warning, incomplete or unknown errors, conflicting observations, owned and foreign listeners, wildcard addresses and IPv6.

The existing watcher naturally restored the private transport. The gateway responded through it, the original app stayed running with an established connection, and the owner confirmed the bots had reconnected. Three concurrent launcher calls reused the same transport. Future physical sleep, network switching and reboot were not tested; universal recovery is not claimed. No inference settings, generated creations or conversation histories were changed.
