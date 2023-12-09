local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local trouble = require('trouble.providers.telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
})

telescope.load_extension('dap')
{{ if .telescope_fzf_able }}telescope.load_extension('fzf'){{ end }}

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {desc = 'Find files'})
vim.keymap.set('n', '<leader>fgi', telescope_builtin.git_files, {desc = 'Find git files'})
vim.keymap.set('n', '<leader>fgr', telescope_builtin.live_grep, {desc = 'Live grep'})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {desc = 'Buffers'})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {desc = 'Help tags'})
vim.keymap.set('n', '<leader>fs', function()
	telescope_builtin.grep_string({search = vim.fn.input("Grep > ")});
end, {desc = 'Grep string'})
