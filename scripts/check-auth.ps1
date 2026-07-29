$ErrorActionPreference = "Stop"

$secretRoot = Join-Path $env:USERPROFILE ".codex\secrets\google"
$gscJson = Join-Path $secretRoot "gsc-service-account.json"
$ga4Json = Join-Path $secretRoot "ga4-credentials.json"

New-Item -ItemType Directory -Force -Path $secretRoot | Out-Null

function Test-JsonFile {
  param(
    [string]$Path,
    [string[]]$RequiredKeys
  )

  if (-not (Test-Path $Path)) {
    Write-Warning "Missing $Path"
    return $false
  }

  $json = Get-Content -Raw $Path | ConvertFrom-Json
  foreach ($key in $RequiredKeys) {
    if (-not ($json.PSObject.Properties.Name -contains $key)) {
      Write-Warning "$Path is missing key: $key"
      return $false
    }
  }

  Write-Host "OK $Path"
  return $true
}

$gscOk = Test-JsonFile -Path $gscJson -RequiredKeys @("client_email", "private_key")
$ga4Ok = $false
if (Test-Path $ga4Json) {
  $ga4 = Get-Content -Raw $ga4Json | ConvertFrom-Json
  $isServiceAccount = ($ga4.type -eq "service_account" -and
    $ga4.PSObject.Properties.Name -contains "client_email" -and
    $ga4.PSObject.Properties.Name -contains "private_key")
  $isOAuthClient = ($ga4.PSObject.Properties.Name -contains "client_id" -and
    $ga4.PSObject.Properties.Name -contains "client_secret")

  if ($isServiceAccount -or $isOAuthClient) {
    Write-Host "OK $ga4Json"
    $ga4Ok = $true
  } else {
    Write-Warning "$ga4Json is neither a service-account JSON nor an OAuth client JSON"
  }
} else {
  Write-Warning "Missing $ga4Json"
}

if (-not $gscOk -or -not $ga4Ok) {
  throw "Google auth is incomplete. See docs\GOOGLE_AUTH.md."
}

Write-Host "Google auth files look structurally valid."
