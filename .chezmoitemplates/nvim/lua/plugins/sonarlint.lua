return {
    {
        'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
        name = 'sonarlint.nvim',
        branch = 'main',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'williamboman/mason-lspconfig.nvim'},
            {'mfussenegger/nvim-jdtls'}, -- required
        },
        opts = function ()
            local bin_name = 'sonarlint-language-server'

            if vim.fn.has 'win32' == 1 then
                bin_name = bin_name .. '.cmd'
            end

            return {
                server = {
                    cmd = {
                        bin_name,
                        -- Ensure that sonarlint-language-server uses stdio channel
                        '-stdio',
                        '-analyzers',
                        -- paths to the analyzers you need, using those for python and java in this example 
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
                        -- others
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarphp.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonartext.jar"),
                        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarxml.jar"),
                    }
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
                }
            }
        end,
    }
}
