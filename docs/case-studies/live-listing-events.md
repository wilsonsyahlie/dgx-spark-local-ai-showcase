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
