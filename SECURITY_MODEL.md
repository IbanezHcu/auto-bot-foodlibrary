# Security model

The app is internal and must not be public. Authentication identifies a user; authorization is enforced server-side by role, department and record visibility. Roles are Super Admin, System Admin, Department Owner, Content Editor, Reviewer, Approver and Staff. Admin is fail-closed until a real identity provider and membership policy are configured.

Secrets belong in the deployment secret store or OS credential store, never Git or NAS plaintext. D1 and R2 are dedicated resources. Draft, archived and unauthorized records never enter search or AI context. Logs exclude secrets, document bodies and unnecessary personal data. Query analytics are anonymous/aggregated by default with proposed 90-day raw-query retention, subject to company approval.

Open risks: identity provider is not selected; NAS access is denied; production Cloudflare resources do not exist; department owners and data classification are unconfirmed. Therefore this repository is not production-ready.
