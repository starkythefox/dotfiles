local gitsigns = require('gitsigns')

gitsigns.setup({
    -- See `:help gitsigns.txt`
    signs = {
        add = {text = '+'},
        change = {text = '~'},
        delete = {text = '_'},
        topdelete = {text = '‾'},
        changedelete = {text = '~'},
    },
    on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', gitsigns.prev_hunk, {buffer = bufnr, desc = '[G]o to [P]revious Hunk'})
        vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, {buffer = bufnr, desc = '[G]o to [N]ext Hunk'})
        vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, {buffer = bufnr, desc = '[P]review [H]unk'})
    end,
})
