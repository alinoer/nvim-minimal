-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- Tampilan
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Behaviour
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

opt.list = true
opt.listchars = "eol:↵,nbsp:+,tab:→ ,trail:-"

-- Fold settings (disable auto-folding)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldtext = ""
opt.foldlevel = 99
opt.foldlevelstart = 99  -- Start with all folds open
opt.foldnestmax = 4
opt.foldenable = false   -- Disable folding by default