# AI/RAG plan

Modes: `off` (default), `cloudflare`, `ollama`, `openai_future`. Deterministic search is always the fallback. Provider adapters accept authorized chunks only and return answer, source IDs, provider, model, latency and usage—never secrets.

System rule: “ตอบจากข้อมูลอ้างอิงที่ระบบให้เท่านั้น ห้ามแต่งนโยบาย ขั้นตอน วันที่ ชื่อบุคคล หรือแบบฟอร์ม หากข้อมูลไม่เพียงพอให้แจ้งว่าไม่พบข้อมูลที่ยืนยันได้ แสดงแหล่งข้อมูลและวันที่อัปเดตทุกครั้ง”

Before enablement: approve provider/privacy, injection and leakage tests, per-user limits, budget ceiling, citation validation and an emergency off switch.
