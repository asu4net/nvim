-- Auto-formatter. For now it is just for
-- C# code.
return {
    "stevearc/conform.nvim",
    ft = "cs",
    opts = {
        formatters_by_ft = {
            cs = { "csharpier" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
