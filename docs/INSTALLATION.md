# Installation

## Requirements

- Windows PowerShell, macOS, or Linux;
- Git;
- Python 3.11+ for the GA4 MCP server;
- a Google Cloud project;
- access to the relevant Search Console and GA4 properties.

## Install the servers

```powershell
.\scripts\install-gsc.ps1
.\scripts\install-ga4.ps1
```

On macOS/Linux, use the POSIX scripts from a terminal:

```bash
chmod +x scripts/install-gsc.sh scripts/install-ga4.sh
./scripts/install-gsc.sh
./scripts/install-ga4.sh
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

On macOS/Linux:

```bash
export GOOGLE_SERVICE_ACCOUNT_FILE="$HOME/.codex/secrets/google/gsc-service-account.json"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.codex/secrets/google/ga4-credentials.json"
export GOOGLE_PROJECT_ID="your-gcp-project-id"
```

See [GOOGLE_AUTH.md](GOOGLE_AUTH.md) for the official Google links and [COMPATIBILITY.md](COMPATIBILITY.md) for editor-specific setup.

## Verify

```powershell
.\scripts\check-auth.ps1
```

On macOS/Linux, run `./scripts/check-auth.sh` (Python 3 is required).

This checks JSON structure only; it does not replace a live API permission test.

## Configuration files

- `.mcp.json`: Codex and Claude Code configuration;
- `.cursor/mcp.json`: Cursor configuration template;
- `.vscode/mcp.json`: VS Code configuration template.

The Cursor and VS Code templates use executable names and environment-variable placeholders. The Codex/Claude file may be rewritten locally with absolute paths.

## CrUX

```powershell
node .\scripts\crux-query.mjs https://example.com
```

Public unauthenticated requests are supported when quota allows. Set `CRUX_API_KEY` for quota-managed access.
