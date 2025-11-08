vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- basic setup
require("nvim-tree").setup({
    hijack_cursor = true,
    reload_on_bufenter = true,
    diagnostics = { enable = true },
    git = { enable = true },
    auto_reload_on_write = true,
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local width = vim.api.nvim_win_get_width(0)
                local height = vim.api.nvim_win_get_height(0)
                local win_width = 40
                local win_height = height - 6

                return {
                    relative = "editor",
                    width = win_width,
                    height = win_height,
                    row = (height - win_height) / 2 - 1,
                    col = (width - win_width) / 2,
                }
            end,
        },
    },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if vim.fn.argc() == 0 and vim.fn.bufnr("$") == 1 and vim.api.nvim_buf_get_name(0) == "" then
            vim.cmd("NvimTreeOpen")
        end
    end,
})

-- open and close
function Close_Nvim_Tree_If_Open()
    local view = require("nvim-tree.view")
    if view.is_visible() then
        vim.cmd("NvimTreeClose")
    end
end

vim.api.nvim_set_keymap("n", "<F12>", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>", ":lua Close_Nvim_Tree_If_Open()<CR>", { noremap = true, silent = true })
