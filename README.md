# uDOS-themes

## Purpose

Public theme packs, token sets, and shell-facing visual assets for the uDOS family.

## Ownership

- themes and skins
- design tokens
- reusable shell presentation assets
- teachable styling examples

## Non-Goals

- runtime semantics
- provider transport
- private product branding ownership

## Spine

- `src/`
- `docs/`
- `tests/`
- `scripts/`
- `config/`
- `examples/`

## Local Development

Keep themes modular and portable across public repos.

## Family Relation

Themes provide presentation layers on top of Shell and related public surfaces.

## Activation

The v2 repo activation path is documented in `docs/activation.md`.
The `v2.0.1` theme bridge is documented in `docs/v2.0.1-theme-foundation.md`.

Run the current repo validation entrypoint with:

```bash
scripts/run-theme-checks.sh
```
