vim.g.mapleader = " "

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over selection
vim.keymap.set("x", "p", '"_dP')

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

-- Set the color scheme.
vim.cmd.colorscheme("retrobox")
