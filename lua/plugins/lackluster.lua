return {
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nvim-web-devicons").setup({})
			vim.cmd.colorscheme("lackluster-hack")
		end,
	},
}
