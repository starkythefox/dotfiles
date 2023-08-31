require('refactoring').setup()

vim.keymap.set("x", "<leader>re", ":Refactor extract ", {desc = 'Extract method'})
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", {desc = 'Extract method to file'})
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", {desc = 'Extract to variable'})

vim.keymap.set({"n", "x"}, "<leader>ri", ":Refactor inline_var", {desc = 'Inline variable'})

vim.keymap.set("n", "<leader>rbh", ":Refactor extract_block", {desc = 'Extract block'})
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", {desc = 'Extract block to file'})
