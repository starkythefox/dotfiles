return {
    {
        'folke/trouble.nvim',
        dependencies = {
            {'nvim-tree/nvim-web-devicons', lazy = true},
        },
        keys = {
            {'<leader>xx', desc = 'Trouble: toggle list'},
            {'<leader>xw', desc = 'Trouble: Toggle workspace diagnostics'},
            {'<leader>xd', desc = 'Trouble: toggle document diagnostics'},
            {'<leader>xD', desc = 'Trouble: toggle definitions'},
            {'<leader>xt', desc = 'Trouble: toggle type definitions'},
            {'<leader>xq', desc = 'Trouble: toggle quickfix list'},
            {'<leader>xl', desc = 'Trouble: toggle location list'},
            {'<leader>xr', desc = 'Trouble: toggle LSP references'},
        },
        cmd = {'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh'},
        opts = {},
        config = function (_, opts)
            local trouble = require('trouble')

            trouble.setup(opts)

            vim.keymap.set('n', '<leader>xx', trouble.toggle, {desc = 'Trouble: toggle list'})
            vim.keymap.set('n', '<leader>xw', function() trouble.toggle('workspace_diagnostics') end, {desc = 'Trouble: Toggle workspace diagnostics'})
            vim.keymap.set('n', '<leader>xd', function() trouble.toggle('document_diagnostics') end, {desc = 'Trouble: toggle document diagnostics'})
            vim.keymap.set('n', '<leader>xD', function() trouble.toggle('lsp_definitions') end, {desc = 'Trouble: toggle definitions'})
            vim.keymap.set('n', '<leader>xt', function() trouble.toggle('lsp_type_definitions') end, {desc = 'Trouble: toggle type definitions'})
            vim.keymap.set('n', '<leader>xq', function() trouble.toggle('quickfix') end, {desc = 'Trouble: toggle quickfix list'})
            vim.keymap.set('n', '<leader>xl', function() trouble.toggle('loclist') end, {desc = 'Trouble: toggle location list'})
            vim.keymap.set('n', '<leader>xr', function() trouble.toggle('lsp_references') end, {desc = 'Trouble: toggle LSP references'})
        end
    },
}
