-- ~/.config/nvim/lua/config/keymaps.lua

local keymap = vim.keymap

-- Better escape
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "jj", "<Esc>")

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Save & quit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- Buffer navigation
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { silent = true })
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { silent = true })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { silent = true })
