return {
  -- Colorscheme (load first, no lazy)
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tokyonight-night')
    end,
  },

  -- Icons (lazy-load with dependents)
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- UI
  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', dependencies = { 'nvim-web-devicons' } },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = { 'nvim-web-devicons' },
  },

  -- File explorer (tree)
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
      { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Explorer' },
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw = false,
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_by_name = {
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
      window = {
        position = 'left',
        width = 30,
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function()
            require('neo-tree.command').execute({ action = 'close' })
          end,
        },
      },
    },
  },

  -- Telescope (fuzzy finder)
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'telescope.nvim' },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
  },
  { 'nvim-treesitter/nvim-treesitter-context', event = 'VeryLazy' },

  -- LSP
  { 'neovim/nvim-lspconfig', event = 'BufReadPre' },
  { 'williamboman/mason.nvim', cmd = 'Mason' },
  { 'williamboman/mason-lspconfig.nvim', event = 'BufReadPre', dependencies = { 'mason.nvim', 'nvim-lspconfig' } },

  -- Autocompletion (load on insert)
  { 'hrsh7th/nvim-cmp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
  { 'hrsh7th/cmp-path', event = 'InsertEnter' },
  { 'saadparwaiz1/cmp_luasnip', event = 'InsertEnter' },
  { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter' },
  { 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter' },

  -- Snippets
  { 'L3MON4D3/LuaSnip', event = 'InsertEnter' },
  { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },

  -- Formatting
  { 'stevearc/conform.nvim', event = 'VeryLazy' },

  -- Linting
  { 'mfussenegger/nvim-lint', event = { 'BufWritePost', 'InsertLeave' } },

  -- LSP enhancements
  { 'folke/lazydev.nvim', ft = 'lua' },
  { 'folke/trouble.nvim', cmd = 'Trouble' },

  -- Git
  { 'tpope/vim-fugitive', cmd = 'Git' },
  { 'lewis6991/gitsigns.nvim', event = { 'BufReadPost', 'BufNewFile' } },

  -- Editing helpers
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter' },
  { 'numToStr/Comment.nvim', event = 'VeryLazy' },
  { 'lukas-reineke/indent-blankline.nvim', event = 'VeryLazy' },
  { 'tpope/vim-sleuth', event = 'VeryLazy' },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },

  -- Terminal
  { 'akinsho/toggleterm.nvim', cmd = 'ToggleTerm' },

  -- UX
  { 'folke/which-key.nvim', event = 'VeryLazy' },
  { 'folke/flash.nvim', event = 'VeryLazy' },
  { 'folke/noice.nvim', event = 'VeryLazy' },
  { 'folke/todo-comments.nvim', event = 'VeryLazy' },
  { 'stevearc/dressing.nvim', event = 'VeryLazy' },

  -- Copilot
  { 'github/copilot.vim', event = 'InsertEnter' },

  -- Session management
  {
    'olimorris/persisted.nvim',
    event = 'VeryLazy',
    opts = {
      autoload = true,
      telescope = true,
    },
    config = function(_, opts)
      require('persisted').setup(opts)
      pcall(require('telescope').load_extension, 'persisted')
    end,
  },

  -- Project switching
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    config = function()
      require('project_nvim').setup({
        manual_mode = false,
        detection_methods = { 'pattern', 'lsp' },
        patterns = { '.git', 'go.mod', 'Cargo.toml', 'package.json', 'Makefile', 'composer.json' },
      })
      local telescope = require('telescope')
      telescope.load_extension('projects')
    end,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  -- Debugging
  {
    'mfussenegger/nvim-dap',
    cmd = {
      'DapContinue', 'DapToggleBreakpoint', 'DapStepOver',
      'DapStepInto', 'DapStepOut', 'DapTerminate',
    },
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require('dapui').setup()
          local dap = require('dap')
          dap.listeners.after.event_initialized['dapui_config'] = function()
            require('dapui').open()
          end
          dap.listeners.after.event_terminated['dapui_config'] = function()
            require('dapui').close()
          end
          dap.listeners.after.event_exited['dapui_config'] = function()
            require('dapui').close()
          end
        end,
      },
      { 'theHamsta/nvim-dap-virtual-text', config = function()
        require('nvim-dap-virtual-text').setup()
      end},
      {
        'jay-babu/mason-nvim-dap.nvim',
        cmd = 'DapInstall',
        config = function()
          require('mason-nvim-dap').setup({
            ensure_installed = { 'delve', 'codelldb', 'js-debug-adapter' },
          })
        end,
        dependencies = { 'williamboman/mason.nvim' },
      },
      { 'leoluz/nvim-dap-go', config = function()
        require('dap-go').setup()
      end},
    },
  },

  -- Test runner
  {
    'nvim-neotest/neotest',
    cmd = { 'Neotest', 'NeotestRun', 'NeotestSummary' },
    dependencies = {
      'nvim-neotest/neotest-go',
      'rouge8/neotest-rust',
      'marilari88/neotest-vitest',
      'antoinemadec/FixCursorHold.nvim',
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-go'),
          require('neotest-rust'),
          require('neotest-vitest'),
        },
      })
    end,
  },

  -- Dashboard
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      -- Skip dashboard when opening a directory (e.g. `nvim .`)
      if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
        return
      end
      require('dashboard').setup({
        theme = 'hyper',
        config = {
          header = {
            '    Neovim    ',
          },
          center = {
            {
              icon = '    ',
              desc = 'New file',
              action = 'enew',
              key = 'n',
            },
            {
              icon = '    ',
              desc = 'Find files',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = '    ',
              desc = 'Recent files',
              action = 'Telescope oldfiles',
              key = 'r',
            },
            {
              icon = '    ',
              desc = 'Projects',
              action = 'Telescope projects',
              key = 'p',
            },
            {
              icon = '    ',
              desc = 'Settings',
              action = 'lua require("dashboard").on_config()',
              key = 's',
            },
          },
          footer = {},
        },
      })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
