-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            {'nvim-lua/plenary.nvim'}
        }
    }

    use {
        'EdenEast/nightfox.nvim',
        as = 'nightfox'
    }

    use('folke/trouble.nvim')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            {
                'j-hui/fidget.nvim',
                tag = 'legacy',
            },

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use {
        'jay-babu/mason-null-ls.nvim',
        requires = {
            {'williamboman/mason.nvim'},
            {'jose-elias-alvarez/null-ls.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }

    use {
        'mfussenegger/nvim-dap',
        requires = {
            {'rcarriga/nvim-dap-ui'},
            {'williamboman/mason.nvim'},
            {'jay-babu/mason-nvim-dap.nvim'},
        }
    }

    use {
        'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
        as = 'sonarlint.nvim',
        branch = 'main',
        requires = {
            {'williamboman/mason-lspconfig.nvim'},
            {'mfussenegger/nvim-jdtls'}, -- Required
        }
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

end)
