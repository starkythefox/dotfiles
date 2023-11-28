vim.api.nvim_exec('language {{ .neovim_locale }}', true)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

{{ if (index . "neovim_python3_host_prog") }}vim.g.python3_host_prog = {{ .neovim_python3_host_prog | squote }}{{ end }}
{{ if (index . "neovim_node_host_prog") }}vim.g.node_host_prog = {{ .neovim_node_host_prog | squote }}{{ end }}
