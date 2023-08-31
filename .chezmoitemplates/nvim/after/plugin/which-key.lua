local wk = require('which-key')

wk.register({
    ['<C-n>'] = {'(LSP) Select next item'},
    ['<C-p>'] = {'(LSP) Select previons item'},
    ['<C-y>'] = {'(LSP) Confirm item'},
    ['<C-Space>'] = {'(LSP) Complete'},
}, {mode = 'n'})
