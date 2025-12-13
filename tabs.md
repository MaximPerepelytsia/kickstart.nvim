# Neovim Tabs Guide

## Overview

Tabs in Neovim are different from tabs in other editors. In Neovim, tabs are **containers for windows** (splits), not individual files. Each tab can contain multiple windows showing different files.

Think of tabs as workspaces:
- **Tab** = A workspace containing one or more windows
- **Window** = A viewport showing a buffer (file)
- **Buffer** = A file loaded in memory

## Opening Tabs

### Basic Commands
| Command | Description |
|---------|-------------|
| `:tabnew` or `:tabe` | Open a new empty tab |
| `:tabnew <file>` or `:tabe <file>` | Open a new tab with a specific file |
| `:tab split` | Split current window into a new tab |
| `:tabedit <file>` | Edit a file in a new tab |

### Examples
```vim
:tabe                    " Open new empty tab
:tabe main.go            " Open main.go in new tab
:tabe ~/.config/nvim/init.lua  " Open file with full path
```

## Navigating Between Tabs

### Keyboard Shortcuts
| Keymap | Mode | Description |
|--------|------|-------------|
| `gt` | Normal | Go to next tab |
| `gT` | Normal | Go to previous tab |
| `{count}gt` | Normal | Go to tab number {count} (e.g., `2gt` goes to tab 2) |
| `<C-PageDown>` | Normal | Go to next tab (alternative) |
| `<C-PageUp>` | Normal | Go to previous tab (alternative) |

### Commands
| Command | Description |
|---------|-------------|
| `:tabnext` or `:tabn` | Go to next tab |
| `:tabprevious` or `:tabp` | Go to previous tab |
| `:tabfirst` or `:tabfir` | Go to first tab |
| `:tablast` or `:tabl` | Go to last tab |
| `:tabrewind` or `:tabr` | Go to first tab (alternative) |
| `:{count}tabnext` | Go to tab number {count} |

### Examples
```vim
gt              " Next tab
gT              " Previous tab
3gt             " Go to tab 3
:tabn           " Next tab (command)
:tabp           " Previous tab (command)
:tabfirst       " First tab
:tablast        " Last tab
```

## Closing Tabs

| Command | Description |
|---------|-------------|
| `:tabclose` or `:tabc` | Close current tab |
| `:tabonly` or `:tabo` | Close all other tabs (keep only current) |
| `:q` | Close current tab (if it's the only window) |
| `:wq` | Save and close current tab |

### Examples
```vim
:tabc           " Close current tab
:tabclose       " Close current tab (full command)
:tabonly        " Close all other tabs
```

## Moving Tabs

| Command | Description |
|---------|-------------|
| `:tabmove` or `:tabm` | Move current tab to the end |
| `:tabmove {count}` | Move current tab to position {count} (0 = first) |
| `:tabmove +{count}` | Move tab {count} positions to the right |
| `:tabmove -{count}` | Move tab {count} positions to the left |

### Examples
```vim
:tabm           " Move current tab to the end
:tabm 0         " Move current tab to the beginning
:tabm 2         " Move current tab to position 2
:tabm +1        " Move tab one position to the right
:tabm -1        " Move tab one position to the left
```

## Working with Multiple Tabs

### Opening Multiple Files in Tabs
```vim
:tabe file1.txt
:tabe file2.txt
:tabe file3.txt
```

### Opening All Files Matching a Pattern
```vim
:args *.go      " Load all .go files into argument list
:argdo tabe %   " Open each file in a new tab
```

### Switching Between Tabs Quickly
- Use `gt` and `gT` for quick navigation
- Use `{count}gt` to jump directly to a specific tab number
- Use `:tabn` and `:tabp` if you prefer commands

## Tab Information

| Command | Description |
|---------|-------------|
| `:tabs` | List all tabs and their windows |
| `:tabs` | Show tab information in status line |

### Example Output
```
Tab page 1
  [No Name]
Tab page 2
  init.lua
  keymaps.lua
Tab page 3
  main.go
```

## Tab and Window Relationship

### Understanding the Hierarchy
```
Tab 1
  └── Window 1 (file1.txt)
  └── Window 2 (file2.txt) [split]
Tab 2
  └── Window 1 (file3.txt)
Tab 3
  └── Window 1 (file4.txt)
  └── Window 2 (file5.txt) [vsplit]
```

### Working with Windows in Tabs
- Each tab can have multiple windows (splits)
- Windows are independent within each tab
- Closing a tab closes all windows in that tab
- You can split windows within a tab using `:split` or `:vsplit`

## Common Workflows

### Workflow 1: Multiple Projects
```vim
:tabe project1/main.go
:tabe project2/main.py
:tabe project3/main.rs
" Use gt/gT to switch between projects
```

### Workflow 2: Related Files
```vim
:tabe header.h
:tabe implementation.c
" Keep related files in separate tabs
```

### Workflow 3: Quick File Comparison
```vim
:tabe file1.txt
:tabe file2.txt
" Switch between tabs to compare files
```

## Tips and Best Practices

1. **Use tabs for different contexts:**
   - One tab per project or feature
   - Keep related files together in the same tab with splits

2. **Quick navigation:**
   - Use `gt`/`gT` for sequential navigation
   - Use `{count}gt` to jump to a specific tab

3. **Tab organization:**
   - Use `:tabs` to see all open tabs
   - Use `:tabonly` to clean up and focus on one tab

4. **Closing tabs:**
   - `:tabc` closes the current tab
   - Make sure to save files before closing (`:w`)

5. **Moving tabs:**
   - Use `:tabm` to reorganize tabs
   - `:tabm 0` moves to the beginning

6. **Tab vs Window:**
   - Use **tabs** for different workspaces/projects
   - Use **windows** (splits) for viewing multiple files simultaneously
   - Combine both: multiple windows in each tab for complex workflows

7. **Buffer management:**
   - Remember: tabs contain windows, windows show buffers
   - A buffer can be shown in multiple windows/tabs
   - Use `:buffers` to see all loaded buffers

## Keyboard Shortcuts Summary

| Action | Shortcut |
|--------|----------|
| New tab | `:tabe` |
| Next tab | `gt` |
| Previous tab | `gT` |
| Go to tab N | `{N}gt` |
| Close tab | `:tabc` |
| Close other tabs | `:tabonly` |
| Move tab | `:tabm {pos}` |
| List tabs | `:tabs` |

## Advanced Usage

### Tab Completion
Neovim provides tab completion for tab commands:
```vim
:tab<Tab>       " Shows: tabclose, tabdo, tabedit, etc.
```

### Tab-specific Commands
```vim
:tabdo %s/old/new/g    " Execute command in all tabs
:tabdo w               " Save all files in all tabs
```

### Tab with Specific File Type
```vim
:tabe +setfiletype python main.py
```

## Troubleshooting

**Q: How do I see which tab I'm in?**
- A: Check the status line or use `:tabs` command

**Q: Can I have the same file open in multiple tabs?**
- A: Yes! The same buffer can be displayed in multiple tabs/windows

**Q: How do I close all tabs except the current one?**
- A: Use `:tabonly` or `:tabo`

**Q: How do I rename a tab?**
- A: Tabs don't have names in Neovim. They're identified by number and content

**Q: Can I have different colorschemes in different tabs?**
- A: No, colorscheme is global in Neovim

