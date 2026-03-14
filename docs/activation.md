# uDOS-themes Activation

## Purpose

This document marks the first active implementation tranche for
`uDOS-themes`.

The activation goal is to make public theme assets teachable, checkable, and
ready for implementation without broadening ownership beyond:

- public themes and skins
- design token sets
- reusable visual asset packs
- lightweight theme contract validation for this repo

## Activated Surfaces

- `src/` as the theme source and token lane
- `scripts/run-theme-checks.sh` as the repo validation entrypoint
- `tests/` as the theme contract validation lane
- `config/` as the checked-in theme config lane
- `examples/basic-theme.json` as the smallest theme contract example

## Current Validation Contract

Run:

```bash
scripts/run-theme-checks.sh
```

This command:

- verifies the required repo entry surfaces exist
- checks that the sample theme contract is structurally valid
- rejects private local-root path leakage in tracked repo docs and scripts

## Boundaries

This activation does not move ownership into `uDOS-themes` for:

- shell interaction behavior
- runtime semantics
- private product branding
- provider or transport ownership
