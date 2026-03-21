# Source

`src/` is the theme source and token lane for `uDOS-themes`.

Current source surfaces include:

- `theme-tokens.json` as the smallest checked-in theme contract
- `adapters/thinui/` for ThinUI runtime theme resolver and adapter hooks

Boundary rule:

- keep public tokens and theme contracts here
- keep shell behavior in `uDOS-shell`

ThinUI adapter responsibilities:

- resolve theme by `themeId`
- expose loader, font, and render token hooks
- provide theme-specific frame decoration without semantic state mutation
