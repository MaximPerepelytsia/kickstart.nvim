--[[
=====================================================================
                         HARPOON
=====================================================================
File Navigation - Quick access to frequently used files
=====================================================================
--]]

return {
  { -- Harpoon (File Navigation)
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
    end,
  },
}

