# Coordinating local agents without duplicating their work

A project board can make an assistant's work easier to follow, but attaching an agent to a board does not automatically provide reliable permissions, cancellation or review handoff. This retrospective describes a small local pilot with a worker followed by a reviewer, while the existing conversational interface remained the operator's entry point.

## The difficult part was the handoff

The initial integration exposed several mismatched assumptions. A permission endpoint reported command identifiers but answered requests in queue order. A coordinator cancellation did not itself prove that agent work had stopped. Reassigning a task while its execution remained active cancelled that execution. Finishing without the expected task disposition could start recovery work. Qualification preserved those failures and their completed output instead of hiding them with repeated execution.

The resulting design separated three facts: the agent finished, the coordinator settled its run, and the result was durably published. An explicit waiting disposition bridged the interval. Review could begin only after the exact worker result was confirmed delivered. Changed task text, changed ownership, cancellation or an unknown acknowledgement blocked automatic continuation.

## Consent and foreground interaction

The operator could give permission in the existing conversation for one displayed pending command. Recorded consent and confirmed execution remained separate states. Background work waited for foreground interaction to become idle before consuming the decision once. Model-authored text was not accepted as human permission.

One execution lane prevented the worker and reviewer from competing with each other. A controlled foreground-arrival test interrupted real local work, verified idle and then completed a fresh request. It did not substitute for a physical microphone or speaker test. The design used the existing trusted local environment; it was not presented as security isolation between adversarial agents.

## What the evidence supported

The clean acceptance task was a harmless health report followed by an independent review. It produced two successful coordinator runs, two delivered results and a completed task. Focused tests and independent review covered duplicate requests, late cancellation, lost acknowledgements, queued consent, changed context, restart uncertainty and supervisor failure. Private login, browser refresh, error recovery, stale-response handling and a narrow-screen layout were checked. Existing conversational services continued running.

The pilot did not qualify dangerous production changes, external-message delivery, prolonged unattended operation or restoration from backup. Earlier qualification failures remained visible in the engineering record. This case study contains no deployment recipe, current network topology, private identifiers, configuration or credentials.

The practical lesson is to make every handoff observable and durable. A successful response from one layer cannot stand in for confirmed completion in another.


## Follow-up: a task must be valid before an agent receives it

An ordinary creation path allowed an agent assignment without the required project. Admission rejected the task before execution, while the adapter misleadingly suggested a credential problem. The fix addressed the creation and assignment paths, then backed them with a database rule that also covered direct or bulk writes. Missing scope was filled for the intended roles; conflicting explicit choices were rejected. Checks at startup made removed safeguards and unqualified upgrades visible.

Explicit recovery uncovered a second assumption: an active control timer did not imply delivery when its callback depended on disabled periodic scheduling. Separating those responsibilities allowed one recorded continuation to reach one native job without enabling recurring agent work. The recovered task subsequently hit an existing deadline while awaiting native permission. It stopped without a delivered result. That separate execution-lifetime defect remained unresolved; the evidence established one resumed execution, not a finished product.

A related account-security improvement used native authentication through a small private form. Lost acknowledgement after a password change was treated as an unknown outcome, with no automatic resend. Only nonsecret recovery metadata persisted. Independent review reproduced stale-response races during page restoration, which were corrected before activation.

Qualification covered assignment transitions, concurrency checks, database rejection, synthetic password changes, session revocation, duplicate submissions, uncertain responses, refresh and a narrow browser layout. Live checks verified the native account-menu entry and wrong-password rejection without changing the owner's password. Labelled routing fixtures produced no agent work. The final continuation was traced from its saved decision to one execution.

The lesson is to protect invariants where data is committed, then verify delivery independently from scheduling. A repair to one visible task cannot substitute for preventing the same invalid state on the next task. These checks do not promise that unrelated future agent tasks can never fail.


## Follow-up: verify a handoff as the new owner

A later ordinary task exposed a permission transition missed by the earlier helper-driven test. A worker saved its result and handed ownership to a reviewer, but verification still used the worker's old read authority. The denied read was treated as uncertain publication, which blocked review even though the result already existed.

Verification was changed to use the destination role for current task state and the source role for the original execution. Permission boundaries and unknown-outcome protection were retained. Exact saved receipts allowed recovery of review without replaying completed work. A fresh read-only task then exercised the complete handoff with successful executions and durable results; the refreshed interface no longer showed the recovery failure.

Focused regressions reproduced the old failure and covered queued review, late cancellation, changed ownership, missing or duplicate receipts and unavailable readback. The exercise also exposed separate output-quality limits: an unrequested review criterion and a missing explicit verdict. Those tasks remained conservatively blocked for review rather than being reported as accepted. Neither this fix nor its successful delivery checks promised that model judgments would always be correct.

The lesson is to test ordinary user entry paths and to keep execution success, delivery proof and review acceptance distinct.
