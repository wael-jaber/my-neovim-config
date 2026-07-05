return {
  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    priority = 1000,
    config = function()
      vim.cmd('colorscheme tokyonight-night')
    end,
  },

  -- Icons
  { 'nvim-tree/nvim-web-devicons' },

  -- UI
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-web-devicons' } },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-web-devicons' },
  },

  -- File explorer
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'telescope.nvim' },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  { 'nvim-treesitter/nvim-treesitter-context' },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },

  -- Formatting
  { 'stevearc/conform.nvim' },

  -- Linting
  { 'mfussenegger/nvim-lint' },

  -- LSP enhancements
  { 'folke/lazydev.nvim', ft = 'lua' }, -- Lua LSP for config files
  { 'folke/trouble.nvim' },

  -- Git
  { 'tpope/vim-fugitive' },
  { 'lewis6991/gitsigns.nvim' },

  -- Editing helpers
  { 'windwp/nvim-autopairs' },
  { 'windwp/nvim-ts-autotag' },
  { 'numToStr/Comment.nvim' },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'tpope/vim-sleuth' },
  { 'mbbill/undotree' },

  -- Terminal
  { 'akinsho/toggleterm.nvim' },

  -- UX
  { 'folke/which-key.nvim' },
  { 'folke/flash.nvim' },
  { 'folke/noice.nvim' },
  { 'folke/todo-comments.nvim' },
  { 'stevearc/dressing.nvim' },

  -- Copilot
  { 'github/copilot.vim' },
}
