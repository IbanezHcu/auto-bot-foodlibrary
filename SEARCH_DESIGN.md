# Search design

Search normalizes Unicode, case, zero-width characters, punctuation and whitespace. It expands only reviewed synonym groups, scores exact title, phrase, keyword, summary and content matches, then applies conservative one-edit typo support to longer keywords. Confidence levels are `exact`, `strong`, `related`, or UI-level `no_match`.

Mandatory preconditions are `status=published` and visibility allowed for the current user. Department/category filtering precedes scoring. Results always expose source, owner, version and update date. No-match queries enter the unanswered workflow; the engine never composes an answer.
