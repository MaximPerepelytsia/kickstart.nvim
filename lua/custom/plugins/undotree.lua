--[[
=====================================================================
                         UNDOTREE
=====================================================================
Visualize undo history as a tree
=====================================================================
--]]

return {
  { -- Undotree
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
}

