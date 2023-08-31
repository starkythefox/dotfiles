local dap = require('dap')
local dapui = require('dapui')
local mason_nvim_dap = require('mason-nvim-dap')

mason_nvim_dap.setup({
    automatic_setup = true,
    handlers = {},
    ensure_installed = {},
})

vim.keymap.set('n', '<F5>', dap.continue, {desc = 'Debug; Start/Continue'})
vim.keymap.set('n', '<F1>', dap.step_into, {desc = 'Debug: Step Into'})
vim.keymap.set('n', '<F2>', dap.step_over, {desc = 'Debug: Step Over'})
vim.keymap.set('n', '<F3>', dap.step_out, {desc = 'Debug: Step Out'})
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {desc = 'Debug: Toggle Breakpoint'})
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, {desc = 'Debug: Set Breakpoint'})

dapui.setup({
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don't feel like these are good choices.
    icons = {expanded = '▾', collapsed = '▸', current_frame = '*'},
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
})

vim.keymap.set('n', '<F7>', dapui.toggle, {desc = 'Debug: See last session result.'})

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
