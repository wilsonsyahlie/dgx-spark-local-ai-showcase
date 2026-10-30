# Showing the part that is available

A media request portal still displayed a series as requested even though several episodes were already in its library. The underlying identity check was too broad: it waited for identifiers for every episode, including future episodes, before admitting any availability result.

The correction separates verified presence from unknown future metadata. It keeps the full catalogue count and counts a file only when its current identity is positively matched. Unidentified episodes remain uncounted. That supports an honest partial label without turning an unfinished season into a completed request.

A second timing issue mattered. An older scanner could temporarily infer full availability from an incomplete denominator before the stricter check ran. The corrected path uses the catalogue denominator and the actual persisted prior state, rather than treating that temporary mutation as trusted history. Existing completion checks still require the requested season to be fully accounted for.

The replacement was checked with isolated identity, scheduling and database tests, including the real scanner and conditional writer. The tests distinguished partial availability, prior known availability, malformed identities and genuine completion. The existing worker retained its fair admission and finite progress limits; the solution did not add another background retry service.

The general lesson is that unknown metadata should not erase separately verified evidence. Partial knowledge can support a bounded result, provided the system keeps its denominator, uncertainty and completion authority distinct. A correct label still does not establish playback quality or subtitle timing.

The deployed change was then checked through a normal scheduled reconciliation and the authenticated phone interface. The series changed to partially available and kept that label after refresh, while unfinished episodes remained monitored. Protected history was preserved and existing scheduling resumed without another repair loop.
