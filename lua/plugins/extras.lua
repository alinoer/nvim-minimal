return {
	-- Discord presence
	{
		"andweeb/presence.nvim",
		event = "VeryLazy",
		config = function()
			require("presence").setup({
				auto_update = true,
				enable_line_number = true,
			})
		end,
	},

	-- Cursorline
	{
		"yamatsum/nvim-cursorline",
		event = "BufEnter",
		config = function()
			require("nvim-cursorline").setup({
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = { underline = true },
				},
			})
		end,
	},
}
