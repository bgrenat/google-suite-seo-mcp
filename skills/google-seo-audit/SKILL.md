---
name: google-seo-audit
description: Use Google Search Console, GA4, and CrUX evidence for SEO audits from Codex.
---

# Google SEO Audit

Use this skill when the user asks for Google-backed SEO evidence, especially GSC queries, GA4 performance context, or CrUX field data.

## Evidence Order

1. Confirm credentials with `scripts/check-auth.ps1`.
2. Use GSC MCP for indexed/search performance evidence.
3. Use GA4 MCP for acquisition and engagement context.
4. Use `scripts/crux-query.mjs` for origin-level CrUX field data.
5. Keep source/build/live/GSC/GA4/CrUX evidence separate in the final report.

## Default Site

For `world-models.io`, default to:

- origin: `https://world-models.io`
- GSC property: `sc-domain:world-models.io` when available, otherwise the URL-prefix property
- GA4 property: ask the user only if it cannot be discovered from GA4 MCP

## Safety

Never print private keys, refresh tokens, client secrets, or full credential JSON contents. Report only whether required files and keys are present.
