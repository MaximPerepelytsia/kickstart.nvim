# Neovim Keymap Reference

## Leader Key
- **Leader**: `<Space>`

## General Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>pv` | Normal | Open file explorer (Ex command) |

## Scrolling
| Keymap | Mode | Description |
|--------|------|-------------|
| `<PageUp>` / `<C-b>` | Normal | Scroll up one screen (Page Up) |
| `<PageDown>` / `<C-f>` | Normal | Scroll down one screen (Page Down) |
| `<C-u>` | Normal | Scroll up half a screen |
| `<C-d>` | Normal | Scroll down half a screen |
| `<C-y>` | Normal | Scroll up one line |
| `<C-e>` | Normal | Scroll down one line |
| `<ScrollWheelUp>` | Normal | Scroll up (mouse wheel) |
| `<ScrollWheelDown>` | Normal | Scroll down (mouse wheel) |

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

### Code Navigation
| Keymap        | Mode   | Description               |
| ------------- | ------ | ------------------------- |
| `<C-gd>`      | Normal | Go to definition (where function/variable is defined) |
| `<C-gD>`      | Normal | Go to declaration (header/interface declaration) |
| `grr`         | Normal | Find all references (show all usages) |
| `gri`         | Normal | Go to implementation (where abstract type is implemented) |
| `grt`         | Normal | Go to type definition |
| `gO`          | Normal | Open document symbols (fuzzy find symbols in current file) |
| `gW`          | Normal | Open workspace symbols (fuzzy find symbols in project) |
| `K`           | Normal | Show hover information (documentation) |
| `<C-h>`       | Insert | Show signature help (function parameters) |

### Code Actions
| Keymap        | Mode   | Description               |
| ------------- | ------ | ------------------------- |
| `gra`         | Normal | Code action (quick fixes, refactorings) |
| `grn`         | Normal | Rename symbol (rename variable/function) |
| `<leader>th`  | Normal | Toggle inlay hints (if supported by LSP) |

### Diagnostics
| Keymap        | Mode   | Description               |
| ------------- | ------ | ------------------------- |
| `<leader>vd`  | Normal | Open diagnostic float     |
| `[d`          | Normal | Go to previous diagnostic |
| `]d`          | Normal | Go to next diagnostic     |

### How to Navigate to Function Declaration/Definition

1. **Go to Definition:**
   - Place your cursor on a function name (or any symbol)
   - Press `<C-gd>` to jump to where it's defined
   - This opens the definition in the current window
   - Use `<C-t>` to jump back to your previous location

2. **Go to Declaration:**
   - Place your cursor on a function name
   - Press `<C-gD>` to jump to its declaration (useful for C/C++ headers)
   - Declaration is different from definition (declaration = interface, definition = implementation)

3. **Find All References:**
   - Place your cursor on a function name
   - Press `grr` to see all places where this function is used
   - This opens Telescope with a list of all references
   - Navigate the list and press Enter to jump to any reference

4. **Go to Implementation:**
   - Place your cursor on an interface/abstract type
   - Press `gri` to jump to its implementation
   - Useful for languages with interfaces (Go, TypeScript, etc.)

5. **View Hover Information:**
   - Place your cursor on a function name
   - Press `K` to see documentation and type information
   - This shows a floating window with details about the symbol

### Tips
- After jumping to a definition, use `<C-t>` to go back to your previous location
- Use `grr` to find all usages of a function before refactoring
- `<C-gd>` and `<C-gD>` may show the same location in some languages (like Python, JavaScript)
- In C/C++, `<C-gD>` typically goes to the header file, while `<C-gd>` goes to the implementation
- The LSP must be running for these features to work (check with `:LspInfo`)

## Completion (nvim-cmp)
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-p>` | Insert | Select previous completion item |
| `<C-n>` | Insert | Select next completion item |
| `<C-y>` | Insert | Confirm completion selection |
| `<C-Space>` | Insert | Trigger completion menu |

## Window Management (Vsplit/Split)

### Opening Windows
| Command | Description |
|---------|-------------|
| `:vsplit` or `:vs` | Open a vertical split with the current file |
| `:vsplit <file>` or `:vs <file>` | Open a vertical split with a specific file |
| `:split` or `:sp` | Open a horizontal split with the current file |
| `:split <file>` or `:sp <file>` | Open a horizontal split with a specific file |

### Navigating Between Windows
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | Normal | Move focus to the left window |
| `<C-l>` | Normal | Move focus to the right window |
| `<C-j>` | Normal | Move focus to the lower window |
| `<C-k>` | Normal | Move focus to the upper window |
| `<C-w>h` | Normal | Move focus to the left window (alternative) |
| `<C-w>l` | Normal | Move focus to the right window (alternative) |
| `<C-w>j` | Normal | Move focus to the lower window (alternative) |
| `<C-w>k` | Normal | Move focus to the upper window (alternative) |
| `<C-w>w` | Normal | Cycle through windows |
| `<C-w>p` | Normal | Go to previous window |

### Resizing Windows
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-w>=` | Normal | Make all windows equal size |
| `<C-w>_` | Normal | Maximize current window height |
| `<C-w>\|` | Normal | Maximize current window width |
| `<C-w>+` | Normal | Increase window height |
| `<C-w>-` | Normal | Decrease window height |
| `<C-w>>` | Normal | Increase window width |
| `<C-w><` | Normal | Decrease window width |

### Closing Windows
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-w>c` or `:close` | Normal | Close current window |
| `<C-w>q` | Normal | Quit current window (same as `:q`) |
| `:only` or `<C-w>o` | Normal | Close all other windows (keep only current) |
| `:qall` or `:qa` | Normal | Close all windows and quit Neovim |
| `:wqall` or `:wqa` | Normal | Save all files and quit Neovim |

### Moving Windows
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-w>H` | Normal | Move window to the left (swap positions) |
| `<C-w>L` | Normal | Move window to the right (swap positions) |
| `<C-w>J` | Normal | Move window to the bottom (swap positions) |
| `<C-w>K` | Normal | Move window to the top (swap positions) |
| `<C-w>r` | Normal | Rotate windows down/right |
| `<C-w>R` | Normal | Rotate windows up/left |

### Working with Vsplit
1. **Open a vertical split:**
   - Type `:vsplit` or `:vs` to split the current window vertically
   - Or use `:vsplit <filename>` to open a specific file in a new vertical split

2. **Navigate between splits:**
   - Use `<C-h>` to move to the left window
   - Use `<C-l>` to move to the right window
   - Use `<C-j>` to move to the window below
   - Use `<C-k>` to move to the window above

3. **Resize splits:**
   - Use `<C-w>=` to make all windows equal size
   - Use `<C-w>>` to increase width of current window
   - Use `<C-w><` to decrease width of current window

4. **Close a split:**
   - Move to the split you want to close
   - Type `:close` or press `<C-w>c`
   - Or use `:q` to quit the window

5. **Close all other splits:**
   - Use `:only` or `<C-w>o` to keep only the current window open

### Tips
- You can have multiple vsplits open at the same time
- Each split can show a different file or the same file
- Use `<C-w>w` to quickly cycle through all open windows
- Use `<C-w>p` to jump to the previously focused window
