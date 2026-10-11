vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove the ~ ugly thing
vim.opt.fillchars:append { eob = " " }

-- Colors
vim.opt.termguicolors = true 
--vim.cmd.colorscheme("catppuccin")

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
vim.opt.softtabstop = 2
vim.opt.tabstop     = 2
vim.opt.shiftwidth  = 2

-- Highlighy jai the same way odin does.
vim.filetype.add({
  extension = {
    jai = "odin",
  },
})

-- Highliht on Yank.
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",
      timeout = 180,
    })
  end,
})

-- Use Esc to go normal mode in term mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup Package Manager (Lazy)
require("lazy").setup({
  spec = {
    {
      'RostislavArts/naysayer.nvim',
      name = "naysayer",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme('naysayer')
        -- Cursor color stuff:
        -- Enable editing cursor color
        vim.opt.termguicolors = true

        -- highlight Normal
        vim.api.nvim_set_hl(0, "Cursor",  { fg = "black", bg = "#88d890" })
        -- highlight Insert
        vim.api.nvim_set_hl(0, "Cursor2", { fg = "#88d890",   bg = "#88d890" })

        -- apply styles
        vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"

        -- yank color
        vim.api.nvim_set_hl(0, "YankHighlight", {
          bg = "#ffffff",
          fg = "#000000",
          bold = true,
        })
      end,
    },
    -- Lazy Telescope
    {
      'nvim-telescope/telescope.nvim', 
      version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        require('telescope').setup({
          defaults = {
            file_ignore_patterns = {
              "%.png$",
              "%.jpeg$",
              "%.exe$",
              "%.pdb$",
            },
          },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end,
    },
    {
      'MagicDuck/grug-far.nvim',
      -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
      -- additional lazy config to defer loading is not really needed...
      config = function()
        -- optional setup call to override plugin options
        -- alternatively you can set options with vim.g.grug_far = { ... }
        require('grug-far').setup({
          -- options, see Configuration section below
          -- there are no required options atm
        });
      end
    },
    {
      "echasnovski/mini.pairs",
      event = "InsertEnter",
      version = false, -- Use last version.
      opts = {
      modes = { insert = true, command = false, terminal = false },
      mappings = {
          ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
          ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
          ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\].", register = { cr = false } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
        },
      },
    },
    {
      "echasnovski/mini.comment",
      version = false,
      opts = {
        mappings = {
          comment = "gc",       -- Comment line in Normal mode, or selection in Visual mode.
          comment_line = "gcc", -- Comment the current line.
          comment_visual = "gc",-- Comment selection in Visual mode.
          textobject = "gc",    -- Textobject for commenting.
        },
      },
    },
    {
      "echasnovski/mini.surround",
      version = false,
      config = function()
        require("mini.surround").setup({
          mappings = {
            add = "sa",            -- Add surrounding (e.g., saiw").
            delete = "sd",         -- Delete surrounding (e.g., sd").
            replace = "sr",        -- Replace surrounding (e.g., sr"{ ).
            find = "sf",           -- Find right surrounding border.
            find_left = "sF",      -- Find left surrounding border.
            highlight = "sh",      -- Highlight surroundings.
            update_n_lines = "sn", -- Configure how many lines to search.
          },
        })
      end
    },
  },
  -- Other settings here.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
