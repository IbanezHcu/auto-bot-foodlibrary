# Foodlibrary Hub

Internal knowledge search and chat-style interface for Foodlibrary. Phase 1 is a deterministic Search MVP: AI is off, every result includes a citation, and missing information is never invented. All seed records are clearly marked TEST DATA.

## Local development

Requires Node.js 22.13+. Copy `.env.example` to a local `.env`, then run `npm ci`, `npm run dev`, `npm test`, `npm run typecheck`, `npm run lint`, and `npm run build`.

## Safety status

This repository is **not production-ready**. Admin writes are disabled until authentication and server-side role/department authorization exist. Dedicated D1 and R2 resources, private access protection, NAS access, real approved department content, backup/restore evidence, GitHub remote and deployment approval are pending. Do not deploy publicly.

## Main references

- `ARCHITECTURE.md`, `ADR-001-free-first-stack.md`, `DATA_FLOW.md`
- `SECURITY_MODEL.md`, `PRIVACY_GUIDE.md`, `DATA_DICTIONARY.md`
- `SEARCH_DESIGN.md`, `AI_RAG_PLAN.md`
- `BACKUP_POLICY.md`, `RESTORE_GUIDE.md`, `DISASTER_RECOVERY.md`
- `CONTENT_OWNER_GUIDE.md`, `DEPARTMENT_ONBOARDING.md`, `HANDOVER_CHECKLIST.md`
- `docs/FINAL_REPORT.md`

Git must contain no credentials, private employee data, uploaded files, production exports, private SOPs, or internal infrastructure paths. Runtime secrets belong in an approved secret store.
