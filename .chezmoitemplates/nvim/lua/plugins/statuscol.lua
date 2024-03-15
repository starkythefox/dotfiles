return {
    {
        "luukvbaal/statuscol.nvim", config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = false,
                segments = {
                    {
                        sign = {name = {".*"}, maxwidth = 1, colwidth = 1, auto = true, wrap = true},
                        click = "v:lua.ScSa",
                    },
                    {
                        sign = {name = {"Diagnostic"}, maxwidth = 1, auto = true},
                        click = "v:lua.ScSa",
                    },
                    {
                        text = {builtin.lnumfunc}, click = "v:lua.ScLa",
                    },
                    {
                        text = {builtin.foldfunc}, click = "v:lua.ScFa",
                    },
                    {
                        sign = {namespace = {"gitsign*"}, maxwidth = 1, colwidth = 1, auto = false},
                        click = "v:lua.ScSa",
                    },
                }
            })
        end,
    }
}
