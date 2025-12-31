return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          "",
          "",
          "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
          "It's a terminal, but cooler — yes, I type everything.",
          "",
          "Works on my machine",
          "Yesterday Ali was smart. Today Ali uses Neovim.",
          "Git add . && git commit -m 'fix'",
          "I use Neovim btw.",
          "",
        },
        shortcut = {},
        project = { enable = false },
        mru = { enable = false },
        footer = {
          "",
          "🚀 Time to write some spaghetti code!",
        },
      },
    })

    -- Fix bufferline visibility
    if vim.o.filetype ~= "dashboard" then
      vim.cmd("set showtabline=2")
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dashboard",
      callback = function()
        vim.cmd("set showtabline=0")
      end,
    })

    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "dashboard",
      callback = function()
        vim.cmd("set showtabline=2")
      end,
    })
  end,
  dependencies = { {"nvim-tree/nvim-web-devicons"}},
}