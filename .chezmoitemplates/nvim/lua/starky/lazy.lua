local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Color scheme
    {
        'edeneast/nightfox.nvim',
        name = 'nightfox',
        priority = 1000
    },

--    {
--        "sourcegraph/sg.nvim",
--        dependencies = { "nvim-lua/plenary.nvim" },
--    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'mfussenegger/nvim-dap'},
            {'rcarriga/nvim-dap-ui'},
            {'jay-babu/mason-nvim-dap.nvim'},

            {
                'j-hui/fidget.nvim',
                tag = 'legacy',
            },

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
            {'honza/vim-snippets'}
        }
    },

    -- SonarLint
    {
        'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
        name = 'sonarlint.nvim',
        branch = 'main',
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
            {'mfussenegger/nvim-jdtls'}, -- required
        }
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
{{ if .telescope_fzf_able }}            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},{{ end }}
            {'nvim-telescope/telescope-dap.nvim'},
        }
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            {'nvim-treesitter/nvim-treesitter-context'},
            {'nvim-treesitter/playground'},
        }
    },

    -- git
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',


    -- Other Utilities
    'ThePrimeagen/harpoon',
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    },
    'folke/trouble.nvim',
    'mbbill/undotree',
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }
})
