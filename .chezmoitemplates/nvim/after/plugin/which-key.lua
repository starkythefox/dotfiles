local wk = require('which-key')

wk.register({
    ['<leader>'] = {
        a = {'Add file to harpoon'},
        d = {'Delete into the void'},
        f = {
            name = 'Telescope', -- optional group name
            f = {'Find file'}, -- create a binding with label
            g = {'Live grep'},
            b = {'Buffers'},
            h = {'Help tags'},
            s = {'Grep string'},
        },
        git = {'Open git'},
        h = {
            name = 'Harpoon',
            n = {'Go to next file'},
            p = {'Go to previous file'},
            ['1'] = {'Go to 1st file'},
            ['2'] = {'Go to 2nd file'},
            ['3'] = {'Go to 3rd file'},
            ['4'] = {'Go to 4th file'},
        },
        j = {'Next item in location list'},
        k = {'Previous item in location list'},
        p = {
            name = 'Project',
            v = { 'View project explorer' }
        },
        r = {
            name = 'Refactoring',
            i = {'Inline variable'},
            bh = {'Extract block'},
            bf = {'Extract block to file'},
        },
        u = {'Undo tree'},
        y = {'Yank into system clipboard'},
        Y = {'Yank to end of line into system clipboard'},
        x = {'Toggle Trouble quickfix list'},
    },
    g = {
        name = 'LSP',
        c = {'Select code action available'},
        d = {'Go to definition of the symbol'},
        D = {'Go to declaration of the symbol'},
        F = {'Format code'},
        i = {'List all implementations for the symbol'},
        l = {'Show diagnotics'},
        n = {'Rename the symbol'},
        r = {'List all references of the symbol'},
        s = {'Display signature about the symbol'},
        w = {'Get all the symbols in the workspace'},
    },
    n = {'Move to next search term, cursor in the middle'},
    J = {'Append line below with a space'},
    K = {'Display hover info'},
    N = {'Move to previous search term, cursor in the middle'},
    ['<C-d>'] = {'Half-page jump down, cursor in middle'},
    ['<C-e>'] = {'Open Harpoon quick menu'},
    ['<C-j>'] = {'Next item in quickfix list'},
    ['<C-n>'] = {'(LSP) Select next item'},
    ['<C-k>'] = {'Previous item in quickfix list'},
    ['<C-p>'] = {'(LSP) Select previons item'},
    ['<C-u>'] = {'Half-page jump up, cursor in middle'},
    ['<C-y>'] = {'(LSP) Confirm item'},
    ['<C-Space>'] = {'(LSP) Complete'},
    ['[d'] = {'Next diagnostic'},
    [']d'] = {'Previous diagnostic'},
}, {mode = 'n'})

wk.register({
    ['<C-h>'] = {'Show signature help'},
}, {mode = 'i'})

wk.register({
    ['<leader>'] = {
        p = {'Paste without losing previous clipboard item'},
    },
    r = {
        name = 'Refactoring',
        e = {'Extract method'},
        f = {'Extract method to file'},
        v = {'Extract to variable'},
        i = {'Inline variable'},
    },
}, {mode = 'x'})

wk.register({
    ['<leader>'] = {
        d = {'Delete into the void'},
        y = {'Yank into system clipboard'},
    },
    J = {'Move block up'},
    K = {'Move block down'},
}, {mode = 'v'})
