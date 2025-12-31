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

-- Window splitting
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window resizing
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Save & quit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- Buffer navigation
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { silent = true })
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { silent = true })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { silent = true })

-- UFO Folding keymaps
keymap.set("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
keymap.set("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
keymap.set("n", "zr", function() require("ufo").openFoldsExceptKinds() end, { desc = "Open folds except kinds" })
keymap.set("n", "zm", function() require("ufo").closeFoldsWith() end, { desc = "Close folds with" })
keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek fold or LSP hover" })

-- Dashboard keymap
keymap.set("n", "<leader>d", "<cmd>Dashboard<cr>", { desc = "Dashboard" })
