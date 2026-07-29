# Contributing

Contributions are welcome through [GitHub](https://github.com/bgrenat/google-suite-seo-mcp).

Before submitting a change:

1. Keep credentials and machine-specific paths out of tracked files.
2. Preserve upstream attribution and license notices.
3. Update the French and English documentation when behavior changes.
4. Validate JSON files and the plugin manifest.

```powershell
$files = @('.mcp.json', '.cursor/mcp.json', '.vscode/mcp.json', '.codex-plugin/plugin.json')
foreach ($file in $files) { Get-Content -Raw $file | ConvertFrom-Json | Out-Null }
python $env:USERPROFILE\.codex\skills\.system\plugin-creator\scripts\validate_plugin.py .
```

Pull requests should describe affected editors, credential behavior, and verification performed. Do not include generated credentials or local runtime directories.
