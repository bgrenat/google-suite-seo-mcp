---
name: google-credentials
description: Configure local Google Search Console and GA4 credentials for SEO Google Suite. Use when the user asks to connect, configure, add, or verify GSC or GA4 credentials.
---

# Configure Google credentials

On Windows, use the bundled PowerShell setup wizard:

```powershell
& "<plugin-root>\scripts\configure-google.ps1"
```

The wizard collects only local file paths and the non-secret Google Cloud project ID. It copies the JSON credentials to `%USERPROFILE%\.codex\secrets\google\`, updates the local MCP configuration, and never prints credential contents.

On macOS/Linux, use `./scripts/install-gsc.sh` and `./scripts/install-ga4.sh`, then export the three variables documented in `docs/INSTALLATION.md`. Credentials belong under `$HOME/.codex/secrets/google/`.

After it completes:

1. Run `check-auth.ps1` and report only structural success/failure.
2. Ask the user to restart Codex so MCP processes reload the environment.
3. Never request or echo private keys, client secrets, refresh tokens, or JSON contents in chat.

If the user does not yet have the JSON files, provide the links in `docs/GOOGLE_AUTH.md` and stop before collecting secrets.
