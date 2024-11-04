return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"lua",
				"c",
				"jsdoc",
				"bash",
				"css",
				"html",
				"go",
				"godot_resource",
				"php",
				"phpdoc",
				"python",
				"vue",
			},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
