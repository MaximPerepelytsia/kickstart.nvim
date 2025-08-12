# Neovim Plugins Guide

This document describes the additional plugins added to your kickstart.nvim configuration, including hotkeys, setup instructions, and usage examples.

## 🎨 Theme & Visual Enhancements

### Nordic Theme
- **Plugin**: `AlexvZyl/nordic.nvim`
- **Description**: A beautiful, modern color scheme with nordic aesthetics
- **Setup**: Automatically applied on startup
- **Customization**: Edit `lua/custom/plugins/init.lua` to modify theme settings

### Nerd Fonts Support
- **Plugin**: `nvim-tree/nvim-web-devicons`
- **Description**: Provides beautiful icons throughout the interface
- **Setup**: Automatically enabled when `vim.g.have_nerd_font = true`
- **Requirement**: Install a Nerd Font in your terminal (e.g., JetBrains Mono Nerd Font, FiraCode Nerd Font)

### Relative Line Numbers
- **Plugin**: `sitiom/nvim-numbertoggle`
- **Description**: Smart relative line numbers that switch between relative and absolute
- **Setup**: Automatically enabled
- **Usage**: Press `Ctrl+G` to toggle between relative/absolute line numbers

## 🌳 File Management

### Neo-tree File Explorer
- **Plugin**: `nvim-neo-tree/neo-tree.nvim`
- **Description**: Modern, fast file tree explorer with git integration

#### Hotkeys:
- `<leader>e` - Toggle file explorer
- `<leader>te` - Toggle [T]ree [E]xplorer (alternative)
- `<leader>tf` - Focus on tree explorer

- `a` - Add file/folder
- `d` - Delete file/folder
- `r` - Rename file/folder
- `c` - Copy file/folder
- `x` - Cut file/folder
- `p` - Paste file/folder
- `Enter` - Open file/folder
- `Backspace` - Go to parent directory

#### File Operations (when explorer is open):
- **`a`** - Add file/folder (creates new file or directory)
- **`d`** - Delete file/folder (moves to trash/recycle bin)
- **`r`** - Rename file/folder (allows you to change the name)
- **`c`** - Copy file/folder (copies to clipboard for pasting elsewhere)
- **`x`** - Cut file/folder (moves file/folder to clipboard for pasting)
- **`p`** - Paste file/folder (pastes copied/cut items to current location)

#### Commands:
- `:Neotree` - Open file explorer
- `:Neotree toggle` - Toggle file explorer on/off
- `:Neotree close` - Close file explorer
- `:Neotree focus` - Focus on file explorer
- `:Neotree reveal` - Reveal current file in tree

#### Focus Management:
- **`<leader>tf`** - Move focus to tree explorer (useful when tree is open but not focused)
- **`<leader>tf`** - Quickly jump to tree from any buffer

#### Setup:
The plugin is pre-configured with:
- Hidden files visible
- Git integration
- Smart filtering
- Window management shortcuts

## 🔍 Search & Navigation

### Telescope Fuzzy Finder
- **Plugin**: `nvim-telescope/telescope.nvim`
- **Description**: Powerful fuzzy finder for files, text, and more

#### Hotkeys:
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fo` - Find old files
- `<leader>fs` - Find LSP symbols

#### Telescope Navigation:
- `Ctrl+n/Ctrl+p` - Navigate results
- `Ctrl+j/Ctrl+k` - Navigate results
- `Enter` - Select item
- `Ctrl+v` - Open in vertical split
- `Ctrl+x` - Open in horizontal split
- `Ctrl+t` - Open in new tab
- `Ctrl+/` - Toggle preview
- `?` - Show help

#### Setup:
Includes FZF integration for faster search and UI-select for better selection experience.

## 🚀 Language Server Protocol (LSP)

### Go Development
- **Plugin**: `ray-x/go.nvim`
- **Description**: Full Go development support with LSP, debugging, and tools

#### Features:
- Code completion and diagnostics
- Go to definition/references
- Rename symbols
- Code formatting
- Debug support (DAP)
- Inlay hints
- Static analysis

#### Setup:
1. Install Go: `go install golang.org/x/tools/gopls@latest`
2. Install Delve for debugging: `go install github.com/go-delve/delve/cmd/dlv@latest`
3. The plugin will auto-install required tools on first use

#### Go-specific Commands:
- `:GoInstallBinaries` - Install Go tools
- `:GoFmt` - Format code
- `:GoLint` - Run linter
- `:GoTest` - Run tests
- `:GoDebug` - Start debugging

### Java Development
- **Plugin**: `mfussenegger/nvim-jdtls`
- **Description**: Java development with Eclipse JDT Language Server

#### Features:
- Code completion and diagnostics
- Refactoring tools
- Maven/Gradle project support
- Debug support
- Code formatting

#### Setup:
1. Install Java JDK (17+ recommended)
2. Install Eclipse JDT Language Server:
   ```bash
   # Download from: https://download.eclipse.org/jdtls/snapshots/
   # Extract to ~/.local/share/nvim/lsp/jdtls
   ```
3. Update the Java runtime path in `lua/custom/plugins/init.lua` if needed

#### Java-specific Commands:
- `:JdtlsCompile` - Compile project
- `:JdtlsUpdateProjectConfig` - Update project configuration

### Python Development
- **Plugin**: `neovim/nvim-lspconfig` with Pyright and Ruff
- **Description**: Python development with type checking and linting (uses modern `ruff` LSP, not deprecated `ruff_lsp`)

#### Features:
- Type checking with Pyright
- Fast linting with Ruff
- Code completion and diagnostics
- Import organization
- Code formatting

#### Setup:
1. Install Python LSP servers:
   ```bash
   pip install pyright ruff
   ```
2. Or use Mason (automatically installed):
   ```bash
   :MasonInstall pyright ruff
   ```

#### Python-specific Commands:
- `:LspInfo` - Show LSP status
- `:LspRestart` - Restart LSP server

## 🎨 Code Formatting & Prettification

### Auto-formatting on Save
- **Plugin**: `stevearc/conform.nvim`
- **Description**: Automatically formats your code when you save files
- **Hotkey**: `<leader>f` - Manually format current buffer

### Language-specific Formatters
- **Go**: `gofmt`, `goimports` (auto-organizes imports)
- **Python**: `black`, `isort`, `ruff_format` (PEP 8 compliant)
- **Java**: `google-java-format` (Google's Java style guide)
- **JavaScript/TypeScript**: `prettier`
- **Lua**: `stylua`
- **Markdown/HTML/CSS**: `prettier`

### Visual Enhancements
- **Indent Guides**: `lukas-reineke/indent-blankline.nvim`
  - Shows vertical lines for indentation levels
  - Highlights scope boundaries
  - Makes code structure more visible

- **Rainbow Delimiters**: `HiPhish/rainbow-delimiters.nvim`
  - Colors parentheses, brackets, and braces
  - Makes nested structures easier to read
  - Different colors for different nesting levels

- **Enhanced Treesitter**: `nvim-treesitter/nvim-treesitter`
  - Better syntax highlighting
  - Rainbow parentheses support
  - Improved indentation rules

### How to Use Formatting

#### Automatic Formatting:
- **Save any file** (`:w`) - Code formats automatically
- **Supported languages** format according to their standards

#### Manual Formatting:
- **`<leader>f`** - Format current buffer manually
- **`:Format`** - Alternative formatting command

#### Install Formatters:
```bash
# Go
go install golang.org/x/tools/cmd/goimports@latest

# Python
pip install black isort ruff

# Node.js (for prettier)
npm install -g prettier

# Java
# Download google-java-format from GitHub releases
```

#### Customize Formatting:
- Edit `lua/custom/plugins/init.lua` to modify formatter settings
- Change formatter options in the `conform.nvim` configuration
- Adjust Treesitter settings for better highlighting

## ⚙️ Installation & Setup

### Automatic Setup
1. **Install the configuration**:
   ```bash
   make install
   ```

2. **Restart Neovim** - Plugins will auto-install

3. **Verify installation**:
   ```bash
   :Lazy
   :checkhealth
   ```

### Manual Setup
1. **Install required system dependencies**:
   ```bash
   # Go
   go install golang.org/x/tools/gopls@latest
   go install github.com/go-delve/delve/cmd/dlv@latest
   
   # Java
   # Install JDK 17+ and Eclipse JDT Language Server
   
   # Python
   pip install pyright ruff
   ```

2. **Install Nerd Font** (optional but recommended):
   - Download from: https://www.nerdfonts.com/font-downloads
   - Set as terminal font

### Troubleshooting

#### Common Issues:
1. **LSP not working**:
   - Run `:checkhealth` to see detailed status
   - Ensure language servers are installed
   - Check `:LspInfo` for server status

2. **Icons not showing**:
   - Install a Nerd Font
   - Set `vim.g.have_nerd_font = true` in init.lua

3. **Plugin errors**:
   - Run `:Lazy sync` to reinstall plugins
   - Check `:Lazy log` for error details

#### Health Checks:
```bash
:checkhealth
:checkhealth lsp
:checkhealth treesitter
```

## 🎯 Quick Start Commands

### Essential Hotkeys:
- `<leader>e` - Open file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Search in files
- `<leader>fb` - Switch buffers
- `<leader>fh` - Search help

### LSP Commands:
- `gd` - Go to definition
- `gr` - Go to references
- `rn` - Rename symbol
- `ca` - Code actions
- `K` - Show documentation

### File Explorer:
- `a` - Add file
- `d` - Delete file
- `r` - Rename file
- `y` - Copy file
- `x` - Cut file

## 📚 Additional Resources

- **Neovim LSP**: `:help lsp`
- **Telescope**: `:help telescope`
- **Neo-tree**: `:help neo-tree`
- **Go.nvim**: `:help go`
- **JDTLS**: `:help jdtls`

## 🔄 Updating Plugins

```bash
# Update all plugins
:Lazy update

# Update specific plugin
:Lazy update <plugin-name>

# Sync plugins
:Lazy sync
```

---

**Note**: This configuration extends kickstart.nvim. For base Neovim help, run `:Tutor` and `:help` in Neovim.
