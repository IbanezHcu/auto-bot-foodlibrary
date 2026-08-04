# ADR-001: Free-first stack

Status: Accepted for Phase 1, 2026-08-04

Use Next.js + TypeScript + Tailwind through Vinext, a dedicated Cloudflare Worker, dedicated D1 and R2 resources, and deterministic keyword/phrase/synonym search. This aligns with the audited Corporate Website stack while keeping production isolation. AI is off by default; no fine-tuning, embeddings or paid dependency is required.

Cloudflare free-tier quotas and product limits change. Exact current quotas are **Unknown pending verification against the account plan and current official documentation**; they must be checked before deployment. Deployment requires explicit approval.
