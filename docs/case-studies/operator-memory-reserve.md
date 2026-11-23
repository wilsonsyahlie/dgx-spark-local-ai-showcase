# Align memory shutdown policy with the operator's choice

A writing backend stopped when available host memory crossed its deliberately conservative reserve. The prior short residency test had left little margin above that cutoff. This was a measured controller stop, not proof of a kernel out-of-memory kill. The operator explicitly chose a smaller reserve.

The change applied that runtime policy consistently to all resident model owners so that another owner's old threshold would not recreate the same interruption. Each owner source changed one memory-threshold literal; model weights, context, GPU execution, loading budgets and other existing policies remained. Boundary checks accepted the chosen floor and rejected a value just below it.

The primary supervisor used its existing identity-bound adoption protocol, preserving the actual model and engine processes. The optional pair restarted at observed queue idle to activate their new policy and restore the stopped writer. Actual interleaved replies and idle observation then checked that the resident pool remained available. A prior failure record and protected source/state preimages remain intact; the chosen reserve is an explicit operator preference, not evidence of unlimited capacity.

The lesson is to distinguish a soft reserve from actual allocation failure and apply an operator-authorized policy consistently. A live source edit alone would not update the already-running interpreter. Activation evidence must identify the supervisor that adopted the change and the model processes it preserved. No forced memory-exhaustion, reboot or endurance guarantee was claimed.
