-- C# LSP support. Required for work.
return {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
    init = function()
        vim.lsp.config("roslyn", {
            on_attach = function(client, bufnr)

                local opts = { buffer = bufnr, silent = true }
                vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

                -- @TODO: As far as I know, this does not work.
                vim.keymap.set("i", "<C-Space>", function()
                    vim.lsp.completion.get()
                end, { buffer = bufnr, desc = "Completion LSP" }
            )
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition." }))
            vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references." }))
            vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show docs." }))
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions." }))
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol." }))

        end,
        settings = {
            ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "openFiles",
                dotnet_compiler_diagnostics_scope = "openFiles",
            },
            ["csharp|completion"] = {
                dotnet_show_completion_items_from_unimported_namespaces = true,
            },
        },
    })
end,
}
