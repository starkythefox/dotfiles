vim.api.nvim_exec2('language {{ .neovim_locale }}', {output = true})

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.fillchars:append {
    fold = ' ',
    foldopen = '',
    foldclose = '',
    foldsep = ' ',
}

vim.opt.list = true

vim.opt.listchars:append {
    tab = '-->',
    trail = '-',
    space = '.',
    nbsp = '␣',
    eol = '$',
}

vim.opt.foldenable = true
vim.opt.foldcolumn = 'auto'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'java' },
    desc = 'Set colorcolumn to 120 for Java',
    callback = function () vim.opt_local.colorcolumn = '120' end,
})

{{ if (index . "neovim_python3_host_prog") }}vim.g.python3_host_prog = {{ .neovim_python3_host_prog | squote }}{{ end }}
{{ if (index . "neovim_node_host_prog") }}vim.g.node_host_prog = {{ .neovim_node_host_prog | squote }}{{ end }}
