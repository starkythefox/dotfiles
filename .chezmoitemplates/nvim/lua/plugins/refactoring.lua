return {
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'},
        },
        keys = {
            {"<leader>re", ":Refactor extract ", "x", desc = 'Extract method'},
            {"<leader>rf", ":Refactor extract_to_file ", "x", desc = 'Extract method to file'},
            {"<leader>rv", ":Refactor extract_var ", "x", desc = 'Extract to variable'},
            {"<leader>ri", ":Refactor inline_var", {"n", "x"}, desc = 'Inline variable'},
            {"<leader>rbh", ":Refactor extract_block", "n", desc = 'Extract block'},
            {"<leader>rbf", ":Refactor extract_block_to_file", "n", desc = 'Extract block to file'},
        }
    },
}
