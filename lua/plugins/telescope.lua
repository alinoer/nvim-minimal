-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = " 🔍 ",
          selection_caret = " ▶ ",
          path_display = { "truncate" },
          file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.DS_Store",
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })

      -- Load fzf extension for better performance
      telescope.load_extension("fzf")
    end,
  },
}