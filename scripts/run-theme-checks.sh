#!/usr/bin/env bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

require_file() {
  if [ ! -f "$1" ]; then
    echo "missing required file: $1" >&2
    exit 1
  fi
}

cd "$REPO_ROOT"

require_file "$REPO_ROOT/README.md"
require_file "$REPO_ROOT/docs/architecture.md"
require_file "$REPO_ROOT/docs/boundary.md"
require_file "$REPO_ROOT/docs/getting-started.md"
require_file "$REPO_ROOT/docs/examples.md"
require_file "$REPO_ROOT/docs/activation.md"
require_file "$REPO_ROOT/src/README.md"
require_file "$REPO_ROOT/src/theme-tokens.json"
require_file "$REPO_ROOT/scripts/README.md"
require_file "$REPO_ROOT/tests/README.md"
require_file "$REPO_ROOT/config/README.md"
require_file "$REPO_ROOT/examples/README.md"
require_file "$REPO_ROOT/examples/basic-theme.json"

python3 - <<'PY'
import json
from pathlib import Path

repo_root = Path(".").resolve()
source = json.loads((repo_root / "src" / "theme-tokens.json").read_text(encoding="utf-8"))
example = json.loads((repo_root / "examples" / "basic-theme.json").read_text(encoding="utf-8"))

required = {"theme", "owner", "surface", "tokens"}
for name, payload in {"src/theme-tokens.json": source, "examples/basic-theme.json": example}.items():
    missing = sorted(required - payload.keys())
    if missing:
        raise SystemExit(f"{name} missing required fields: {missing}")
    if not isinstance(payload["tokens"], dict):
        raise SystemExit(f"{name} tokens must be an object")
PY

if rg -n '/Users/fredbook/Code|~/Users/fredbook/Code' \
  "$REPO_ROOT/README.md" \
  "$REPO_ROOT/docs" \
  "$REPO_ROOT/src" \
  "$REPO_ROOT/tests" \
  "$REPO_ROOT/examples" \
  "$REPO_ROOT/config"; then
  echo "private local-root reference found in uDOS-themes" >&2
  exit 1
fi

echo "uDOS-themes checks passed"
