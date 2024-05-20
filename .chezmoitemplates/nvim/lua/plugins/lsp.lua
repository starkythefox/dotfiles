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
        event = 'InsertEnter',
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
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
            {'mfussenegger/nvim-jdtls'},
            {
                'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
                name = 'sonarlint.nvim',
                branch = 'main',
            },
        },
        config = function ()
            local lsp_zero = require('lsp-zero')
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require('mason-lspconfig')
            local cmp_lsp = require('cmp_nvim_lsp')
            local jdtls = require('jdtls')
            local sonarlint = require('sonarlint')

            lsp_zero.extend_lspconfig()

            vim.diagnostic.config({
                virtual_text = {
                    source = true,
                },
                float = {
                    source = true,
                },
                update_in_insert = false,
            })

            local diagnostics_active = true
            local toggle_diagnotics = function ()
                if diagnostics_active then
                    vim.diagnostic.hide()
                else
                    vim.diagnostic.show()
                end

                diagnostics_active = not diagnostics_active
            end

            local diagnostic_goto = function(next, severity)
                local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
                severity = severity and vim.diagnostic.severity[severity] or nil
                return function()
                    go({severity = severity})
                end
            end

            lsp_zero.on_attach(function (_, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, vim.tbl_extend('force', opts, {desc = 'Display hover info'}))
                vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end, vim.tbl_extend('force', opts, {desc = 'Go to definition of the symbol'}))
                vim.keymap.set('n', '<leader>lD', function() vim.lsp.buf.declaration() end, vim.tbl_extend('force', opts, {desc = 'Go to declaration of the symbol'}))
                vim.keymap.set('n', '<leader>lc', function() vim.lsp.buf.code_action() end, vim.tbl_extend('force', opts, {desc = 'Select code action available'}))
                vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, vim.tbl_extend('force', opts, {desc = 'List all implementations for the symbol'}))
                vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.references() end, vim.tbl_extend('force', opts, {desc = 'List all references of the symbol'}))
                vim.keymap.set('n', '<leader>ln', function() vim.lsp.buf.rename() end, vim.tbl_extend('force', opts, {desc = 'Rename the symbol'}))
                vim.keymap.set('n', '<leader>ls', function() vim.lsp.buf.signature_help() end, vim.tbl_extend('force', opts, {desc = 'Display signature about the symbol'}))
                vim.keymap.set('n', '<leader>lw', function() vim.lsp.buf.workspace_symbol() end, vim.tbl_extend('force', opts, {desc = 'Get all the symbols in the workspace'}))
                vim.keymap.set('n', '<leader>ll', function() vim.diagnostic.open_float() end, vim.tbl_extend('force', opts, {desc = 'Show diagnotics'}))
                vim.keymap.set('n', '<leader>lF', function() vim.lsp.buf.format() end, vim.tbl_extend('force', opts, {desc = 'Format code'}))
                vim.keymap.set('n', '<leader>lt', toggle_diagnotics, vim.tbl_extend('force', opts, {desc = 'Toggle diagnostics'}))
                vim.keymap.set('n', ']d', diagnostic_goto(true), vim.tbl_extend('force', opts, {desc = 'Next diagnostic'}))
                vim.keymap.set('n', '[d', diagnostic_goto(false), vim.tbl_extend('force', opts, {desc = 'Previous diagnostic'}))
                vim.keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), vim.tbl_extend('force', opts, {desc = 'Next error'}))
                vim.keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), vim.tbl_extend('force', opts, {desc = 'Previous error'}))
                vim.keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), vim.tbl_extend('force', opts, {desc = 'Next warning'}))
                vim.keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), vim.tbl_extend('force', opts, {desc = 'Previous warning'}))
                vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, vim.tbl_extend('force', opts, {desc = 'Show signature help'}))
                vim.keymap.set('v', '<leader>lc', function() vim.lsp.buf.code_action() end, vim.tbl_extend('force', opts, {desc = 'Code actions'}))
                vim.keymap.set('v', '<leader>lF', function() vim.lsp.buf.format() end, vim.tbl_extend('force', opts, {desc = 'Code actions'}))
            end)

            mason_lspconfig.setup({
                ensure_installed = {
                    'angularls', 'bashls', 'csharp_ls', 'cssls', 'eslint',
                    'html', 'intelephense', 'jdtls', 'jsonls', 'lua_ls',
                    'marksman', 'pylsp', 'sqlls', 'tsserver', 'yamlls',
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
                                        },
                                    },
                                },
                            },
                        })
                    end,
                    jdtls = lsp_zero.noop,
                },
            })

{{- if .lsp_ccls_installed }}
            lspconfig.ccls.setup({
                init_options = {
                    cache = {
                        directory = '',
                    },
                },
            })
{{- end }}


            local java_cmds = vim.api.nvim_create_augroup('java_cmds', { clear = true })
            local cache_vars = {}

            local root_files = {
                '.git',
                'mvnw',
                'gradlew',
                'pom.xml',
                'build.gradle',
            }

            local features = {
                codelens = true,
                debugger = true,
            }

            local function get_jdtls_paths()
                if cache_vars.paths then
                    return cache_vars.paths
                end

                local path = {}

                path.data_dir = vim.fn.stdpath('cache') .. '/nvim-jdtls'

                local jdtls_install = require('mason-registry')
                    .get_package('jdtls')
                    :get_install_path()

                path.java_agent = jdtls_install .. '/lombok.jar'
                path.launcher_jar = vim.fn.glob(jdtls_install .. '/plugins/org.eclipse.equinox.launcher_*.jar')

                if vim.fn.has('mac') == 1 then
                    path.platform_config = jdtls_install .. '/config_mac'
                elseif vim.fn.has('unix') == 1 then
                    path.platform_config = jdtls_install .. '/config_linux'
                elseif vim.fn.has('win32') == 1 then
                    path.platform_config = jdtls_install .. '/config_win'
                end

                path.bundles = {}

                local java_test_path = require('mason-registry')
                    .get_package('java-test')
                    :get_install_path()

                local java_test_bundle = vim.split(
                    vim.fn.glob(java_test_path .. '/extension/server/*.jar'),
                    '\n'
                )

                if java_test_bundle[1] ~= '' then
                    vim.list_extend(path.bundles, java_test_bundle)
                end

                local java_debug_path = require('mason-registry')
                    .get_package('java-debug-adapter')
                    :get_install_path()

                local java_debug_bundle = vim.split(
                    vim.fn.glob(java_debug_path .. '/extension/server/com.microsoft.java.debug.plugin-*.jar'),
                    '\n'
                )

                if java_debug_bundle[1] ~= '' then
                    vim.list_extend(path.bundles, java_debug_bundle)
                end

                path.runtimes = {
{{- range .java_runtimes }}
                    {
                        name = {{.name | squote}},
                        path = {{.path | squote}},
                    },
{{- end }}
                }

                cache_vars.paths = path

                return path
            end

            local function enable_codelens(bufnr)
                pcall(vim.lsp.codelens.refresh)

                vim.api.nvim_create_autocmd('BufWritePost', {
                    buffer = bufnr,
                    group = java_cmds,
                    desc = 'refresh codelens',
                    callback = function()
                        pcall(vim.lsp.codelens.refresh)
                    end,
                })
            end

            local function enable_debugger(bufnr)
                require('jdtls').setup_dap({ hotcodereplace = 'auto' })
                require('jdtls.dap').setup_dap_main_class_configs()

                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<leader>df', "<cmd>lua require('jdtls').test_class()<cr>", opts)
                vim.keymap.set('n', '<leader>dn', "<cmd>lua require('jdtls').test_nearest_method()<cr>", opts)
            end

            local function jdtls_on_attach(client, bufnr)
                if features.debugger then
                    enable_debugger(bufnr)
                end

                if features.codelens then
                    enable_codelens(bufnr)
                end

                local opts = { buffer = bufnr }
                vim.keymap.set('n', '<A-o>', "<cmd>lua require('jdtls').organize_imports()<cr>", opts)
                vim.keymap.set('n', 'crv', "<cmd>lua require('jdtls').extract_variable()<cr>", opts)
                vim.keymap.set('x', 'crv', "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", opts)
                vim.keymap.set('n', 'crc', "<cmd>lua require('jdtls').extract_constant()<cr>", opts)
                vim.keymap.set('x', 'crc', "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", opts)
                vim.keymap.set('x', 'crm', "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", opts)
            end

            local function jdtls_setup(event)
                local jdtls = require('jdtls')

                local path = get_jdtls_paths()
                local data_dir = path.data_dir .. '/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

                if cache_vars.capabilities == nil then
                    jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

                    local ok_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
                    cache_vars.capabilities = vim.tbl_deep_extend(
                        'force',
                        vim.lsp.protocol.make_client_capabilities(),
                        ok_cmp and cmp_lsp.default_capabilities() or {}
                    )
                end

                local cmd = {
                    'java',
                    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                    '-Dosgi.bundles.defaultStartLevel=4',
                    '-Declipse.product=org.eclipse.jdt.ls.core.product',
                    '-Dlog.protocol=true',
                    '-Dlog.level=ALL',
                    '-javaagent:' .. path.java_agent,
                    '-Xms1g',
                    '--add-modules=ALL-SYSTEM',
                    '--add-opens',
                    'java.base/java.util=ALL-UNNAMED',
                    '--add-opens',
                    'java.base/java.lang=ALL-UNNAMED',

                    '-jar',
                    path.launcher_jar,

                    '-configuration',
                    path.platform_config,

                    '-data',
                    data_dir,
                }

                local lsp_settings = {
                    java = {
                        -- jdt = {
                        --   ls = {
                        --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
                        --   }
                        -- },
                        eclipse = {
                            downloadSources = true,
                        },
                        configuration = {
                            updateBuildConfiguration = 'interactive',
                            runtimes = path.runtimes,
                        },
                        maven = {
                            downloadSources = true,
                        },
                        implementationsCodeLens = {
                            enabled = true,
                        },
                        referencesCodeLens = {
                            enabled = true,
                        },
                        inlayHints = {
                            parameterNames = {
                                enabled = 'all' -- literals, all, none
                            }
                        },
                        format = {
                            enabled = true,
                            -- settings = {
                            --   profile = 'asdf'
                            -- },
                        }
                    },
                    signatureHelp = {
                        enabled = true,
                    },
                    completion = {
                        favoriteStaticMembers = {
                            'org.hamcrest.MatcherAssert.assertThat',
                            'org.hamcrest.Matchers.*',
                            'org.hamcrest.CoreMatchers.*',
                            'org.junit.jupiter.api.Assertions.*',
                            'java.util.Objects.requireNonNull',
                            'java.util.Objects.requireNonNullElse',
                            'org.mockito.Mockito.*',
                        },
                    },
                    contentProvider = {
                        preferred = 'fernflower',
                    },
                    extendedClientCapabilities = jdtls.extendedClientCapabilities,
                    sources = {
                        organizeImports = {
                            starThreshold = 9999,
                            staticStarThreshold = 9999,
                        }
                    },
                    codeGeneration = {
                        useBlocks = true,
                    },
                }

                jdtls.start_or_attach({
                    cmd = cmd,
                    settings = lsp_settings,
                    on_attach = jdtls_on_attach,
                    capabilities = cache_vars.capabilities,
                    root_dir = jdtls.setup.find_root(root_files),
                    flags = {
                        allow_incremental_sync = true,
                    },
                    init_options = {
                        bundles = path.bundles,
                    },
                })
            end

            vim.api.nvim_create_autocmd('FileType', {
                group = java_cmds,
                pattern = { 'java' },
                desc = 'Setup jdtls',
                callback = jdtls_setup,
            })

            local bin_name = 'sonarlint-language-server'

            if vim.fn.has 'win32' == 1 then
                bin_name = bin_name .. '.cmd'
            end

            sonarlint.setup({
                server = {
                    cmd = {
                        bin_name,
                        -- Ensure that sonarlint-language-server uses stdio channel
                        '-stdio',
                        '-analyzers',
                        -- paths to the analyzers you need, using those for python and java in this example
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarpython.jar'),
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarcfamily.jar'),
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarjava.jar'),
                        -- others
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarjs.jar'),
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarphp.jar'),
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonartext.jar'),
                        vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarxml.jar'),
                    },
                },
                filetypes = {
                    -- Tested and working
                    'python',
                    'cpp',
                    -- Requires nvim-jdtls, otherwise an erro message will be printed
                    'java',
                    -- Untested others
                    'c',
                    'js',
                    'javascript',
                    'ts',
                    'typescript',
                    'php',
                    'xml',
                    'html',
                    'css',
                    'scss',
                    'vue',
                },
            })
        end,
    },
    {
        'j-hui/fidget.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = {}
    },
}
