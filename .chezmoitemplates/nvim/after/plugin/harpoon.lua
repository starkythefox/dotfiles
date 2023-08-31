local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = 'Add file to harpoon'})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = 'Open Harpoon quick menu'})
vim.keymap.set("n", "<leader>hn", ui.nav_next, {desc = 'Go to next file'})
vim.keymap.set("n", "<leader>hp", ui.nav_prev, {desc = 'Go to previous file'})

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, {desc = 'Go to 1st file'})
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, {desc = 'Go to 2nd file'})
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, {desc = 'Go to 3rd file'})
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, {desc = 'Go to 4th file'})
