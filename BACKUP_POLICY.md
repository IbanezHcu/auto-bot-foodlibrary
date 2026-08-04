# Backup policy

Back up Git daily 01:00, D1 01:30, R2 incrementally 02:00 and approved knowledge 02:30. Verify Sundays 03:00, archive monthly on day 1 at 04:00, and conduct quarterly restores. Retain daily 30 days, weekly 12 weeks, monthly 12 months, major releases indefinitely; approved policy retention requires company approval.

Each run records timestamp, source, destination, counts, bytes, SHA-256/ETag, status, error and tool version. Use a server/NAS scheduler or internal self-hosted runner; a notebook is only a temporary agent. Never expose NAS, use bidirectional sync, `--delete`, or plaintext tokens.
