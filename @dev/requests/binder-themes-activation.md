# Request: `#binder/themes-activation`

- title: Activate `uDOS-themes` as the next Tranche 4 repo-facing implementation surface
- requested by: v2 roadmap workflow
- owning repo or stream: `uDOS-themes`
- binder: `#binder/themes-activation`
- summary: Add the first repo-level activation and validation flow for `uDOS-themes` while keeping ownership inside public themes, token sets, and reusable visual assets.
- acceptance criteria:
  - `uDOS-themes` exposes an activation doc
  - `uDOS-themes` exposes a local validation command under `scripts/`
  - `uDOS-themes` includes a minimal theme contract example
  - repo entry surfaces point to the activation flow
- dependencies:
  - `#binder/core-contract-enforcement`
  - `#binder/uhome-empire-activation`
  - `uDOS-themes` public repo spine and theme-facing docs
- boundary questions:
  - activation should stay inside theme ownership
  - shell behavior remains in `uDOS-shell`
  - private branding remains outside this repo
- due or milestone: v2 roadmap tranche 4

## Binder Fields

- state: `completed`
- owner: `uDOS-themes`
- dependent repos:
  - `uDOS-dev`
- blocked by:
  - none
- target branch: `develop`
- objective:
  - make `uDOS-themes` runnable and teachable without broadening its ownership boundary
- promotion criteria:
  - themes activation docs, example, and validation entrypoint are committed
  - roadmap ledger reflects `uDOS-themes` as the active repo-activation binder
- files or areas touched:
  - `uDOS-themes/docs`
  - `uDOS-themes/src`
  - `uDOS-themes/scripts`
  - `uDOS-themes/tests`
  - `uDOS-themes/config`
  - `uDOS-themes/examples`
  - `uDOS-dev/@dev`

## Lifecycle Checklist

- [x] Open
- [x] Hand off
- [x] Advance
- [x] Review
- [x] Commit
- [x] Complete
- [x] Compile
- [x] Promote
