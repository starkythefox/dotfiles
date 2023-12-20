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

                    vim.keymap.set('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gitsigns.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    vim.keymap.set('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gitsigns.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true})

                    vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, {desc = 'Gitsigns: Stage hunk'})
                    vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, {desc = 'Gitsigns: Reset hunk'})
                    vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Gitsigns: Stage hunk'})
                    vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Gitsigns: Reset hunk'})
                    vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, {desc = 'Gitsigns: Stage buffer'})
                    vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = 'Gitsigns: Undo stage hunk'})
                    vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer, {desc = 'Gitsigns: Reset buffer'})
                    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, {desc = 'Gitsigns: Preview hunk'})
                    vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = 'Gitsigns: Show blame'})
                    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = 'Gitsigns: toggle blame on current line'})
                    vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, {desc = 'Gitsigns: diff this'})
                    vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end, {desc = 'Gitsigns: diff this ~'})
                    vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted, {desc = 'Gitsigns: toggle delete lines'})
                end,
            }
        end,
    }
}
