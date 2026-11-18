vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over selection
vim.keymap.set("x", "p", '"_dP')

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- This would add padding and stuff
-- vim.opt.numberwidth = 10

-- Relative line numbers in (netrw) with this spell
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- Autocomplete

-- Ctrl + n: Next suggestion.
-- Ctrl + p: Prev suggestion.
-- Ctrl + y: Accept suggestion.

vim.opt.completeopt = { 
  "menu",    -- Shows a menu with suggestions.
  "menuone", -- Shows the menu, even with one suggestion.
  "noselect" -- Does not autoselect the first suggestion.
}

-- Tabs
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4

-- Highlighy jai the same way odin does.
vim.filetype.add({
  extension = {
    jai = "odin",
  },
})

-- Use Esc to go normal mode in term mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })

-- Neovide stuff
local scale_factor = 1.15
if vim.g.neovide then
  vim.g.neovide_scale_factor = scale_factor
    
  vim.keymap.set({ "n", "v" }, "<C-+>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end)

  vim.keymap.set({ "n", "v" }, "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end)

  vim.keymap.set({ "n", "v" }, "<C-0>", function()
    vim.g.neovide_scale_factor = scale_factor 
  end)
end

-- Load the plugins using Lazy.
require("config.lazy")

-- Tweak some stuff with the theme.
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin*",
  callback = function()
    local italic_bold_groups = {
      -- "Comment",
      -- "SpecialComment",
      "Keyword",
      "Conditional",
      "Repeat",
      -- "@comment",
      -- "@comment.documentation",
      "@keyword",
      "@keyword.function",
      "@keyword.return",
      "@keyword.operator",
      "@keyword.conditional",
      "@keyword.repeat",
    }

    for _, group in ipairs(italic_bold_groups) do
      local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
      if hl and next(hl) ~= nil then
        hl.italic = true
        hl.bold = true
        vim.api.nvim_set_hl(0, group, hl)
      end
    end
  end,
})

-- Set the color scheme.
vim.cmd.colorscheme("catppuccin")
-- vim.cmd.colorscheme("gruvbox")
-- vim.cmd.colorscheme("sorbet")
-- vim.cmd.colorscheme("quiet")
