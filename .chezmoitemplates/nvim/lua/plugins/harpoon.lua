return {
    {
        'ThePrimeagen/harpoon',
        branch='harpoon2',
        keys = {
            {'<leader>a', desc = 'Add to Harpoon'},
            {'<C-e>', desc = 'Open Harpoon list'},
            {'<leader>1', desc = 'Open Harpoon first item'},
            {'<leader>2', desc = 'Open Harpoon second item'},
            {'<leader>3', desc = 'Open Harpoon third item'},
            {'<leader>4', desc = 'Open Harpoon fourth item'},
        },
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        },
        opts = {
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        },
        config = function (_, opts)
            local harpoon = require('harpoon')

            harpoon:setup(opts)

            vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
            vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end)
            vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end)
            vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end)
            vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end)
        end,
    },
}
