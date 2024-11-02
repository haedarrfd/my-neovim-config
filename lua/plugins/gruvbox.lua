return {
	{
		"ellisonleao/gruvbox.nvim",
		--priority = 1000,
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "hard",
				palette_overrides = {
					bright_green = "#7788AA",
					bright_red = "#D6589F",
				},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})

			vim.cmd("colorscheme gruvbox")
		end,
	},
}
