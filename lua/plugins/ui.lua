return {
    -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { 
        char = "│",
        tab_char = "│",
      },
      scope = { 
        enabled = true,
        char = "│",
        show_start = true,
        show_end = true,
      },
      exclude = {
        buftypes = { "nofile", "terminal", "neorg" },
        filetypes = {
          "norg",
          "NvimTree",
          "sagaoutline", 
          "help",
          "terminal",
          "dashboard",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
        },
      },
    },
  },
  
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer" },
    config = function()
      require("colorizer").setup({
        "*",
      }, {
        mode = "virtualtext",
        virtualtext = " ■",
        RRGGBBAA = true,
        RRGGBB = true,
        AARRGGBB = true,
      })
    end,
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      require("rainbow-delimiters.setup")
    end,
  },

  -- Smear cursor
  {
    "sphamba/smear-cursor.nvim",
    event = "InsertEnter",
    cmd = "SmearCursorToggle",
    opts = {},
    keys = {
      { "tsc", "<cmd>SmearCursorToggle<cr>", desc = "Toggle Animation Cursor" },
    },
  },

  -- UFO (folding)
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufEnter",
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          local ftMap = {
            vim = "indent",
            python = { "indent" },
            git = "",
            dashboard = "",
            Avante = "",
            AvanteSelectedFiles = "",
            AvanteInput = "",
          }
          return ftMap[filetype]
        end,
        fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
          local newVirtText = {}
          local suffix = ("  %d "):format(endLnum - lnum)
          local sufWidth = vim.fn.strdisplaywidth(suffix)
          local targetWidth = width - sufWidth
          local curWidth = 0
          for _, chunk in ipairs(virtText) do
            local chunkText = chunk[1]
            local chunkWidth = vim.fn.strdisplaywidth(chunkText)
            if targetWidth > curWidth + chunkWidth then
              table.insert(newVirtText, chunk)
            else
              chunkText = truncate(chunkText, targetWidth - curWidth)
              local hlGroup = chunk[2]
              table.insert(newVirtText, { chunkText, hlGroup })
              chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
              end
              break
            end
            curWidth = curWidth + chunkWidth
          end
          table.insert(newVirtText, { suffix, "MoreMsg" })
          return newVirtText
        end,
      })
    end,
  },
}