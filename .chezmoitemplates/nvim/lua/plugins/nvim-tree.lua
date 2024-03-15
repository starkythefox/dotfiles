return {
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-tree/nvim-tree.lua",
                version = "*",
                lazy = false,
                init = function ()
                    vim.g.loaded_netrw = 1
                    vim.g.loaded_netrwPlugin = 1
                end,
                dependencies = {
                    "nvim-tree/nvim-web-devicons",
                },
                config = function()
                    local nvim_tree = require("nvim-tree")
                    local nvimtree_api = require('nvim-tree.api')

                    nvim_tree.setup()

                    vim.keymap.set('n', '<leader>po', nvimtree_api.tree.open, {desc = 'Open NvimTree'})
                    vim.keymap.set('n', '<leader>pc', nvimtree_api.tree.close, {desc = 'Close NvimTree'})
                    vim.keymap.set('n', '<leader>pt', function() nvimtree_api.tree.toggle({focus = false}) end, {desc = 'Toggle NvimTree'})
                    vim.keymap.set('n', '<leader>pv', function() nvimtree_api.tree.find_file({open = true, focus = true}) end, {desc = 'Open NvimTree and find file'})
                end,
            }
        },
        config = function()
            local lspfo = require("lsp-file-operations")
            lspfo.setup()
        end,
    },
}
