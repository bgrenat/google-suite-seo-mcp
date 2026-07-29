# Security policy

Never commit service-account JSON, OAuth JSON, private keys, refresh tokens, API keys, or `.env` files. Credentials should remain in the local user profile or an approved secret manager.

The setup script copies credential files locally and does not log their contents. Verify `git status` before every commit.

Do not open a public issue containing credentials or exploit details. Report vulnerabilities through [powehi.eu](https://powehi.eu) with the affected version and a minimal reproduction.

Issues in upstream MCP servers should also be reported to their respective maintainers:

- [Google Search Console MCP](https://github.com/ncosentino/google-search-console-mcp)
- [Google Analytics MCP](https://github.com/googleanalytics/google-analytics-mcp)
