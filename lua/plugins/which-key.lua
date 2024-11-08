return {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = function()
			return 1500
		end,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
