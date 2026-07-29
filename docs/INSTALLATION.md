# Installation

## Requirements

- Windows PowerShell;
- Git;
- Python 3.11+ for the GA4 MCP server;
- a Google Cloud project;
- access to the relevant Search Console and GA4 properties.

## Install the servers

```powershell
.\scripts\install-gsc.ps1
.\scripts\install-ga4.ps1
```

These scripts install the community upstream servers locally. They do not create or transmit Google credentials.

## Configure credentials in Codex

Ask Codex:

```text
Configure SEO Google Suite credentials
```

The setup flow accepts local JSON paths and the Google Cloud project ID. It copies credentials locally without printing their contents.

## Configure credentials in other editors

Set these variables in the environment used to launch Cursor, VS Code, or Claude Code:

```powershell
$env:GOOGLE_SERVICE_ACCOUNT_FILE = "$env:USERPROFILE\.codex\secrets\google\gsc-service-account.json"
$env:GOOGLE_APPLICATION_CREDENTIALS = "$env:USERPROFILE\.codex\secrets\google\ga4-credentials.json"
$env:GOOGLE_PROJECT_ID = "your-gcp-project-id"
```

See [GOOGLE_AUTH.md](GOOGLE_AUTH.md) for the official Google links and [COMPATIBILITY.md](COMPATIBILITY.md) for editor-specific setup.

## Verify

```powershell
.\scripts\check-auth.ps1
```

This checks JSON structure only; it does not replace a live API permission test.

## CrUX

```powershell
node .\scripts\crux-query.mjs https://example.com
```

Public unauthenticated requests are supported when quota allows. Set `CRUX_API_KEY` for quota-managed access.
