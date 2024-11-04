return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'tabs' },
				lualine_y = { 'encoding' },
				lualine_z = { 'progress', 'location' }
			},
		})
	end,
}
