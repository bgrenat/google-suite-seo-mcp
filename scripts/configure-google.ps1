$ErrorActionPreference = "Stop"

$secretRoot = Join-Path $env:USERPROFILE ".codex\secrets\google"
$pluginRoot = Split-Path -Parent $PSScriptRoot
$mcpPath = Join-Path $pluginRoot ".mcp.json"

New-Item -ItemType Directory -Force -Path $secretRoot | Out-Null

function Read-ExistingPath([string]$Prompt, [string]$Default) {
  $value = Read-Host "$Prompt [$Default]"
  if ([string]::IsNullOrWhiteSpace($value)) { return $Default }
  return $value.Trim('"')
}

$gscSource = Read-ExistingPath "Path to the GSC service-account JSON" ""
$ga4Source = Read-ExistingPath "Path to the GA4 OAuth/service-account JSON" ""
$projectId = Read-Host "Google Cloud project ID (for GA4)"

if (-not (Test-Path -LiteralPath $gscSource -PathType Leaf)) { throw "GSC JSON not found: $gscSource" }
if (-not (Test-Path -LiteralPath $ga4Source -PathType Leaf)) { throw "GA4 JSON not found: $ga4Source" }
if ([string]::IsNullOrWhiteSpace($projectId)) { throw "Google Cloud project ID is required." }

$gscTarget = Join-Path $secretRoot "gsc-service-account.json"
$ga4Target = Join-Path $secretRoot "ga4-credentials.json"
Copy-Item -LiteralPath $gscSource -Destination $gscTarget -Force
Copy-Item -LiteralPath $ga4Source -Destination $ga4Target -Force

$mcp = Get-Content -Raw $mcpPath | ConvertFrom-Json
$mcp.mcpServers.google_search_console.env.GOOGLE_SERVICE_ACCOUNT_FILE = $gscTarget
$mcp.mcpServers.google_analytics.env.GOOGLE_APPLICATION_CREDENTIALS = $ga4Target
$mcp.mcpServers.google_analytics.env.GOOGLE_PROJECT_ID = $projectId
$mcp | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $mcpPath

Write-Host "Google credentials configured locally. Run check-auth.ps1, then restart Codex."
