--[[
=====================================================================
                         TOKYONIGHT
=====================================================================
Colorscheme - You can easily change to a different colorscheme.
Change the name of the colorscheme plugin below, and then
change the command in the config to whatever the name of that colorscheme is.

If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
=====================================================================
--]]

return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        -- on_highlights = function(hl, c)
        --   -- Customize line numbers with higher contrast
        --   -- Line numbers above and below current line - high contrast (almost same as cursor line)
        --   hl.LineNr = {
        --     fg = '#f0f0f0', -- Very bright gray/white for high contrast line numbers
        --   }
        --   -- Current line number - maximum contrast
        --   hl.CursorLineNr = {
        --     fg = '#ffffff', -- Pure white for current line number (maximum contrast)
        --     bold = true, -- Make current line number stand out
        --   }
        -- end,
      }

      -- Load the colorscheme based on time of day
      -- Day theme (7am - 7pm): tokyonight-day
      -- Night theme (7pm - 7am): tokyonight-moon
      local function get_time_based_theme()
        local hour = tonumber(os.date('%H'))
        -- If hour is between 7 (7am) and 18 (6:59pm), use day theme
        -- Otherwise (7pm to 6:59am), use moon theme
        if hour >= 7 and hour < 19 then
          return 'tokyonight-day'
        else
          return 'tokyonight-moon'
        end
      end

      local theme = get_time_based_theme()
      vim.cmd.colorscheme(theme)
    end,
  },
}

