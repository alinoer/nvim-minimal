-- ~/.config/nvim/lua/plugins/gitsigns.lua

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,

        current_line_blame = false, -- kita buat manual
      })

      -- Keymaps
      local gs = require("gitsigns")

      vim.keymap.set("n", "]h", gs.next_hunk)
      vim.keymap.set("n", "[h", gs.prev_hunk)

      vim.keymap.set("n", "<leader>hp", gs.preview_hunk)
      vim.keymap.set("n", "<leader>hs", gs.stage_hunk)
      vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
      vim.keymap.set("n", "<leader>hb", gs.blame_line)
    end,
  },
}