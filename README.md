# Neovim Configuration

A comprehensive, modern Neovim setup optimized for development workflows with beautiful UI and powerful features.

## Features

- **🚀 Modern LSP Setup** - Full language server support with intelligent completion
- **📁 Advanced File Management** - Oil.nvim for buffer-like directory editing
- **🔍 Powerful Search** - Telescope with fzf for lightning-fast file/text search  
- **🎨 Beautiful UI** - Catppuccin theme with custom statusline and buffer tabs
- **⚡ Enhanced Motion** - Flash.nvim for quick navigation and jump-to-anywhere
- **🌈 Visual Enhancements** - Syntax highlighting, indentation guides, and bracket colorization
- **🔧 Git Workflow** - Integrated LazyGit and Gitsigns for seamless version control
- **💻 Terminal Integration** - ToggleTerm for embedded terminal management
- **📊 Rich Presence** - Discord integration and dashboard with motivational quotes
- **🎯 Smart Folding** - UFO for advanced code folding with LSP integration

## Requirements

- Neovim >= 0.11
- Git
- [LazyGit](https://github.com/jesseduffield/lazygit)
- A Nerd Font (for icons)

### Language Servers (auto-installed via Mason)

- **Lua** - lua_ls (Neovim configuration development)
- **Go** - gopls (Go development with full static analysis)
- **TypeScript/JavaScript** - ts_ls (Modern web development)
- **HTML** - html (Web markup)
- **CSS** - cssls (Styling and design)
- **JSON** - jsonls (Configuration and data files)

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

### File Navigation & Search
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

### Enhanced Motion (Flash)
| Key | Action |
|-----|--------|
| `s` | Flash jump to character |
| `S` | Flash treesitter jump |
| `r` | Remote flash (operator pending) |
| `R` | Treesitter search |

### Git Integration
| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `<leader>gf` | LazyGit current file |
| `]h` / `[h` | Navigate git hunks |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

### LSP (Language Server)
| Key | Action |
|-----|--------|
| `gd` | Go to definition (Telescope) |
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

### Folding (UFO)
| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open folds except kinds |
| `zm` | Close folds with kinds |

### Terminal (ToggleTerm)
| Key | Action |
|-----|--------|
| `<C-t>` | Quick toggle terminal |
| `<leader>tt` | Toggle terminal |
| `<leader>tf` | Float terminal |
| `<leader>tv` | Vertical terminal |
| `<leader>th` | Horizontal terminal |
| `<C-h/j/k/l>` | Navigate in terminal mode |

### Window & Buffer Management
| Key | Action |
|-----|--------|
| `jk` / `jj` | Exit insert mode |
| `<C-h/j/k/l>` | Window navigation |
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Make splits equal |
| `<leader>sx` | Close current split |
| `<S-h>` / `<S-l>` | Navigate buffers |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>d` | Open dashboard |

### Autocompletion
| Key | Action |
|-----|--------|
| `<Tab>` | Next item / Expand snippet |
| `<S-Tab>` | Previous item |
| `<C-j/k>` | Navigate items |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |

### UI Enhancements
| Key | Action |
|-----|--------|
| `tsc` | Toggle smooth cursor |
| `:ColorizerToggle` | Toggle color preview |

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
│       ├── bufferline.lua     # Buffer tabs
│       ├── colorscheme.lua    # Catppuccin theme
│       ├── completion.lua     # nvim-cmp autocompletion
│       ├── dashboard.lua      # Start screen
│       ├── extras.lua         # Discord presence & cursor enhancements
│       ├── flash.lua          # Enhanced motion
│       ├── gitsigns.lua       # Git decorations
│       ├── lazygit.lua        # Git integration
│       ├── lsp.lua            # Language servers
│       ├── oil.lua            # File manager
│       ├── statusline.lua     # Status bar
│       ├── telescope.lua      # Fuzzy finder
│       ├── toggleterm.lua     # Terminal integration
│       ├── treesitter.lua     # Syntax highlighting
│       ├── ui.lua             # Visual enhancements
│       └── which-key.lua      # Keymap help
└── README.md
```

## Plugin List

### Core & Development
| Plugin | Purpose |
|--------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server manager |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configurations |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & parsing |

### Navigation & Search
| Plugin | Purpose |
|--------|---------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder & picker |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File manager (edit directories like buffers) |
| [flash.nvim](https://github.com/folke/flash.nvim) | Enhanced motion and jump navigation |

### Git Integration
| Plugin | Purpose |
|--------|---------|
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | LazyGit TUI integration |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations and hunk management |

### UI & Theming
| Plugin | Purpose |
|--------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | Color scheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Start screen |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap documentation |

### Visual Enhancements
| Plugin | Purpose |
|--------|---------|
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Color preview |
| [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) | Bracket colorization |
| [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Animated cursor |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Advanced folding |

### Terminal & Extras
| Plugin | Purpose |
|--------|---------|
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal management |
| [presence.nvim](https://github.com/andweeb/presence.nvim) | Discord Rich Presence |
| [nvim-cursorline](https://github.com/yamatsum/nvim-cursorline) | Cursor enhancements |

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

### Flash.nvim (Enhanced Motion)
- Press `s` + 2 characters to jump anywhere on screen
- Use `S` for treesitter-aware jumps
- Incredibly fast navigation within files

### LazyGit
- Visual Git interface with vim-like keybindings
- Press `?` for help once opened
- Commit messages open in Neovim

### ToggleTerm
- `<C-t>` for quick terminal access
- Multiple terminal layouts (float, vertical, horizontal)
- Seamless navigation between editor and terminal

### UFO (Folding)
- Smart folding based on LSP and treesitter
- Hover over fold to preview content
- Customizable fold text with line counts

### Which-key
- Pause after pressing leader key to see available options
- Organized by categories (file, git, terminal, etc.)
- Visual guide for discovering keybindings

## Customization

### Adding Language Servers
Edit `lua/plugins/lsp.lua` and add a new server to the Mason ensure_installed list, then add a FileType autocmd:

```lua
-- Add to ensure_installed table
ensure_installed = { "lua_ls", "gopls", "ts_ls", "html", "cssls", "jsonls", "pyright" }

-- Add autocmd for the new language
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
  event = "VeryLazy",  -- or other lazy-loading events
  config = function()
    require("plugin-name").setup({
      -- Plugin configuration
    })
  end,
}
```

### Changing Keymaps
Edit `lua/config/keymaps.lua` for global keymaps or add keymaps in plugin configs:

```lua
-- Global keymap example
vim.keymap.set("n", "<leader>custom", ":CustomCommand<CR>", { desc = "Custom command" })

-- Plugin-specific keymap example (in plugin config)
vim.keymap.set("n", "<leader>example", require("plugin").function_name, { desc = "Plugin function" })
```

### Modifying UI Theme
- **Color scheme**: Edit `lua/plugins/colorscheme.lua` to change themes
- **Status line**: Customize `lua/plugins/statusline.lua` for different components
- **Dashboard**: Modify `lua/plugins/dashboard.lua` for custom start screen

## Troubleshooting

### LSP Not Working
1. Check `:LspInfo` for active clients
2. Ensure language server is installed: `:Mason`
3. Check `:messages` for errors
4. Verify file type is correct: `:set ft?`

### Telescope Not Finding Files
- Ensure you're in a directory with files
- Check git ignore settings (respects .gitignore)
- Use `<leader>fh` to search help if needed
- Try `:Telescope find_files hidden=true` for hidden files

### Flash Motion Not Working
- Ensure you're using correct key combinations (`s` + 2 characters)
- Check for key conflicts with other plugins
- Verify in normal mode when using Flash

### Terminal (ToggleTerm) Issues
- Check if shell is properly configured
- Try different terminal directions (float, vertical, horizontal)
- Ensure terminal dependencies are installed

### Plugins Not Loading
- Run `:Lazy sync` to update plugins
- Check `:Lazy` for plugin status and errors
- Clear plugin cache: `:Lazy clean`
- Restart Neovim completely

### Git Integration Problems
- Ensure LazyGit is installed and in PATH
- Check git repository status
- Verify Gitsigns with `:Gitsigns`

### Performance Issues
- Check startup time: `nvim --startuptime startup.log`
- Review lazy-loading configuration
- Disable unused features temporarily

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT License - feel free to use and modify as needed.