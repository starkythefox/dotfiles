vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = 'View project explorer'})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'Move block up'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'Move block down'})

vim.keymap.set("n", "J", "mzJ`z", {desc = 'Append line below with a space'})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = 'Half-page jump down, cursor in middle'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = 'Half-page jump up, cursor in middle'})
vim.keymap.set("n", "n", "nzzzv", {desc = 'Move to next search term, cursor in the middle'})
vim.keymap.set("n", "N", "Nzzzv", {desc = 'Move to previous search term, cursor in the middle'})

vim.keymap.set("x", "<leader>p", [["_dP]], {desc = 'Paste without losing previous clipboard item'})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = 'Yank into system clipboard'})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = 'Yank to end of line into system clipboard'})
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {desc = 'Delete into the void'})

{{ if eq .chezmoi.os "linux" -}}
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc = 'Fuzzy find projects'})

{{- end -}}
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {desc = 'Next item in quickfix list'})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {desc = 'Previous item in quickfix list'})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = 'Next item in location list'})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = 'Previous item in location list'})
