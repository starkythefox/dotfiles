return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = {'BufReadPost', 'BufNewFile', 'BufWritePre'},
        dependencies = {
            {'nvim-treesitter/nvim-treesitter-textobjects'},
            {'nvim-treesitter/nvim-treesitter-context'},
        },
        config = function ()
            local treesitter = require('nvim-treesitter.configs')
            local treesitter_context = require('treesitter-context')

            treesitter.setup({
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]F"] = "@function.outer",
                            ["]C"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[F"] = "@function.outer",
                            ["[C"] = "@class.outer",
                        },
                    },
                },
                ensure_installed = {
                    'bash', 'c', 'c_sharp', 'cpp', 'css', 'csv', 'diff',
                    'git_config', 'git_rebase', 'gitattributes',
                    'gitcommit', 'gitignore', 'html', 'ini', 'java',
                    'javascript', 'json', 'lua', 'markdown',
                    'markdown_inline', 'php', 'python', 'regex',
                    'requirements', 'query', 'scss', 'sql', 'toml',
                    'typescript', 'vim', 'vimdoc', 'vue', 'xml',
                    'yaml',
                },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
            treesitter_context.setup({
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
                zindex = 20,
                on_attach = nil,
            })
        end,
    },
    {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
    },
}
