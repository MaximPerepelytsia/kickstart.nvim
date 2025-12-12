--[[
=====================================================================
                         KEYMAP CONFIGURATION
=====================================================================
Leader Key: <Space>

This file contains all custom keymaps for the Neovim configuration.
Keymaps are organized by category for better maintainability.

Usage:
  - <leader> refers to the Space key
  - See `:help vim.keymap.set()` for more information
=====================================================================
--]]

local keymap = vim.keymap.set

-- [[ General Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Better escape from terminal mode
-- NOTE: This won't work in all terminal emulators/tmux/etc.
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open file explorer (Ex command)
keymap('n', '<leader>pv', '<cmd>Ex<CR>', { desc = 'Open file explorer' })

-- [[ Diagnostic Keymaps ]]

-- Open diagnostic quickfix list
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- [[ Window Navigation ]]

-- Navigate between windows using CTRL+<hjkl>
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Uncomment these if your terminal supports Shift+Ctrl combinations
-- Move windows to different positions
-- keymap('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
-- keymap('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
-- keymap('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
-- keymap('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- [[ Telescope (Fuzzy Finder) ]]
-- Load Telescope lazily when keymaps are used
keymap('n', '<leader>pf', function()
  require('telescope.builtin').find_files()
end, { desc = 'Find files in project' })

keymap('n', '<C-p>', function()
  require('telescope.builtin').git_files()
end, { desc = 'Find files in git repository' })

keymap('n', '<leader>ps', function()
  require('telescope.builtin').live_grep()
end, { desc = 'Search for text in project (grep)' })

-- [[ Optional: Disable Arrow Keys ]]
-- Uncomment to enforce using hjkl for navigation
-- keymap('n', '<left>', '<cmd>echo "Use h to move!!"<CR>', { desc = 'Disable left arrow' })
-- keymap('n', '<right>', '<cmd>echo "Use l to move!!"<CR>', { desc = 'Disable right arrow' })
-- keymap('n', '<up>', '<cmd>echo "Use k to move!!"<CR>', { desc = 'Disable up arrow' })
-- keymap('n', '<down>', '<cmd>echo "Use j to move!!"<CR>', { desc = 'Disable down arrow' })

-- [[ Custom Keymaps ]]
-- Add your custom keymaps below this line

-- Example: Save file with Ctrl+S
-- keymap({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })

-- Example: Better window management
-- keymap('n', '<leader>wv', '<cmd>vsplit<CR>', { desc = '[W]indow [V]ertical split' })
-- keymap('n', '<leader>wh', '<cmd>split<CR>', { desc = '[W]indow [H]orizontal split' })
-- keymap('n', '<leader>wc', '<cmd>close<CR>', { desc = '[W]indow [C]lose' })
-- keymap('n', '<leader>wo', '<cmd>only<CR>', { desc = '[W]indow [O]nly (close others)' })

-- Example: Buffer navigation
-- keymap('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
-- keymap('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })
-- keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Example: Quick quit
-- keymap('n', '<leader>qq', '<cmd>qa<CR>', { desc = '[Q]uit all' })
-- keymap('n', '<leader>qw', '<cmd>wqa<CR>', { desc = '[Q]uit all and [W]rite' })

-- Example: Better indenting in visual mode
-- keymap('v', '<', '<gv', { desc = 'Indent left and reselect' })
-- keymap('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Example: Move lines up and down
-- keymap('n', '<A-j>', '<cmd>m .+1<CR>==', { desc = 'Move line down' })
-- keymap('n', '<A-k>', '<cmd>m .-2<CR>==', { desc = 'Move line up' })
-- keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
-- keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

return {}
