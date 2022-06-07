local g = vim.g
local opt = vim.opt
local api = vim.api

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

g.tagbar_compact = 1
g.tagbar_sort = 0

opt.cursorline = true
opt.number = true
opt.encoding = "UTF-8"
opt.swapfile = true
opt.scrolloff = 12
opt.hidden = true
opt.mouse = "a"
opt.syntax = "enable"
opt.filetype = "on"
opt.autoindent = true
g.nobackup = true
opt.termguicolors = true
opt.undofile = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 300
opt.path:remove "/usr/include"
opt.path:append "**"
opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

-- Serch
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Tabs
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true
opt.smartindent = true
opt.breakindent = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Remember cursor position
vim.cmd [[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- nvim-colorizer
opt.termguicolors = true
require 'colorizer'.setup()
