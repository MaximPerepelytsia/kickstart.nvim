# Neovim Keymap Reference

## Leader Key
- **Leader**: `<Space>`

## General Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>pv` | Normal | Open file explorer (Ex command) |

## Telescope (Fuzzy Finder)
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>pf` | Normal | Find files in project |
| `<C-p>` | Normal | Find files in git repository |
| `<leader>ps` | Normal | Search for text in project (grep) |

## Harpoon (File Navigation)
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>a` | Normal | Add current file to Harpoon |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<C-h>` | Normal | Navigate to Harpoon file 1 |
| `<C-t>` | Normal | Navigate to Harpoon file 2 |
| `<C-n>` | Normal | Navigate to Harpoon file 3 |
| `<C-s>` | Normal | Navigate to Harpoon file 4 |

## Undotree
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>u` | Normal | Toggle undo tree |

## Git (Fugitive)
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>gs` | Normal | Open Git status |

## LSP (Language Server Protocol)
| Keymap        | Mode   | Description               |
| ------------- | ------ | ------------------------- |
| `gd`          | Normal | Go to definition          |
| `K`           | Normal | Show hover information    |
| `<leader>vws` | Normal | Search workspace symbols  |
| `<leader>vd`  | Normal | Open diagnostic float     |
| `[d`          | Normal | Go to previous diagnostic |
| `]d`          | Normal | Go to next diagnostic     |
| `<leader>vca` | Normal | Code action               |
| `<leader>vrr` | Normal | Show references           |
| `<leader>vrn` | Normal | Rename symbol             |
| `<C-h>`       | Insert | Show signature help       |

## Completion (nvim-cmp)
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-p>` | Insert | Select previous completion item |
| `<C-n>` | Insert | Select next completion item |
| `<C-y>` | Insert | Confirm completion selection |
| `<C-Space>` | Insert | Trigger completion menu |
