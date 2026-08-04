# Data flow

1. Department Owner places an original in the department's `04_FOR_REVIEW` NAS folder.
2. Content Editor records metadata; bytes are copied to R2 and checksum stored in D1.
3. Reviewer and Approver move Draft → Review → Approved → Published. Every transition writes an audit event.
4. Staff query is normalized; server filters visibility and `published` status, expands approved synonyms, scores title/keywords/summary/content, and returns citations.
5. No-match queries are aggregated with minimal user data. Feedback links to the query record.
6. Approved snapshots, D1 exports, R2 manifests and reports flow one-way to NAS backups. No `--delete` or bidirectional sync.

AI, when enabled later, receives only authorized retrieved chunks and must return source IDs. Insufficient context returns “ไม่พบข้อมูลที่ยืนยันได้”.
