local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, -- latest stable release
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ","

local map = vim.keymap.set

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.number = true -- Print line number
opt.relativenumber = true
opt.grepprg = "rg --vimgrep"
opt.termguicolors = true -- True color support
vim.g.markdown_recommended_style = 0
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.ignorecase = true -- Ignore case
opt.spelllang = { "en" }

-- looks under lua/plugins for plugin setups
local opts = {}
require("lazy").setup({{import = 'plugins'},{import = 'plugins.extra'},}, opts)
vim.cmd[[colorscheme tokyonight]]
