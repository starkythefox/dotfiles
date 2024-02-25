return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        keys = {
            {'<leader>tf', desc = 'Find files'},
            {'<leader>tg', desc = 'Find git files'},
            {'<leader>tl', desc = 'Live grep'},
            {'<leader>tb', desc = 'Buffers'},
            {'<leader>th', desc = 'Help tags'},
            {'<leader>ts', desc = 'Grep string'},
        },
        cmd = 'Telescope',
        dependencies = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-dap.nvim'},
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function ()
                    return vim.fn.executable 'make' == 1
                end
            },
            {'folke/trouble.nvim'},
        },
        opts = function ()
            local trouble = require('trouble.providers.telescope')

            return {
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--hidden',
                    },
                    mappings = {
                        i = { ['<c-t>'] = trouble.open_with_trouble },
                        n = { ['<c-t>'] = trouble.open_with_trouble },
                    },
                },
                pickers = {
                    find_files = {
                        no_ignore = true,
                        hidden = true,
                    },
                    git_files = {
                        hidden = true,
                    },
                    grep_string = {
                        no_ignore = true,
                        hidden = true,
                    },
                    live_grep = {
                        no_ignore = true,
                        hidden = true,
                    },
                },
            }
        end,
        config = function(_, opts)
            local telescope = require('telescope')
            local builtin = require('telescope.builtin')

            telescope.setup(opts)

            telescope.load_extension('dap')
{{- if .telescope_fzf_able }}
            telescope.load_extension('fzf')
{{- end }}

            vim.keymap.set('n', '<leader>tf', builtin.find_files, {desc = 'Find files'})
            vim.keymap.set('n', '<leader>tg', builtin.git_files, {desc = 'Find git files'})
            vim.keymap.set('n', '<leader>tl', builtin.live_grep, {desc = 'Live grep'})
            vim.keymap.set('n', '<leader>tb', builtin.buffers, {desc = 'Buffers'})
            vim.keymap.set('n', '<leader>th', builtin.help_tags, {desc = 'Help tags'})
            vim.keymap.set('n', '<leader>ts', function() builtin.grep_string({search = vim.fn.input('Grep > ')}) end, {desc = 'Grep string'})
        end,
    },
}
