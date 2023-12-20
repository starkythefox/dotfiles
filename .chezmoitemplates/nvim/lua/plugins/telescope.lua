return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        keys = {
            {'<leader>ff', function() require('telescope.builtin').find_files() end, 'n', desc = 'Find files'},
            {'<leader>fgi', function() require('telescope.builtin').git_files() end, 'n', desc = 'Find git files'},
            {'<leader>fgr', function() require('telescope.builtin').live_grep() end, 'n', desc = 'Live grep'},
            {'<leader>fb', function() require('telescope.builtin').buffers() end, 'n', desc = 'Buffers'},
            {'<leader>fh', function() require('telescope.builtin').help_tags() end, 'n', desc = 'Help tags'},
            {'<leader>fs', function() require('telescope.builtin').grep_string({search = vim.fn.input('Grep > ')}) end, 'n', desc = 'Grep string'},
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
                        hidden = true,
                    },
                    git_files = {
                        hidden = true,
                    },
                    grep_string = {
                        hidden = true,
                    },
                    live_grep = {
                        hidden = true,
                    },
                },
            }
        end,
        config = function(_, opts)
            local telescope = require('telescope')

            telescope.setup(opts)

            telescope.load_extension('dap')
{{- if .telescope_fzf_able }}
            telescope.load_extension('fzf')
{{- end }}
        end,
    },
}
