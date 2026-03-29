# Scripts

`scripts/` is the checked-in validation lane for `uDOS-themes`.

Current script surfaces include:

- `run-theme-checks.sh` for repo activation validation
- `smoke-adapters.mjs` for browser/TUI/workflow/publish/forms smoke coverage

Boundary rule:

- keep lightweight theme checks here
- keep behavior and runtime concerns in the owning repos
- keep contract validation aligned with the registries under `registry/`
