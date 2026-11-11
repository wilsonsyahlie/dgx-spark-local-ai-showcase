# From listing overload to selective live alerts

A collectible-listing project explored how to surface a small family of relevant items without forcing the reader to inspect every post. The owner rejected minute-based polling and stock interpretation. The resulting work used source events, caption-first decisions and local image recognition where text was insufficient.

## Use the cheapest sufficient evidence

A typed target name can settle a listing without an image call. A clearly named single-card non-target can also be skipped. Price-only or mixed listings need a different path: bounded local image classification, restricted to identity decisions. Original listing text supplies prices and editions because generated explanatory prose had previously contained ancillary mistakes.

## Treat edits and sends as state transitions

Album members can arrive before the completed album event. A photo can change without its caption changing. Both cases require durable identity and version tracking so that delayed classification cannot publish stale results. Reconnection needs bounded catchup before readiness, while unrelated message content stays outside the application pipeline.

Sending has a different failure boundary. An immutable intent must precede a provider call; a lost or partial acknowledgement cannot safely be retried as though nothing happened. Review uncovered reservation starvation, protected-content leakage, incomplete album acknowledgement overclaims and stale photo caching. Focused regression checks retained those failures and qualified their corrections. Protected content required an attribution-and-link fallback rather than copying it.

A setup example with an invalid historical timestamp initially failed an activation guard. Correcting the example's timestamp preserved the production safeguard. Earlier enrollment also exposed a migration retry-budget assumption; the eventual successful enrollment did not erase that failed attempt.

## What the evidence established

The qualified work passed twenty-six shared checks and fourteen event-reader checks. Saved real examples exercised both caption-only and local image routes. Independent review preceded activation. One explicitly approved, clearly labelled saved-example photo was accepted by the messaging provider, after which future normal delivery was enabled. The rejected periodic candidate remained disabled.

Provider acceptance did not establish a physical phone notification, a naturally arriving listing, universal image recognition, real album delivery or long-term reliability. Those limits remained explicit at the activation checkpoint. State-preserving rollback and permanent unknown-send reservations protected against duplicate delivery without pretending ambiguous outcomes were successes.

This retrospective intentionally omits deployment configuration, accounts, source identities, internal topology and runnable operational commands. The transferable lesson is to narrow the decision to the owner's requested identity filter, then prove event durability and delivery acknowledgement separately.


## Follow-up on photo false positives

Two normal alerts contained confident but incorrect family matches. One post originally contained only a price. Another explicitly named a different card, but the narrow caption vocabulary let it fall through to image classification. Both errors reproduced on public versions of the source photos. The delivered attachments used different renditions.

The revised photo decision reads the printed identity lines without asking the model to choose from target names. A readable grading label takes priority over the card title. Matching supported names is a separate deterministic step, and missing evidence holds. The caption path also recognizes the previously missed non-target name. This reduces artwork confusion while retaining the original text route. Local transcription can still misread a label, and slab priority may miss a separate ungraded card in a mixed photo.

Thirty classifier checks, fourteen reader checks and a bounded real-image replay passed. Both reported photos were rejected, and saved readable positives still matched. The actual service was restarted, reached readiness and preserved the five existing delivery receipts. No new external test was sent. Natural post-change classification and phone presentation remain unverified.

A grading provider's certificate API rejected a request carrying a bearer token because access is limited to approved customers. Issuing a token did not establish API entitlement. Card identity from printed evidence or a catalog and verification of a specific certificate remain separate outcomes. Automated certificate verification was still pending at this checkpoint.

## Follow-up: English label OCR with conservative fallback

A small local comparison separated two tasks that had been treated as one. The lightweight English reader copied all nine English grading-label identities in the frozen sample but none of four Japanese card titles. The existing multimodal reader copied seven English identities and all four Japanese titles. The sample included paired and derived images, so these are fixture results, not population accuracy estimates. Larger document-reader variants completed no fixture before a bounded timeout and were not promoted; a memory limit alone did not establish successful fit.

The qualified route keeps caption matching first. CPU OCR can establish a positive only when a supported name and the surrounding year, grade and label appearance agree locally. Joined grading text and an observed abbreviated name receive narrow deterministic normalization. Non-target names, Japanese text, ambiguous evidence, large photos and worker failures retain the existing multimodal path. A partial scan never supplies a negative verdict. This avoids using a weak English-only reader to exclude Japanese listings.

The OCR runtime runs separately because loading it inside the constrained listener would exceed that listener's budget. Accepted service settings initially failed actual device and private-file isolation probes; that design was rejected. A restricted CPU container then passed direct boundary checks, bounded native-call termination, stopped-worker fallback and failure recovery. The listener has no availability dependency on the optional worker. Existing inference services retained their process identities and live health.

Fifty-six focused and existing regression checks passed. Thirteen complete original photos produced the expected identity sets: six bypassed multimodal inference with verified CPU evidence, while seven used the fallback. Previous bird and fire-card false positives were rejected, Japanese titles remained supported and an unreadable image remained uncertain. This is narrower evidence than perfect recognition or certificate authentication.

The live listener was activated after independent review, with fresh stopped-state backups and every existing delivery receipt preserved. Source selection, destination binding, push events and prior verdicts were unchanged; no historical replay or new external test message was introduced. A naturally arriving alert using the new OCR route, physical phone presentation, broad glare coverage and long-term reliability remain unverified at this checkpoint. Rollback preserves current receipts and restores only the owned reader change.
