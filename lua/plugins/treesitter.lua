-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          -- core
          "lua",
          "vim",
          "vimdoc",

          -- web
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",

          -- backend
          "go",
          "gomod",
          "gosum",
        },
      })
    end,
  },
}