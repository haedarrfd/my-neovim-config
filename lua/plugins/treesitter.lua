return {
	"nvim-treesitter/nvim-treesitter",
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
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = { enable = true },
		})
	end,
}
