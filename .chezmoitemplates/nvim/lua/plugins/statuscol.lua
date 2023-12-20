return {
    {
        "luukvbaal/statuscol.nvim", config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                relculright = true,
                segments = {
                    {
                        sign = {name = {"Diagnostic"}, maxwidth = 1, auto = true},
                        click = "v:lua.ScSa"
                    },
                    {
                        text = {builtin.lnumfunc}, click = "v:lua.ScLa",
                    },
                    {
                        sign = {name = {".*"}, maxwidth = 1, colwidth = 1, auto = true, wrap = true},
                        click = "v:lua.ScSa"
                    },
                    {
                        sign = {namespace = {"gitsign*"}, maxwidth = 1, colwidth = 1, auto = false},
                        click = "v:lua.ScSa"
                    },
                    {
                        text = {builtin.foldfunc}, click = "v:lua.ScFa"
                    },
                }
            })
        end,
    }
}
