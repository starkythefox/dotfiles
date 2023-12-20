return {
    {
        'ThePrimeagen/harpoon',
        branch='harpoon2',
        keys = {
            {"<leader>a", function() require('harpoon'):list():append() end, "n", desc = 'Add to Harpoon'},
            {"<C-e>", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, "n", desc = 'Open Harpoon list'},
            {"<leader>1", function() require('harpoon'):list():select(1) end, "n", desc = 'Open Harpoon first item'},
            {"<leader>2", function() require('harpoon'):list():select(2) end, "n", desc = 'Open Harpoon second item'},
            {"<leader>3", function() require('harpoon'):list():select(3) end, "n", desc = 'Open Harpoon third item'},
            {"<leader>4", function() require('harpoon'):list():select(4) end, "n", desc = 'Open Harpoon fourth item'},

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
        end,
    },
}
