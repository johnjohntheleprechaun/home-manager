-- Enable LSPs, configured lower in the file
vim.lsp.enable({
    "ts_ls",
    "html",
    "lua_ls",
    "nixd",
    "cssls",
    "jsonls",
    "bashls",
    "yamlls",
    "eslint",
    "pyright",
})
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type", "Spaces" },
    }),
    null_ls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "4", "-ci" },
    }),
    null_ls.builtins.formatting.yamlfmt,
    null_ls.builtins.formatting.black,
}

-- show diagnostics
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
        local float_opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = "",
            scope = "line",
        }

        local cursor = vim.api.nvim_win_get_cursor(0)
        local line = cursor[1] - 1
        local diagnostic = vim.diagnostic.get(0, {
            lnum = line,
        })
        if #diagnostic > 0 and vim.api.nvim_get_mode().mode ~= "i" then
            vim.diagnostic.open_float(nil, float_opts)
        end
    end,
})
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("jsonls", {
    capabilities = capabilities,
})
vim.lsp.config("html", {
    provideFormatter = false,
    capabilities = capabilities,
})
vim.lsp.config("cssls", {
    capabilities = capabilities,
})
vim.lsp.config("nixd", {
    settings = {
        formatting = {
            command = "alejandra",
        },
    },
})
vim.lsp.config("lua_ls", {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most
                -- likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library"
                },
                -- Or pull in all of "runtimepath".
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file("", true),
                -- }
            },
        })
    end,
    settings = {
        Lua = {},
    },
})

-- Autocompletion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
})

-- Formatter / Linter via none-ls
local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = formatting_group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(format_client)
                            return format_client.name == "null-ls"
                        end,
                    })
                end,
            })
        end
    end,
})
