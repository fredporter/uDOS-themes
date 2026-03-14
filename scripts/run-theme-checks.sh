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
require_file "$REPO_ROOT/src/shell-theme-map.json"
require_file "$REPO_ROOT/src/publishing-theme-map.json"
require_file "$REPO_ROOT/scripts/README.md"
require_file "$REPO_ROOT/tests/README.md"
require_file "$REPO_ROOT/config/README.md"
require_file "$REPO_ROOT/examples/README.md"
require_file "$REPO_ROOT/examples/basic-theme.json"
require_file "$REPO_ROOT/docs/v2.0.1-theme-foundation.md"

python3 - <<'PY'
import json
from pathlib import Path

repo_root = Path(".").resolve()
source = json.loads((repo_root / "src" / "theme-tokens.json").read_text(encoding="utf-8"))
example = json.loads((repo_root / "examples" / "basic-theme.json").read_text(encoding="utf-8"))
shell_map = json.loads((repo_root / "src" / "shell-theme-map.json").read_text(encoding="utf-8"))
publishing_map = json.loads((repo_root / "src" / "publishing-theme-map.json").read_text(encoding="utf-8"))

required = {"theme", "owner", "surface", "tokens"}
for name, payload in {"src/theme-tokens.json": source, "examples/basic-theme.json": example}.items():
    missing = sorted(required - payload.keys())
    if missing:
        raise SystemExit(f"{name} missing required fields: {missing}")
    if not isinstance(payload["tokens"], dict):
        raise SystemExit(f"{name} tokens must be an object")

for name, payload in {
    "src/shell-theme-map.json": shell_map,
    "src/publishing-theme-map.json": publishing_map,
}.items():
    if payload.get("version") != "v2.0.1":
        raise SystemExit(f"{name} version must be v2.0.1")
    if not isinstance(payload.get("themes"), list) or not payload["themes"]:
        raise SystemExit(f"{name} themes must be a non-empty array")
    for theme in payload["themes"]:
        if not {"theme", "adapter", "tokens"} <= theme.keys():
            raise SystemExit(f"{name} theme entry missing required fields: {theme}")
        if not isinstance(theme["tokens"], dict):
            raise SystemExit(f"{name} theme tokens must be an object")
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
