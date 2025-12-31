# Neovim Configuration

A minimal but powerful Neovim setup focused on efficiency and modern development workflows.

## Features

- **Modern LSP Setup** - Language Server Protocol with auto-completion
- **File Management** - Oil.nvim for buffer-like directory editing
- **Git Integration** - LazyGit for visual git operations
- **Fuzzy Finding** - Telescope with fzf for fast file/text search
- **Syntax Highlighting** - TreeSitter for accurate code highlighting
- **Plugin Management** - Lazy.nvim for fast plugin loading

## Requirements

- Neovim >= 0.11
- Git
- [LazyGit](https://github.com/jesseduffield/lazygit)
- A Nerd Font (for icons)

### Language Servers (auto-installed via Mason)

- **Lua** - lua_ls
- **Go** - gopls
- **TypeScript/JavaScript** - ts_ls
- **HTML** - html
- **CSS** - cssls
- **JSON** - jsonls

## Installation

1. **Backup existing config:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this configuration:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Install dependencies:**
   ```bash
   # macOS with Homebrew
   brew install lazygit
   
   # Install a Nerd Font
   brew install --cask font-jetbrains-mono-nerd-font
   ```

4. **Start Neovim:**
   ```bash
   nvim
   ```
   Plugins will install automatically on first run.

## Key Mappings

### Leader Key
The leader key is set to `Space`.

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Show buffers |
| `<leader>fh` | Help tags |
| `<leader>fr` | Recent files |
| `<leader>fc` | Commands |
| `<leader>fk` | Keymaps |
| `-` | Open parent directory (Oil) |
| `<leader>o` | Open Oil file manager |

### Git
| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>gf` | LazyGit current file |

### LSP (Language Server)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format code |
| `[d` / `]d` | Navigate diagnostics |
| `<leader>e` | Show diagnostic float |
| `<leader>q` | Send to quickfix |

### General
| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `<C-h/j/k/l>` | Window navigation |
| `<leader>w` | Save file |
| `<leader>q` | Quit |

### Autocompletion
| Key | Action |
|-----|--------|
| `<Tab>` | Next item / Expand snippet |
| `<S-Tab>` | Previous item |
| `<C-j/k>` | Navigate items |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Plugin manager setup
│   │   ├── keymaps.lua        # Global keymaps
│   │   └── options.lua        # Vim options
│   └── plugins/
│       ├── completion.lua     # nvim-cmp autocompletion
│       ├── lazygit.lua       # Git integration
│       ├── lsp.lua           # Language servers
│       ├── oil.lua           # File manager
│       ├── telescope.lua     # Fuzzy finder
│       └── treesitter.lua    # Syntax highlighting
└── README.md
```

## Plugin List

| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server manager |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File manager |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git integration |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

## Usage Tips

### Oil.nvim (File Manager)
- Edit directories like buffers
- Create files: Add lines and save
- Delete files: Delete lines and save
- Rename: Edit filename and save
- Press `g?` for help

### Telescope
- Use `<C-j/k>` to navigate results
- `<C-q>` sends results to quickfix
- Type to filter results in real-time

### LazyGit
- Visual Git interface with vim-like keybindings
- Press `?` for help once opened
- Commit messages open in Neovim

## Customization

### Adding Language Servers
Edit `lua/plugins/lsp.lua` and add a new FileType autocmd:

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.lsp.start({
      name = "pyright",
      cmd = { "pyright-langserver", "--stdio" },
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
})
```

### Adding Plugins
Create a new file in `lua/plugins/` or add to existing files:

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin setup
  end,
}
```

### Changing Keymaps
Edit `lua/config/keymaps.lua` or add keymaps in plugin configs.

## Troubleshooting

### LSP Not Working
1. Check `:LspInfo` for active clients
2. Ensure language server is installed: `:Mason`
3. Check `:messages` for errors

### Telescope Not Finding Files
- Ensure you're in a directory with files
- Check git ignore settings
- Use `<leader>fh` to search help if needed

### Plugins Not Loading
- Run `:Lazy sync` to update plugins
- Check `:Lazy` for plugin status
- Restart Neovim

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT License - feel free to use and modify as needed.