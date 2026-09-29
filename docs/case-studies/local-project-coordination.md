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


## Follow-up: stop reviews from inventing the assignment

Once delivery worked, two different review problems became visible: an extra claim in a worker's report became an invented requirement, and another review never stated its decision. The repair separated the requested outcome from model assertions and required an explicit supported verdict. An accurate report that a property is absent can satisfy an inspection request; a reviewer should not silently turn inspection into implementation.

One malformed verdict may receive a single format correction using existing evidence, within the original execution budget. A second unclear result remains visibly inconclusive. Exact attempt records and turn-bound permission checks preserve cancellation and prevent stale consent from applying to later work. The prompt requests no tools during correction; this is not a new capability sandbox.

Focused asynchronous fixtures and independent review covered rejection, ambiguous output, timeout, restart, storage failure and a cancellation gap after completion. Two existing tasks were reviewed again without repeating their workers or changing artifacts. One first encountered an unchanged readiness cancellation before any prompt. Exact no-action evidence allowed one supported continuation, with the cancelled attempt retained separately. Both actual reviews used exactly one correction with no additional tools and received explicit passing decisions with verified execution and delivery; refreshed desktop and narrow views showed the new results. Earlier scope and format findings were resolved for these measured cases, while the separate deadline limitation remained unchanged.

The lesson is to preserve the assignment's meaning across agents and to distinguish a valid response format from a correct judgment. No model-based review can promise that every future decision will be right.


## Follow-up: make a small team usable from one request

A separate prototype workflow turned one game description into planning, coding, generated artwork, integration and review. The interface showed understandable stages, exact permission requests, saved images and a sandboxed playable preview. A deterministic coordinator tracked dependencies; model execution and graphics production could overlap without turning the workflow into unrestricted recursive delegation.

Real qualification uncovered assumptions that isolated tests missed: task ownership rules, an ignored adapter setting and disabled demand delivery. Failed attempts were retained. A supported continuation was allowed only after proving that the failed adapter had dispatched nothing and the original children remained untouched. This is why configuring roles is not sufficient evidence that a team can actually work.

Graphics ownership required more than an empty queue. Another workload's supervisor restarted a stopped model, and a malformed diagnostic briefly returned misleading silence. Corrected process and resource evidence established availability. A separate unsafe legacy liveness check was contained through refusal to replay unknown work, without broadening the repair into unrelated machinery.

The engineering result was a bounded workflow with durable requests, separate active and human-wait budgets, exact permission identity and explicit failure states. Navigation did not own execution. Service interruption, uncertain side effects and stopping an already submitted graphics item remained different situations. Tests covered these boundaries at appropriate layers, plus a real small-game qualification. Preview smoke checks were distinguished from gameplay and image-use evidence; future model judgment and arbitrary game quality remain unguaranteed.

The lesson is that a friendly interface needs rigorous ownership and receipts underneath it. More agents alone do not create a reliable team.


The real browser also exposed missing credentials on sandboxed image requests. A short-lived read-only preview capability preserved the isolation boundary, with constrained navigation and redacted URL logs. Separately, an inherited voice-display limit interrupted a longer permission prompt. A larger bounded display did not change command authority. Recovery waited for actual native completion and reconciled artifacts because a missing session registry entry did not prove its worker had stopped. Interaction tests then distinguished actual generated-image use and gameplay from static smoke checks.


Later browser verification exposed two deployment assumptions: an unpinned executable path and browser settings under a protected home directory. A namespace-only probe missed the second failure. An equivalent restricted service reproduced it; private child-process settings directories corrected it without relaxing the service policy. The final acceptance must match the actual saved game bytes, because integration can change files after an earlier successful playtest. Native file-helper restrictions also did not constrain terminal execution under the same trusted identity; post-turn learning had its own completion boundary. These are explicit trust and evidence limits, not claims of isolated hostile agents.


## Follow-up: remove repeated consent for routine work

A supposedly simple game workflow still interrupted its owner to create a plan and check local code. Standing authorization replaced those repeated routine decisions with a durable one-operation reply tied to the exact active task. The interface could show progress while preserving real questions and protected exceptions.

A tempting session-wide toggle had a stale-identity fallback and uncertain cleanup. Reusing the existing request relay avoided those global-state risks. Review also found that an overly broad classifier could authorize explicit infrastructure changes; recognized execution categories and native protection metadata narrowed it before release. These controls preserve a trusted-worker boundary, not a new operating-system sandbox.

The verification separated duplicate delivery, Stop races, expired identities, unknown acknowledgements, foreground priority and active-work budgeting. A real local marker operation checked the native request-to-result path without generating another game. The lesson is that fewer prompts require clear standing authority and reliable receipts, not the removal of every decision boundary.
