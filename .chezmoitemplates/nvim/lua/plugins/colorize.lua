return {
    'norcalli/nvim-colorizer.lua',
    config = function ()
        local colorizer = require('colorizer')
        colorizer.setup()

        vim.keymap.set('n', '<leader>ct', vim.cmd.ColorizerToggle, {desc = 'Toogle Colorizer highlighting'})
    end,
}
