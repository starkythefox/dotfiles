local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        set_sources = 'recommended'
    }
})

lsp.ensure_installed({
    'angularls', 'bashls', 'cssls', 'eslint', 'html', 'intelephense',
    'java_language_server', 'jsonls', 'lua_ls', 'marksman', 'sqlls',
    'tsserver', 'yamlls', 'pylsp'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

lsp.on_attach(function(client, bufnr)
    --    lsp.default_keymaps({buffer = bufnr})
    -- local rc = client.resolved_capabilities

    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc = 'Display hover info'})
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc = 'Go to definition of the symbol'})
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, {buffer = bufnr, remap = false, desc = 'Go to declaration of the symbol'})
    vim.keymap.set("n", "gc", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc = 'Select code action available'})
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, {buffer = bufnr, remap = false, desc = 'List all implementations for the symbol'})
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, {buffer = bufnr, remap = false, desc = 'List all references of the symbol'})
    vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc = 'Rename the symbol'})
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = 'Display signature about the symbol'})
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = bufnr, remap = false, desc = 'Show signature help'})
    vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol() end, {buffer = bufnr, remap = false, desc = 'Get all the symbols in the workspace'})
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc = 'Show diagnotics'})
    vim.keymap.set("n", "]d", diagnostic_goto(true), {buffer = bufnr, remap = false, desc = 'Next diagnostic'})
    vim.keymap.set("n", "[d", diagnostic_goto(false), {buffer = bufnr, remap = false, desc = 'Previous diagnostic'})
    vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), {buffer = bufnr, remap = false, desc = "Next error" })
    vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), {buffer = bufnr, remap = false, desc = "Previous error"})
    vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), {buffer = bufnr, remap = false, desc = "Next warning"})
    vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), {buffer = bufnr, remap = false, desc = "Previous warning"})
    vim.keymap.set("n", "gF", function() vim.lsp.buf.format() end, {buffer = bufnr, remap = false, desc = 'Format code'})
end)

-- (Optional) Configure lua language server for neovim
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

{{ if .lsp_ccls_installed -}}
lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = "";
    };
  }
}
{{- end }}

lspconfig.efm.setup({
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {
                    lintCommand = "mypy --show-column-numbers",
                    lintFormats = {
                        '%f:%l:%c: %trror: %m',
                        '%f:%l:%c: %tarning: %m',
                        '%f:%l:%c: %tote: %m'
                    },
                    lintIgnoreExitCode = true,
                },
            },
        }
    }
})


lsp.setup()
