return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        keys = {
            {'<leader>Du', desc = 'Dap UI'},
            {'<leader>De', mode = {'n', 'v'}, desc = 'Eval'},
        },
        opts = {
            icons = {
                expanded = '▾',
                collapsed = '▸',
                current_frame = '*'
            },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        },
        config = function (_, opts)
            local dap = require('dap')
            local dapui = require('dapui')

            dapui.setup(opts)
            vim.keymap.set('n', '<leader>Du', function() dapui.toggle({}) end)
            vim.keymap.set({'n', 'v'}, '<leader>De', dapui.eval)

            vim.keymap.set('n', '<F5>', dap.continue, {desc = 'Debug; Start/Continue'})
            vim.keymap.set('n', '<F1>', dap.step_into, {desc = 'Debug: Step Into'})
            vim.keymap.set('n', '<F2>', dap.step_over, {desc = 'Debug: Step Over'})
            vim.keymap.set('n', '<F3>', dap.step_out, {desc = 'Debug: Step Out'})
            vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {desc = 'Debug: Toggle Breakpoint'})
            vim.keymap.set('n', '<leader>B', function()
                dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end, {desc = 'Debug: Set Breakpoint'})

            vim.keymap.set('n', '<F7>', dapui.toggle, {desc = 'Debug: See last session result.'})

            dap.listeners.after.event_initialized['dapui_config'] = dapui.open
            dap.listeners.before.event_terminated['dapui_config'] = dapui.close
            dap.listeners.before.event_exited['dapui_config'] = dapui.close
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim'
        },
        cmd = {'DapInstall', 'DapUninstall'},
        opts = {
            automatic_setup = true,
            handlers = {},
            ensure_installed = {},
        },
    }
}
