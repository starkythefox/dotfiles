return {
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'},
        },
        keys = {
            {'<leader>re', ':Refactor extract ', mode = 'x', desc = 'Extract method'},
            {'<leader>rf', ':Refactor extract_to_file ', mode = 'x', desc = 'Extract method to file'},
            {'<leader>rv', ':Refactor extract_var ', mode = 'x', desc = 'Extract to variable'},
            {'<leader>ri', ':Refactor inline_var', mode = {'n', 'x'}, desc = 'Inline variable'},
            {'<leader>rbh', ':Refactor extract_block', desc = 'Extract block'},
            {'<leader>rbf', ':Refactor extract_block_to_file', desc = 'Extract block to file'},
        },
        cmd = 'Refactor',
        config = true,
    },
}
