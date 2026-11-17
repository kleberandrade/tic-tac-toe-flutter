# Modernization log

- Inspected clean `master` at `4d7f518`; no local AGENTS.md. Original app used Dart 2.7, removed Flutter buttons, UI-owned mutable rules, and an unrelated counter test.
- Preserved original tutorial, classroom challenges, attribution and MIT text in `original-project.md`.
- Selected isolated Flutter 3.41.9 / Dart 3.11.5 to avoid modifying the shared SDK. Updated manifest, removed unused Cupertino dependency and enabled Flutter lints.
- TDD: new domain tests initially failed because the domain did not exist. Implemented guarded moves, all eight winning lines, turn alternation, immutable board views, session scores, separate round/score reset and deterministic casual computer play. Corrected test fixtures that accidentally let X win before O. All 20 domain tests passed.
- `crapper`, `dryer`, and `mutator` are installed, but their documented language lists exclude Dart. No CRAP, duplication or mutation score is claimed.
