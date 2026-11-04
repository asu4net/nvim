vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove the ~ ugly thing
vim.opt.fillchars:append { eob = " " }

-- Colors
vim.opt.termguicolors = true 

-- Don't add newline at the end
vim.opt.fixeol = false

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste over selection
vim.keymap.set("x", "p", '"_dP')

-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
--vim.opt.numberwidth = 10

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
vim.opt.complete = { 
  ".",       -- Words of the current file.
  "w",       -- Words from other visible windows.
  "b"        -- Words from loaded buffers.
}

-- Explorer / wildmenu
vim.opt.compatible = false
vim.opt.wildmenu = true

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

-- Highliht on Yank.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on Yank",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight", -- Use the Catpuccin Visual highlight
      timeout = 200,
    })
  end,
})

-- Use Esc to go normal mode in term mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

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
vim.cmd.colorscheme("catppuccin-nvim")
