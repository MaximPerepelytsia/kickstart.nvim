--[[
=====================================================================
                         CUSTOM PLUGINS
=====================================================================
This file automatically imports all plugin configurations from
lua/custom/plugins/*.lua files. Each plugin has its own file for
better organization and maintainability.
=====================================================================
--]]

return {
  -- Import all plugin configurations
  { import = 'custom.plugins.guess-indent' },
  { import = 'custom.plugins.gitsigns' },
  { import = 'custom.plugins.which-key' },
  { import = 'custom.plugins.telescope' },
  { import = 'custom.plugins.harpoon' },
  { import = 'custom.plugins.undotree' },
  { import = 'custom.plugins.fugitive' },
  { import = 'custom.plugins.lazydev' },
  { import = 'custom.plugins.lspconfig' },
  { import = 'custom.plugins.conform' },
  { import = 'custom.plugins.blink-cmp' },
  { import = 'custom.plugins.tokyonight' },
  { import = 'custom.plugins.todo-comments' },
  { import = 'custom.plugins.mini' },
  { import = 'custom.plugins.treesitter' },
}
