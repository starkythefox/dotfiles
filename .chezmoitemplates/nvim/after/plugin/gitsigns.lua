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
        vim.keymap.set('n', ']g', gitsigns.next_hunk, {buffer = bufnr, desc = 'Next Hunk'})
        vim.keymap.set('n', '[g', gitsigns.prev_hunk, {buffer = bufnr, desc = 'Previous Hunk'})
        vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, {buffer = bufnr, desc = 'Preview Hunk'})
    end,
})
