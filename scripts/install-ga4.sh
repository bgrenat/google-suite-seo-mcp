#!/usr/bin/env bash
set -euo pipefail
root="${XDG_DATA_HOME:-${HOME}/.local/share}/seo-google-suite/mcp-servers"
venv="${root}/seo-google-suite-ga4-venv"
python="${PYTHON_BIN:-python3}"
command -v "$python" >/dev/null || { echo "$python is required" >&2; exit 1; }
mkdir -p "$root" "$HOME/.local/bin"
"$python" -m venv "$venv"
"$venv/bin/python" -m pip install --upgrade pip
"$venv/bin/python" -m pip install google-analytics-mcp
ln -sf "$venv/bin/analytics-mcp" "$HOME/.local/bin/analytics-mcp"
echo "GA4 MCP ready. Ensure $HOME/.local/bin is on PATH."
