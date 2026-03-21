# thinui adapters

This adapter lane maps theme assets into a stable ThinUI render contract.

Responsibilities:

- resolve a theme from `themeId`
- expose loader frames, font information, and render tokens
- provide theme-aware frame rendering while preserving ThinUI semantics
- provide a low-resource safe fallback for recovery mode

Boundary rule:

- appearance and tokens live here
- semantic state mutation never lives here
