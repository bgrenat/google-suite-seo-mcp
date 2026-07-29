#!/usr/bin/env bash
set -euo pipefail
secret_root="${CODEX_SECRETS_DIR:-${HOME}/.codex/secrets/google}"
python3 - "${secret_root}" <<'PY'
import json, pathlib, sys
root = pathlib.Path(sys.argv[1])
def load(name):
    path = root / name
    if not path.is_file():
        raise SystemExit(f"Missing {path}")
    try:
        return json.loads(path.read_text())
    except json.JSONDecodeError as error:
        raise SystemExit(f"Invalid JSON in {path}: {error}")
gsc = load("gsc-service-account.json")
ga4 = load("ga4-credentials.json")
if not {"client_email", "private_key"} <= gsc.keys():
    raise SystemExit("GSC JSON is missing required keys")
valid_ga4 = (ga4.get("type") == "service_account" and {"client_email", "private_key"} <= ga4.keys()) or {"client_id", "client_secret"} <= ga4.keys()
if not valid_ga4:
    raise SystemExit("GA4 JSON is neither service-account nor OAuth client JSON")
print("Google auth files look structurally valid.")
PY
