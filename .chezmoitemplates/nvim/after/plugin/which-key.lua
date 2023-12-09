local wk = require('which-key')

wk.register({
    ['<C-n>'] = {'(LSP) Select next item'},
    ['<C-p>'] = {'(LSP) Select previons item'},
    ['<C-y>'] = {'(LSP) Confirm item'},
    ['<C-Space>'] = {'(LSP) Complete'},
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
    ['<C-t>'] = {'Open with trouble'},
}, {mode = 'i'})
