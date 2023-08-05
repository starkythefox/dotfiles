local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.taplo,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.uncrustify,
    null_ls.builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.flake8.with({
        prefer_local = ".venv/bin",
    }),
    null_ls.builtins.diagnostics.mypy.with({
        prefer_local = ".venv/bin",
    }),
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.code_actions.eslint.with({
        prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.spell,
}

null_ls.setup({
    sources = sources,
})
