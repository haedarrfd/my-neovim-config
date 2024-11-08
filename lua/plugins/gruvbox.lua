--function Color()
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--end

return {
	"ellisonleao/gruvbox.nvim",
	enabled = true,
	priority = 1000,
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
				bright_red = "#eb6f92",
				bright_purple = "#ebbcba",
				dark0_hard = "#18181b",
			},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		})
		vim.cmd("colorscheme gruvbox")

		--Color()
	end,
}
