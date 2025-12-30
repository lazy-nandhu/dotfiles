-- 1. BASIC SETTINGS
vim.opt.number = true            -- Absolute line number for current line
vim.opt.relativenumber = true    -- Relative numbers for others
vim.g.mapleader = " "            -- Set Space as leader
vim.opt.termguicolors = true     -- Better color support

-- Tab and Indentation (4 spaces)
vim.opt.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.opt.softtabstop = 4  -- Number of spaces a <Tab> counts for while editing
vim.opt.shiftwidth = 4   -- Size of an indent
vim.opt.expandtab = true


-- 2. KEYBINDINGS
-- Disable arrow keys in Normal, Insert, and Visual modes
local modes = { 'n', 'i', 'v' }
local keys = { '<Up>', '<Down>', '<Left>', '<Right>' }
for _, mode in ipairs(modes) do
  for _, key in ipairs(keys) do
    vim.keymap.set(mode, key, '<nop>')
  end
end

-- Open File Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- 3. BOOTSTRAP LAZY.NVIM (Automated Installation)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 4. PLUGIN SETUP
require("lazy").setup({
  -- Theme
  { 
    "rose-pine/neovim", 
    name = "rose-pine", 
    config = function()
      vim.cmd("colorscheme rose-pine")
    end 
  },

  -- Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "bash", "qmljs", "lua" },
        highlight = { enable = true },
      })
    end
  },
})
