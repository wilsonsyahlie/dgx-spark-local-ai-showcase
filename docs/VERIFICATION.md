# Verification

## Public-snapshot checks

- [x] Required overview, architecture, journey, case-study, safety, and verification documents exist.
- [x] Relative documentation links resolve.
- [x] No production configuration, credentials, private content, paths, endpoints, raw logs, databases, backups, model artifacts, or identifiers are included.
- [x] Current live topology, current operational defects, and account/channel identifiers are omitted.
- [x] Git authorship uses the GitHub noreply address only.
- [x] The progression is a truthful reconstruction of reviewed milestones; public commit dates are not presented as original production activation dates.
- [x] Failed experiments, rollbacks, negative paths, and remaining publication limits are represented.

Run `./scripts/check_showcase.sh` before every publication.

## Deliberate limits

This repository does not provide a one-command deployment, production settings, or live
operational evidence. That omission is intentional: the goal is to demonstrate systems
thinking, troubleshooting, and verification without turning a portfolio into a map of a
private workstation.

The public commit sequence documents assembly of the reviewed engineering story. The
private evidence repository remains the authoritative detailed record and is not linked or
mirrored here.

