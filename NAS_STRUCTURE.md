# NAS structure deployment
The required tree is encoded in `scripts/nas/Initialize-NasStructure.ps1`. Run with `-WhatIf`, review every target, then run without it using an approved account. It creates missing directories only and never deletes or moves content.

Audit 2026-08-04: access denied to the configured share. No NAS mutation was attempted. Internal start-here/system/recovery documents must be installed after access is granted; this Git copy intentionally contains no internal IP/path.
