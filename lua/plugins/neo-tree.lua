return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>b", ":Neotree filesystem reveal toggle left<CR>", { desc = "Toggle tree" })
		require("neo-tree").setup({
			window = {
				width = 35,
			},
		})
	end,
}
