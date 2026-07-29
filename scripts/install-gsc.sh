#!/usr/bin/env bash
set -euo pipefail
root="${XDG_DATA_HOME:-${HOME}/.local/share}/seo-google-suite/mcp-servers"
mkdir -p "$root" "$HOME/.local/bin"
case "$(uname -s):$(uname -m)" in
  Linux:x86_64) asset="gsc-mcp-go-linux-amd64";; Linux:aarch64|Linux:arm64) asset="gsc-mcp-go-linux-arm64";;
  Darwin:x86_64) asset="gsc-mcp-go-darwin-amd64";; Darwin:arm64) asset="gsc-mcp-go-darwin-arm64";;
  *) echo "Unsupported platform; set GSC_MCP_RELEASE_ASSET." >&2; exit 1;;
esac
asset="${GSC_MCP_RELEASE_ASSET:-$asset}"
command -v curl >/dev/null || { echo "curl is required" >&2; exit 1; }
curl -fsSL "https://github.com/ncosentino/google-search-console-mcp/releases/latest/download/$asset" -o "$HOME/.local/bin/gsc-mcp"
chmod +x "$HOME/.local/bin/gsc-mcp"
echo "GSC MCP ready at $HOME/.local/bin/gsc-mcp"
