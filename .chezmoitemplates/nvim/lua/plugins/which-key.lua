return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function ()
            local wk = require('which-key')

            wk.register({
                g = {name = '+lsp'},
                ['<C-t>'] = {'Open with trouble'},
                [']'] = {
                    name = '+next',
                    f = {'Next function start'},
                    c = {'Next class start'},
                    F = {'Next function end'},
                    C = {'Next class end'},
                },
                ['['] = {
                    name = '+previous',
                    C = {'Previous class end'},
                    f = {'Previous function start'},
                    c = {'Previous class start'},
                    F = {'Previous function end'},
                },
                ['<leader>'] = {
                    name = '+leader',
                    c = {name = '+colorizer'},
                    g = {
                        name = '+git',
                        t = {name = '+toggle'},
                    },
                    p = {name = '+project'},
                    r = {
                        name = '+refactoring',
                        b = {name = '+block'},
                    },
                    t = {name = '+telescope'},
                    x = {name = '+trouble'},
                    D = {name = '+dap'},
                }
            }, {mode = 'n'})

            wk.register({
                ['<leader>'] = {
                    name = '+leader',
                    r = {
                        {name = 'refactoring'}
                    },
                },
            }, {mode = 'v'})

            wk.register({
                ['<C-p>'] = {'(LSP) Select previons item'},
                ['<C-n>'] = {'(LSP) Select next item'},
                ['<C-u>'] = {'(LSP) Scroll docs up'},
                ['<C-d>'] = {'(LSP) Scroll docs down'},
                ['<C-y>'] = {'(LSP) Confirm item'},
                ['<C-e>'] = {'(LSP) Abort'},
                ['<C-Space>'] = {'(LSP) Complete'},
                ['<C-f>'] = {'(LSP) Jump forward'},
                ['<C-b>'] = {'(LSP) Jump backward'},
                ['<C-t>'] = {'Open with trouble'},
            }, {mode = 'i'})
        end
    },
}
