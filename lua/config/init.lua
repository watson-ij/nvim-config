-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

map({'i', 'v', 's', 'o', 'c'}, 'jk', '<Esc>', { noremap = true, desc = 'Exit to normal mode' })
map({'i', 'v', 's', 'o', 'c'}, 'kj', '<Esc>', { noremap = true, desc = 'Exit to normal mode' })
map('t', 'jk', '<C-\\><C-n>', { noremap = true, desc = 'Exit terminal mode' })
map('t', 'kj', '<C-\\><C-n>', { noremap = true, desc = 'Exit terminal mode' })

-- Rewrap paragraph while staying in insert mode
map('i', '<C-q>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('normal! gqap')
  vim.api.nvim_win_set_cursor(0, pos)
  vim.cmd('startinsert')
end, { desc = 'Rewrap paragraph and continue' })

-- Split navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower split' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper split' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right split' })

-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
opt.conceallevel = 1
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
opt.timeoutlen = 300 -- Timeout for key sequences (jk escape)

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- Start with folds open
opt.foldlevel = 99

hostname = vim.fn.hostname()

-- autocmds

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
