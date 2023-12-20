return {
    {
        'folke/trouble.nvim',
        dependencies = {
            {'nvim-tree/nvim-web-devicons', lazy = true},
        },
        keys = {
            {'<leader>xx', function() require('trouble').toggle() end, 'n', desc = 'Trouble: toggle list'},
            {'<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, 'n', desc = 'Trouble: Toggle workspace diagnostics'},
            {'<leader>xd', function() require('trouble').toggle('document_diagnostics') end, 'n', desc = 'Trouble: toggle document diagnostics'},
            {'<leader>xD', function() require('trouble').toggle('lsp_definitions') end, 'n', desc = 'Trouble: toggle definitions'},
            {'<leader>xt', function() require('trouble').toggle('lsp_type_definitions') end, 'n', desc = 'Trouble: toggle type definitions'},
            {'<leader>xq', function() require('trouble').toggle('quickfix') end, 'n', desc = 'Trouble: toggle quickfix list'},
            {'<leader>xl', function() require('trouble').toggle('loclist') end, 'n', desc = 'Trouble: toggle location list'},
            {'<leader>xr', function() require('trouble').toggle('lsp_references') end, 'n', desc = 'Trouble: toggle LSP references'},
        },
        cmd = {'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh'},
        opts = {},
        config = function (_, opts)
            local trouble = require('trouble')

            trouble.setup(opts)
        end
    },
}
