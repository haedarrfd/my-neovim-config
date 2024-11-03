vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

require("config.lazy")
require("options")
