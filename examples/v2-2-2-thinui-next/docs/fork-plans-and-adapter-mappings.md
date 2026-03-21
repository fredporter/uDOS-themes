# Fork Plans and Adapter Mappings — v2.2.1

## Goal

Convert external visual libraries into stable uDOS-compatible theme and UI assets without letting third-party structures become runtime truth.

## Fork 1 — c64css3 → thinui-c64

### Source role

Retro C64 presentation library.

### uDOS target role

Thinui takeover and startup visual family.

### Refactor plan

1. fork upstream into a uDOS-managed vendor/fork path
2. extract colors, spacing, and typography into theme token layer
3. map core UI primitives into thinui slots:
   - screen
   - panel
   - menu list
   - action row
   - loader strip
   - status footer
4. replace hardcoded assumptions with manifest-driven configuration
5. bind Petme font and fallback chain
6. create low-motion / safe-mode variants

### Adapter output

- adapter id: `thinui.c64.v1`
- supported surfaces: `thinui`, `alpine`
- default font: `petme`
- loaders: `boot-grid`, `tape-stripe`, `drive-chunk`

## Fork 2 — svelte-notion-kit → wizard-notion

### Source role

Notion-like block and workspace rendering system.

### uDOS target role

Wizard browser GUI workflow, OK scheduling, task management, mission boards.

### Refactor plan

1. fork upstream into wizard-aligned component workspace
2. remove document-centric assumptions where they block workflow use
3. normalize components to wizard layouts:
   - task board
   - queue
   - schedule card
   - agent/provider card
   - notes block
   - roadmap list
4. bind all styling to uDOS tokens
5. keep browser-first delivery and avoid thinui coupling

### Adapter output

- adapter id: `wizard.notion.v1`
- supported surfaces: `wizard-browser`
- default family: `wizard-notion`
- component groups: `cards`, `boards`, `schedules`, `kanban`, `notes`

## Fork 3 — NES.css → thinui-nes-sonic

### Source role

NES-inspired presentation CSS framework.

### uDOS target role

Thinui utility panels and sonic-screwdriver graphical tools.

### Refactor plan

1. fork upstream into uDOS vendor/fork path
2. reduce novelty-heavy styling where it harms information density
3. create compact panel variants for operational tools
4. map into sonic utility panel structure
5. normalize focus, hover, selection, disabled, and warning states
6. provide controller-safe and keyboard-safe focus patterns

### Adapter output

- adapter id: `thinui.nes-sonic.v1`
- supported surfaces: `thinui`, `sonic-screwdriver`
- default loaders: `binder-pulse`, `sync-scan`
- default utility views: `tool-panel`, `status-card`, `selector-grid`

## Shared Adapter Rules

1. adapters expose capabilities, not implementation details
2. adapters map tokens and slots only
3. upstream class names must not leak into core contracts
4. each adapter must declare unsupported features explicitly
5. every adapter needs a minimal-safe fallback profile
