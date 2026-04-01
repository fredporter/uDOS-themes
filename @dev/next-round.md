# Themes Next Round

## Target Round

Follow-on work after **cursor-06** closure (ongoing engineering, not a blocking lane):

## Completed in cursor-06 (baseline)

- Display modes, token standard, step-form rules, registry plan, integration plan docs
- Skin loader, primitive map, GTX JSON + forms adapter, Node adapter smokes
- Workspace web token load + sync script; ThinUI bridge + Shell TUI parity note
- Reader hub: `uDOS-docs/docs/themes-and-display-modes.md`

## Optional follow-up (phases C–E)

- **ThinUI hydration:** **phase-C tranche 1 done** — ThinUI resolver now accepts
  thinui-safe skin ids (`skin:<id>` and mirrored ids such as `sonic-boot`,
  `alpine-safe`) and maps them to base thinui theme ids without changing runtime
  loop ownership. Keep deeper token/loader metadata hydration optional.
- **Tailwind Prose preset:** **phase-E tranche 1 done** — shared prose class
  contract now lives at `src/adapters/publish/tailwind-prose-preset.json` and
  syncs to workspace via `scripts/sync-publish-prose-preset-to-workspace.sh`.
  Optional package-level Tailwind preset remains future work.
- **Wizard / workflow:** **phase-D tranche 1 done** — canonical GTX step-id to
  workflow task-id map now tracked in
  `src/adapters/workflow/gtx-step-task-map.json`. Future lane: consume map
  directly in Wizard workflow surfaces.
- **Shell CLI demo:** optional wrapper calling themes `renderTuiFormStep` for the canonical JSON.

## Exit Evidence (cursor-06)

Satisfied per `@dev/notes/rounds/cursor-06-themes-display-modes-2026-04-01.md`.

## Family index (Workspace 08)

Post-06 adapter work is listed under **Post-08 engineering hooks** in
**`uDOS-dev`** `@dev/notes/reports/family-duplication-and-pathway-candidates-2026-04-01.md`.
