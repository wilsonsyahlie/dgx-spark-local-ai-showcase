# Making browser first-person controls feel coherent

A desktop voxel prototype can render correctly and still feel wrong when mouse capture and input
lifecycle are incomplete. In this iteration, the first click became capture-only, mouse movement
controlled the view while captured, and primary/secondary input mapped to mining and placement.
Losing focus or capture also neutralized held controls, preventing the familiar “stuck key” class
of failure.

The useful lesson was in verification. A test can accidentally alter the world while merely
trying to focus the game. The corrected checkpoint saves representative state before capture and
proves it remains unchanged after capture and after looking around. It then exercises movement,
collision, jumping, mining, inventory selection, placement, and browser error reporting. The
post-capture input adapters are described honestly as synthetic events rather than physical mouse
automation.

Two consecutive desktop playthroughs, a production build, a 69-assertion movement suite, and an
independent review passed. Phone behavior was deliberately outside this phase. The broader
engineering takeaway is that local coding agents work best inside enforced limits with external
evidence; generous model capacity is useful, but it is not a substitute for truthful tests and
explicit rollback.
