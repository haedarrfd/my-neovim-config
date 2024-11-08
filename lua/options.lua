-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping
vim.opt.relativenumber = true
-- Enable mouse mode
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
-- Recovery, backup, and undo stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Treat @ characters as valid in file names and path
vim.opt.isfname:append("@-@")
-- Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Line wrapping
vim.opt.wrap = false
-- Highlighting search and incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Enables true color support (24-bit colors)
vim.opt.termguicolors = true
--Blink cursor
vim.opt.guicursor = table.concat({
	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
	"i-ci:block-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
	"r:hor50-Cursor/lCursor-blinkwait1000-blinkon125-blinkoff75",
}, ",")

-- Remap key
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlighting" })
-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "Use h to move" })
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "Use l to move" })
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "Use k to move" })
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "Use j to move" })
-- Use CTRL+<hjkl> to switch between windows
--vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
--vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
--vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
--vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Move a selected block of text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text below" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text above" })
-- Move cursor and screen stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Best remap for join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })
-- Navigate search results and the view stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Delete a character without copying into register
vim.keymap.set("n", "x", '"_x', { desc = "Delete without store in register" })
-- Paste without change the unnamed register (clipboard)
--vim.keymap.set("x", "<leader>p", '"_dp', { desc = "Paste without change unnamed register" })
-- Yank to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })
-- Delete without saving it to the clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without store in register" })
-- No operation or unmap a keybinding
vim.keymap.set("n", "Q", "<nop>", { desc = "Unmap keybindings" })
-- Navigate items in the location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- search-and-replace shortcut of the word under the cursor in a file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Open file explorer
--vim.keymap.set("n", "<leader>b", "<cmd>Ex<CR>", { desc = "Open file explorer" })
-- Unload the current buffer
--vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { desc = "Unload buffer" })

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
