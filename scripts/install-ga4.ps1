$ErrorActionPreference = "Stop"

$pluginServerRoot = Join-Path $env:USERPROFILE ".codex\mcp-servers"
$repoRoot = Join-Path $pluginServerRoot "google-analytics-mcp"
$venvRoot = Join-Path $pluginServerRoot "seo-google-suite-ga4-venv"
$pythonExe = Join-Path $venvRoot "Scripts\python.exe"
$serverExe = Join-Path $venvRoot "Scripts\analytics-mcp.exe"

New-Item -ItemType Directory -Force -Path $pluginServerRoot | Out-Null

if (-not (Test-Path $repoRoot)) {
  git clone https://github.com/googleanalytics/google-analytics-mcp $repoRoot
}

if (-not (Test-Path $pythonExe)) {
  py -m venv $venvRoot
}

& $pythonExe -m pip install --upgrade pip
& $pythonExe -m pip install google-analytics-mcp

if (-not (Test-Path $serverExe)) {
  throw "GA4 MCP executable was not created at $serverExe"
}

Write-Host "GA4 MCP ready at $serverExe"
