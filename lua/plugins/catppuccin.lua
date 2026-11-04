-- Just a nice color scheme. At some in my life I want to create
-- my own. I was using JBlow's theme before, but he said Link's
-- hips are not manly enough, so he is not a nice person anymore.
-- Thanks for jai though.
return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    opts = {
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
            transparent = false, -- enable transparent floating windows
            solid = false, -- use solid styling for floating windows, see |winborder|
        },
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = { "bold" },
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
            -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
                ok = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
                ok = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        color_overrides = {},
        custom_highlights = function(colors)
            return {
                YankHighlight = { bg = colors.green, fg = colors.base, bold = true },
            }
        end,
        auto_integrations = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
        },
    }
}

-- Prev theme. There is probably a way to just have it on a separate
-- file and exclude it from plugin retriveal, but again, I'm not that
-- smart.

-- {
--   'RostislavArts/naysayer.nvim',
--   name = "naysayer",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme('naysayer')
--     -- Cursor color stuff:
--     -- Enable editing cursor color
--     vim.opt.termguicolors = true
--
--     -- highlight Normal
--     vim.api.nvim_set_hl(0, "Cursor",  { fg = "black", bg = "#88d890" })
--     -- highlight Insert
--     vim.api.nvim_set_hl(0, "Cursor2", { fg = "#88d890",   bg = "#88d890" })
--
--     -- apply styles
--     vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"
--
--     -- yank color
--     vim.api.nvim_set_hl(0, "YankHighlight", {
--       bg = "#ffffff",
--       fg = "#000000",
--       bold = true,
--     })
--   end,
-- },
