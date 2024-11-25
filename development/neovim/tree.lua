vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- basic setup
require("nvim-tree").setup {
    hijack_cursor = true,
    reload_on_bufenter = true,
    diagnostics = { enable = true },
    git = { enable = true },
    auto_reload_on_write = true,
    view = {float = {
        enable = true,
        open_win_config = function()
            local width = vim.api.nvim_get_option("columns")
            local height = vim.api.nvim_get_option("lines")
            local win_width = 40
            local win_height = height - 6

            return {
                relative = "editor",
                border = "rounded",
                width = win_width,
                height = win_height,
                row = (height - win_height) / 2 - 1,
                col = (width - win_width) / 2,
            }
        end
    }},
}

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function()
    if vim.fn.argc() == 0 and vim.fn.bufnr("$") == 1 and vim.api.nvim_buf_get_name(0) == "" then
        vim.cmd("NvimTreeOpen")
    end
end})

-- open and close
function close_nvim_tree_if_open()
    local view = require("nvim-tree.view")
    if view.is_visible() then
        vim.cmd("NvimTreeClose")
    end
end

vim.api.nvim_set_keymap("n", "<F12>", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>", ":lua close_nvim_tree_if_open()<CR>", { noremap = true, silent = true })
