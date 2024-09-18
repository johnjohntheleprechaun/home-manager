vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function open_nvim_tree()
    local bufname = vim.fn.bufname()
    require("nvim-tree.api").tree.open()
    if bufname ~= "" then
        vim.cmd("wincmd l");
    end
end

-- basic setup
require("nvim-tree").setup {
    hijack_cursor = true,
}

vim.api.nvim_set_keymap("n", "<F12>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = open_nvim_tree,
})

vim.api.nvim_create_autocmd("TabNewEntered", {
    callback = open_nvim_tree,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end,
})
