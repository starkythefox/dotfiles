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
                ['<C-t>'] = {'Open with trouble'},
                ["]f"] = {"Next function start"},
                ["[f"] = {"Previous function start"},
                ["]c"] = {"Next class start"},
                ["[c"] = {"Previous class start"},
                ["]F"] = {"Next function end"},
                ["[F"] = {"Previous function end"},
                ["[C"] = {"Previous class end"},
                ["]C"] = {"Next class end"},
            }, {mode = 'n'})

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
