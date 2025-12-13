--[[
=====================================================================
                         FUGITIVE
=====================================================================
Git integration for Neovim
=====================================================================
--]]

return {
  { -- Git (Fugitive)
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse', 'GRemove', 'GRename', 'Glgrep', 'Gedit' },
    ft = { 'fugitive' },
  },
}

