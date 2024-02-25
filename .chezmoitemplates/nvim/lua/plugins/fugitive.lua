return {
    {
        'tpope/vim-fugitive',
        cmd = {'G', 'Git'},
        keys = {
            {'<leader>gg', vim.cmd.Git, desc = 'Open git'}
        },
        config = true,
    },
}
