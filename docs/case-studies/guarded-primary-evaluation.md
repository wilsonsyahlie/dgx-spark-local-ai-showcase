# A deployed model can still fail its useful-work test

A local assistant received a requested primary-model replacement. The engineering question had two independent parts: could it operate safely through the existing application, and did it produce better useful work?

Deployment checks covered bounded startup resources, a verified ownership transition, streamed tool calls, cancellation, and preserved chat history. A smaller context budget and serialized generation were explicit tradeoffs. A small integration defect in memory attribution was corrected without changing unrelated application behavior.

The quality results did not justify claiming an upgrade. A small coding task passed fourteen of fifteen independent cases, but file input crashed after the generated program closed its stream too early. Its own tests had missed the command path. A graphics task produced a served page whose scene was blank in both desktop and phone browsers because its shader failed to compile.

The visual model then received actual reference frames and browser captures. It correctly recognized the missing scene and avoided pretending the screenshots proved working animation. That was useful image understanding, but it did not erase the generation failure. A visible canvas and unchanged pixels are weak evidence when nothing has rendered.

The lesson was to keep deployment acceptance, coding correctness, visual understanding, and artistic quality separate. Preserved failure artifacts made the result reviewable. No general speed or quality superiority was established, and long-running stability remained outside the observed test. This is a retrospective engineering account, not a reproducible deployment recipe.
