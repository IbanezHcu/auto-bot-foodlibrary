# Architecture

Foodlibrary Hub is an isolated Next.js/Vinext application compiled to a Cloudflare Worker. It follows the existing Corporate Website's broad toolchain without sharing its repository, D1 database, R2 bucket, bindings, or deployment.

## Source of truth

- GitHub: public-safe source, migrations, tests, templates and documentation.
- D1 (`DB` binding, dedicated database): metadata, approved knowledge, workflow, analytics and audit records.
- R2 (`DOCUMENTS` binding, dedicated bucket): uploaded file bytes. D1 stores metadata and checksums.
- NAS: originals, approved exports, backups, handover and internal-only documentation.
- Local checkout: working copy only.

The first release uses deterministic search. `AI_MODE=off` is the default. Search permits only `published` records and applies visibility checks before scoring. Admin writes remain disabled until identity and server-side authorization are configured.

## Adapters

Database, storage, auth, AI, voice, document ingestion and future Google Drive integration are boundaries rather than hard-coded providers. Generative AI and voice are non-critical optional modules.
