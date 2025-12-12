--[[
=====================================================================
                         CUSTOM SETTINGS
=====================================================================
This file contains custom Neovim settings and options.
Settings are organized by category for better maintainability.
=====================================================================
--]]

-- GUI Cursor
-- Disable special cursor shapes in GUI mode
vim.opt.guicursor = ""

-- Line Numbers
-- Show absolute line numbers
vim.opt.nu = true
-- Show relative line numbers (distance from current line)
vim.opt.relativenumber = true

-- Tab and Indentation
-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4
-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 4
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Smart indentation
-- Automatically indent when starting a new line
vim.opt.smartindent = true

-- Text Wrapping
-- Disable text wrapping (long lines extend beyond the window)
vim.opt.wrap = false

-- File Management
-- Disable swap files (prevents creation of .swp files)
vim.opt.swapfile = false
-- Disable backup files (prevents creation of ~ files)
vim.opt.backup = false
-- Directory where undo files are stored
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Enable persistent undo (undo history persists across sessions)
vim.opt.undofile = true

-- Search Settings
-- Disable highlighting of search matches
vim.opt.hlsearch = false
-- Enable incremental search (show matches as you type)
vim.opt.incsearch = true

-- Colors
-- Enable 24-bit RGB color support in the terminal
vim.opt.termguicolors = true

-- Display Settings
-- Minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8
-- Always show the sign column (for diagnostics, git signs, etc.)
vim.opt.signcolumn = "yes"
-- Append @-@ to isfname (allows @ in filenames)
vim.opt.isfname:append("@-@")

-- Update Settings
-- Time in milliseconds to wait before triggering CursorHold events
vim.opt.updatetime = 50

-- Visual Guide
-- Highlight column at 80 characters (helps with line length)
vim.opt.colorcolumn = "80"

