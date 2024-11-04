return {
	{
	"tpope/vim-fugitive"
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>", { desc = "Git preview" })
			vim.keymap.set("n", "<leader>gg", "<cmd>:Gitsigns toggle_current_line_blame<CR>", { desc = "Git blame" })
			vim.keymap.set("n", "<leader>ge", "<cmd>:Gitsigns setqflist<CR>", { desc = "Set quick fix list" })
			vim.keymap.set("n", "<leader>gl", "<cmd>:Gitsigns setloclist<CR>", { desc = "Set location list" })
		end
	}
}
