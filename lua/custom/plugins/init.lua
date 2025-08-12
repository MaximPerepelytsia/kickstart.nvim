-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- Nordic theme
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup({
        -- your configuration here
      })
      vim.cmd.colorscheme 'nordic'
    end,
  },

  -- Relative line numbers
  {
    'sitiom/nvim-numbertoggle',
    lazy = false,
    config = function()
      require('numbertoggle').setup()
    end,
  },

  -- Nerd Fonts support (already partially configured in main init.lua)
  -- This plugin provides better icon support for Nerd Fonts
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      require('nvim-web-devicons').setup({
        -- your configuration here
      })
    end,
  },
}
