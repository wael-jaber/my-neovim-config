local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Your plugins goes here
    use { 'nvim-tree/nvim-web-devicons' }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use({
        'folke/tokyonight.nvim',
        as = 'tokyonight' ,
        config = function()
            vim.cmd('colorscheme tokyonight-night')
        end
    })

    use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} )
    use( 'nvim-treesitter/playground' )
    use( 'mbbill/undotree' )
    use( 'tpope/vim-fugitive' )
    

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'lewis6991/gitsigns.nvim'     
    use 'prichrd/netrw.nvim'
    use 'github/copilot.vim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    use {'jose-elias-alvarez/null-ls.nvim'}

    use('MunifTanjim/prettier.nvim')

    use {"windwp/nvim-ts-autotag" ,config = function() require("nvim-ts-autotag").setup() end}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }


end)
