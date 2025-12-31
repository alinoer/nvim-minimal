-- ~/.config/nvim/lua/plugins/statusline.lua

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = false,
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            statusline = { "oil" },
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              path = 1, -- relative path
            },
          },
          lualine_x = {
            "diagnostics",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}