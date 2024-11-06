function Color()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	"rose-pine/neovim",
	enabled = true,
	priority = 1000,
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "main",
			styles = {
				italic = false,
			},
		})
		vim.cmd("colorscheme rose-pine-main")
		Color()
	end
}
