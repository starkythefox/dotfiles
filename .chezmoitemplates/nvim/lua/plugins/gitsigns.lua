return {
    {
        'lewis6991/gitsigns.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = function()
            local gitsigns = require('gitsigns')
            return {
                -- See `:help gitsigns.txt`
                signs = {
                    add = {text = '┃'},
                    change = {text = '┃'},
                    delete = {text = '▁'},
                    topdelete = {text = '▔'},
                    changedelete = {text = '~'},
                    untracked = { text = '┇' },
                },
                on_attach = function(bufnr)

                    vim.keymap.set('n', ']g', gitsigns.next_hunk, {buffer = bufnr, desc = 'Next Hunk'})
                    vim.keymap.set('n', '[g', gitsigns.prev_hunk, {buffer = bufnr, desc = 'Previous Hunk'})

                    vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, {desc = 'Gitsigns: Stage hunk'})
                    vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, {desc = 'Gitsigns: Reset hunk'})
                    vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, {desc = 'Gitsigns: Stage buffer'})
                    vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, {desc = 'Gitsigns: Undo stage hunk'})
                    vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, {desc = 'Gitsigns: Reset buffer'})
                    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, {desc = 'Gitsigns: Preview hunk'})
                    vim.keymap.set('n', '<leader>gb', function() gitsigns.blame_line({full=true}) end, {desc = 'Gitsigns: Show blame'})
                    vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame, {desc = 'Gitsigns: toggle blame on current line'})
                    vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, {desc = 'Gitsigns: diff this'})
                    vim.keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end, {desc = 'Gitsigns: diff this ~'})
                    vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted, {desc = 'Gitsigns: toggle delete lines'})

                    vim.keymap.set('v', '<leader>gs', function() gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, {desc = 'Gitsigns: Stage hunk'})
                    vim.keymap.set('v', '<leader>gr', function() gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, {desc = 'Gitsigns: Reset hunk'})
                end,
            }
        end,
        config = true,
    }
}
