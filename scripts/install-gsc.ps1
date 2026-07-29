$ErrorActionPreference = "Stop"

$pluginServerRoot = Join-Path $env:USERPROFILE ".codex\mcp-servers"
$binRoot = Join-Path $pluginServerRoot "bin"
$repoRoot = Join-Path $pluginServerRoot "google-search-console-mcp"
$binaryPath = Join-Path $binRoot "gsc-mcp-go-windows-amd64.exe"

New-Item -ItemType Directory -Force -Path $pluginServerRoot | Out-Null
New-Item -ItemType Directory -Force -Path $binRoot | Out-Null

if (-not (Test-Path $repoRoot)) {
  git clone https://github.com/ncosentino/google-search-console-mcp $repoRoot
}

if (-not (Test-Path $binaryPath)) {
  $releaseUrl = "https://github.com/ncosentino/google-search-console-mcp/releases/latest/download/gsc-mcp-go-windows-amd64.exe"
  Invoke-WebRequest -Uri $releaseUrl -OutFile $binaryPath
}

& $binaryPath --help | Out-Null
Write-Host "GSC MCP ready at $binaryPath"
