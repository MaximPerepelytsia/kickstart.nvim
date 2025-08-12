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
    -- This plugin works automatically without setup
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

  -- File tree explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Toggle [E]xplorer' },
      { '<leader>te', '<cmd>Neotree toggle<CR>', desc = 'Toggle [T]ree [E]xplorer' },
      { '<leader>tf', '<cmd>Neotree focus<CR>', desc = '[T]ree [F]ocus' },
    },
    config = function()
      -- Ensure dependencies are loaded
      require('neo-tree').setup({
        close_if_last_window = false,
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
          mappings = {
            ['<space>'] = 'none',
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = {
            enabled = true,
          },
          mappings = {
            ['y'] = 'copy_to_clipboard',
            ['c'] = 'copy_to_clipboard',
          },
        },
      })
    end,
  },

  -- Fuzzy finder (nvim-telescope) - Enhanced configuration
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = '[F]ind [F]iles' },
      { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = '[F]ind by [G]rep' },
      { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = '[F]ind [B]uffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = '[F]ind [H]elp' },
      { '<leader>fo', '<cmd>Telescope oldfiles<CR>', desc = '[F]ind [O]ld files' },
      { '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>', desc = '[F]ind [S]ymbols' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })
      
      -- Load extensions
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')
    end,
  },

  -- Go LSP and tools
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'go', 'gomod', 'gosum', 'go.work' },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require('go').setup({
        lsp_cfg = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        lsp_inlay_hints = {
          enable = true,
        },
        dap_debug = true,
        dap_debug_gui = true,
      })
    end,
  },

  -- Java LSP and tools
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local jdtls = require('jdtls')
      local config = {
        cmd = { 'jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = 'JavaSE-17',
                  path = '/usr/lib/jvm/java-17-openjdk',
                  default = true,
                },
              },
            },
          },
        },
      }
      jdtls.start_or_attach(config)
    end,
  },

  -- Python LSP and tools
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local lspconfig = require('lspconfig')
      
      -- Python LSP configuration
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'basic',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
      
      -- Alternative: Use ruff for faster Python LSP (ruff_lsp is deprecated)
      lspconfig.ruff.setup({
        init_options = {
          settings = {
            args = {},
          },
        },
      })
    end,
  },

  -- Code formatting and prettification
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Enable format on save for all supported languages
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        python = { 'black', 'isort', 'ruff_format' },
        java = { 'google-java-format' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
      },
    },
  },

  -- Better indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        injected_languages = true,
        highlight = 'Function',
        priority = 500,
      },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'lazy',
          'mason',
        },
      },
    },
  },

  -- Rainbow parentheses and brackets
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')
      
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          html = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },

  -- Better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
          'query', 'vim', 'vimdoc', 'go', 'gomod', 'gosum', 'python', 'java',
          'javascript', 'typescript', 'json', 'yaml', 'css', 'scss'
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      })
    end,
  },
}
