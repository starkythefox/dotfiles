return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                version = "v2.*",
                dependencies = {
                    {'rafamadriz/friendly-snippets'},
                    {'honza/vim-snippets'},
                },
                config = function ()
                    local vsc_loader = require('luasnip.loaders.from_vscode')
                    local snipmate_loader = require('luasnip.loaders.from_snipmate')

                    vsc_loader.lazy_load()
                    snipmate_loader.lazy_load()
                end,
            },
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},
            {'saadparwaiz1/cmp_luasnip'},
        },
        config = function ()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_action = lsp_zero.cmp_action()
            local luasnip = require('luasnip')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp'},
                    { name = 'luasnip' },
                    { name = 'nvim_lua' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm({select = true}),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
            })
        end,
    },

    -- LSP Support
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = function ()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            local diagnostic_goto = function(next, severity)
                local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
                severity = severity and vim.diagnostic.severity[severity] or nil
                return function()
                    go({severity = severity})
                end
            end

            lsp_zero.on_attach(function (_, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.tbl_extend('force', opts, {desc = 'Display hover info'}))
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, vim.tbl_extend('force', opts, {desc = 'Go to definition of the symbol'}))
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, vim.tbl_extend('force', opts, {desc = 'Go to declaration of the symbol'}))
                vim.keymap.set("n", "gc", function() vim.lsp.buf.code_action() end, vim.tbl_extend('force', opts, {desc = 'Select code action available'}))
                vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, vim.tbl_extend('force', opts, {desc = 'List all implementations for the symbol'}))
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, vim.tbl_extend('force', opts, {desc = 'List all references of the symbol'}))
                vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end, vim.tbl_extend('force', opts, {desc = 'Rename the symbol'}))
                vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, vim.tbl_extend('force', opts, {desc = 'Display signature about the symbol'}))
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, vim.tbl_extend('force', opts, {desc = 'Show signature help'}))
                vim.keymap.set("n", "gw", function() vim.lsp.buf.workspace_symbol() end, vim.tbl_extend('force', opts, {desc = 'Get all the symbols in the workspace'}))
                vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, vim.tbl_extend('force', opts, {desc = 'Show diagnotics'}))
                vim.keymap.set("n", "]d", diagnostic_goto(true), vim.tbl_extend('force', opts, {desc = 'Next diagnostic'}))
                vim.keymap.set("n", "[d", diagnostic_goto(false), vim.tbl_extend('force', opts, {desc = 'Previous diagnostic'}))
                vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), vim.tbl_extend('force', opts, {desc = "Next error"}))
                vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), vim.tbl_extend('force', opts, {desc = "Previous error"}))
                vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), vim.tbl_extend('force', opts, {desc = "Next warning"}))
                vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), vim.tbl_extend('force', opts, {desc = "Previous warning"}))
                vim.keymap.set("n", "gF", function() vim.lsp.buf.format() end, vim.tbl_extend('force', opts, {desc = 'Format code'}))
            end)

            local mason_lspconfig = require('mason-lspconfig')
            local lspconfig = require('lspconfig')

            mason_lspconfig.setup({
                ensure_installed = {
                    'angularls', 'bashls', 'csharp_ls', 'cssls',
                    'eslint', 'html', 'intelephense', 'java_language_server',
                    'jsonls', 'lua_ls', 'marksman', 'pylsp', 'sqlls',
                    'tsserver', 'yamlls',
                },
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function ()
                        lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
                    end,
                    pylsp = function ()
                        lspconfig.pylsp.setup({
                            settings = {
                                pylsp = {
                                    plugins = {
                                        rope_autoimport = {
                                            enabled = true,
                                        },
                                        isort = {
                                            enabled = true,
                                        },
                                        pylsp_mypy = {
                                            enabled = true,
                                            live_mode = true,
                                            report_progress = true,
                                            exclude = {
                                                'tests/*',
                                            },
                                        }
                                    },
                                },
                            },
                        })
                    end,
                }
            })

{{- if .lsp_ccls_installed }}
            lspconfig.ccls.setup({
                init_options = {
                    cache = {
                        directory = "",
                    },
                },
            })
{{- end }}
        end,
    },
    {
        'j-hui/fidget.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = {}
    },
}
