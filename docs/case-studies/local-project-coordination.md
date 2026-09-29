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
