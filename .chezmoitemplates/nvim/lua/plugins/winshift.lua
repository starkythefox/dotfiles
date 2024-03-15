return {
    {
        'sindrets/winshift.nvim',
        cmd = { 'WinShift' },
        keys = {
            {'<C-W><C-M>', 'n', desc = 'Go to Win-Move mode'},
            {'<C-W>X', 'n', desc = 'Go to Win-Move mode'},
            {'<C-M-H>', 'n', desc = 'WinShift: Move window to the left'},
            {'<C-M-J>', 'n', desc = 'WinShift: Move window downwards'},
            {'<C-M-K>', 'n', desc = 'WinShift: Move window upwards'},
            {'<C-M-L>', 'n', desc = 'WinShift: Move window to the right'},
        },
        opts = {},
        config = function (opts)
            local winshift = require('winshift')

            winshift.setup(opts)

            vim.keymap.set('n', '<C-W><C-M>', vim.cmd.WinShift, {desc = 'Go to Win-Move mode'})
            vim.keymap.set('n', '<C-W>X', function() vim.cmd.WinShift({'swap'}) end, {desc = 'Go to Win-Move mode'})
            vim.keymap.set('n', '<C-M-H>', function() vim.cmd.WinShift({'left'}) end, {desc = 'WinShift: Move window to the left'})
            vim.keymap.set('n', '<C-M-J>', function() vim.cmd.WinShift({'down'}) end, {desc = 'WinShift: Move window downwards'})
            vim.keymap.set('n', '<C-M-K>', function() vim.cmd.WinShift({'up'}) end, {desc = 'WinShift: Move window upwards'})
            vim.keymap.set('n', '<C-M-L>', function() vim.cmd.WinShift({'right'}) end, {desc = 'WinShift: Move window to the right'})
        end
    }
}
