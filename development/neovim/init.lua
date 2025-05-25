-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Display settings
vim.opt.wrap = false
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Disable mouse
vim.opt.mouse = ""

-- Colorscheme
vim.cmd.colorscheme("dracula")

-- Markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})

-- Clipboard
vim.g.clipboard = "osc52"
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        if vim.v.event.operator == "y" then
            local yanked = vim.fn.getreg('"')
            local encoded = vim.fn.system("base64", yanked)
            local esc = string.char(27)
            local bel = string.char(7)
            local osc52 = string.format("%s]52;c;%s%s", esc, encoded:gsub("\n", ""), bel)
            vim.api.nvim_chan_send(vim.v.stderr, osc52)
        end
    end,
})
