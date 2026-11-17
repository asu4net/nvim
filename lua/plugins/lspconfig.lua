return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders=1",
                },
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
            })

            vim.lsp.enable("clangd")
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition." }))
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references." }))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show docs." }))
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions." }))
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol." }))
                end,
            })
        end,
    },
}
