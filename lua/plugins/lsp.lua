-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls", 
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP keybindings
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) 
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        
        -- Diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- Diagnostic signs
      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Auto-start LSP servers when files are opened
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua" },
        callback = function()
          vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function()
          vim.lsp.start({
            name = "gopls",
            cmd = { "gopls" },
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              gopls = {
                analyses = { unusedparams = true },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
        callback = function()
          vim.lsp.start({
            name = "ts_ls",
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "html" },
        callback = function()
          vim.lsp.start({
            name = "html",
            cmd = { "vscode-html-language-server", "--stdio" },
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "css", "scss", "less" },
        callback = function()
          vim.lsp.start({
            name = "cssls",
            cmd = { "vscode-css-language-server", "--stdio" },
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "json", "jsonc" },
        callback = function()
          vim.lsp.start({
            name = "jsonls",
            cmd = { "vscode-json-language-server", "--stdio" },
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
      })
    end,
  },
}