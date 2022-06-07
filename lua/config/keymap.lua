local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("i", "kj", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
keymap("t", "kj", "<C-\\><C-n>", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Resizing panes
keymap("n", "<S-h>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<S-l>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<S-j>", ":resize -1<CR>", default_opts)
keymap("n", "<S-k>", ":resize +1<CR>", default_opts)

keymap("", "<up>", ':echoe "Use h"<CR>', default_opts)
keymap("", "<down>", ':echoe "Use j"<CR>', default_opts)
keymap("", "<left>", ':echoe "Use k"<CR>', default_opts)
keymap("", "<right>", ':echoe "Use l"<CR>', default_opts)

keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("i", "<C-h>", "<left>", default_opts)
keymap("i", "<C-j>", "<down>", default_opts)
keymap("i", "<C-k>", "<up>", default_opts)
keymap("i", "<C-l>", "<right>", default_opts)

keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", default_opts)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", default_opts)
keymap("n", "[", ": :BufferLineMovePrev<CR>", default_opts)
keymap("n", "]", ":BufferLineMoveNext<CR>", default_opts)
