function ColorVim(color)
    color = color or "terafox"
    vim.cmd.colorscheme(color)
end

ColorVim("terafox")
