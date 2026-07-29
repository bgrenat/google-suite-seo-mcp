# Editor compatibility

SEO Google Suite uses the standard MCP stdio transport and can be used from Codex, Claude Code, Cursor, and VS Code.

The client configuration files are templates. MCP executables must be on `PATH`, or their commands must be replaced with local absolute paths. Credential values are supplied only by the local environment. Windows, macOS (Intel/Apple Silicon), and Linux are supported; the GSC release asset can be overridden with `GSC_MCP_RELEASE_ASSET` if an upstream asset is renamed.

## Codex

The plugin manifest loads `.mcp.json` automatically. Install the servers with the scripts in `scripts/`, configure credentials through the Codex skill, then restart Codex.

## Claude Code

Claude Code reads the root `.mcp.json`. Ensure `gsc-mcp` and `analytics-mcp` are available on `PATH`, or replace the `command` values with absolute executable paths. Set the three Google environment variables in the shell that launches Claude Code. The root file may contain machine-specific paths after local setup; do not copy those paths to another machine.

## Cursor

Cursor reads `.cursor/mcp.json`. Configure `GOOGLE_SERVICE_ACCOUNT_FILE`, `GOOGLE_APPLICATION_CREDENTIALS`, and `GOOGLE_PROJECT_ID` in the shell that launches Cursor, and ensure both MCP executables are on `PATH`.

## VS Code

VS Code reads `.vscode/mcp.json` when MCP support is enabled. The configuration uses VS Code's `${env:NAME}` syntax and the same three environment variables.

## Shared installation

```powershell
.\scripts\install-gsc.ps1
.\scripts\install-ga4.ps1
```

macOS/Linux:

```bash
./scripts/install-gsc.sh
./scripts/install-ga4.sh
```

For non-Codex clients, expose the resulting executables on `PATH` or replace the client-specific `command` values with absolute paths. Never commit credential JSON files.
