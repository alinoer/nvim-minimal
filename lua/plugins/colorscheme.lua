-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load paling awal
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        term_colors = true,

        styles = {
          comments = { "italic" },
          keywords = { "italic" },
          functions = {},
          variables = {},
        },

        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })

      -- Set colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}