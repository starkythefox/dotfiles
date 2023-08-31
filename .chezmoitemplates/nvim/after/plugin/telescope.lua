local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.setup({
    pickers = {
        find_files = {
            hidden = true
        }
    }
})


vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {desc = 'Find files'})
vim.keymap.set('n', '<leader>fgi', telescope_builtin.git_files, {desc = 'Find git files'})
vim.keymap.set('n', '<leader>fgr', telescope_builtin.live_grep, {desc = 'Live grep'})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {desc = 'Buffers'})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {desc = 'Help tags'})
vim.keymap.set('n', '<leader>fs', function()
	telescope_builtin.grep_string({search = vim.fn.input("Grep > ")});
end, {desc = 'Grep string'})
