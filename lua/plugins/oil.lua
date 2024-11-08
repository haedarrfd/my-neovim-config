return {
	"stevearc/oil.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = false,
			cleanup_delay_ms = 5000,
			float = {
				padding = 3,
			},
		})

		vim.keymap.set("n", "<leader>bo", oil.toggle_float, { desc = "Open parent directory" })
	end,
}
