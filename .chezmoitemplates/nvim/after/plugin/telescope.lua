local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    }
})


vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
