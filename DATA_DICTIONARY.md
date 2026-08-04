# Data dictionary

The canonical executable model is `db/schema.ts`. Status values are `draft`, `in_review`, `approved`, `published`, `archived`. Visibility values are `all_staff`, `department`, `manager`, `admin`, `restricted`. Core entities: departments, categories, knowledge items/keywords/synonyms, documents, announcements, calendar items, contacts, queries, unanswered queries, feedback, audit logs and backup runs. No password or secret field is permitted.
