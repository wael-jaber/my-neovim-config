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


    -- LSP Support
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}

    -- Autocompletion
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}

    -- Snippets
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'lewis6991/gitsigns.nvim'
    use 'prichrd/netrw.nvim'
    use 'github/copilot.vim'




    use {'nvimtools/none-ls.nvim'}

    use('MunifTanjim/prettier.nvim')

    use {"windwp/nvim-ts-autotag" ,config = function() require("nvim-ts-autotag").setup() end}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'nvim-treesitter/nvim-treesitter-context'

end)
