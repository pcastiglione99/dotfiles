vim.g.mapleader = " "

-- buffers
vim.keymap.set({ "n", "i" }, "<c-n>", "<ESC>:bn<cr>")
vim.keymap.set({ "n", "i" }, "<c-p>", "<ESC>:bp<cr>")
vim.keymap.set({ "n", "i" }, "<c-x>", "<ESC>:bd<cr>")
vim.keymap.set({ "n", "i" }, "<c-z>", "<ESC>:bd<cr>")

local opts = { noremap = true, silent = true }

-- Move between windows using Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Terminal mode support (if you use :term)
vim.keymap.set("t", "<C-h>", [[<C-\><C-N><C-w>h]], opts)
vim.keymap.set("t", "<C-j>", [[<C-\><C-N><C-w>j]], opts)

-- terminal
vim.keymap.set(
	{ "n", "i" },
	"<c-t>",
	"<ESC>:below 10sp<cr> :terminal<cr> :set norelativenumber<cr> :set nonumber<cr> i"
)
vim.keymap.set("t", "<c-t>", "<c-\\><c-n> :q!<cr>")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- close brackets
vim.api.nvim_set_keymap("i", '"', '""<left>', { noremap = true })
vim.api.nvim_set_keymap("i", "'", "''<left>", { noremap = true })
vim.api.nvim_set_keymap("i", "(", "()<left>", { noremap = true })
vim.api.nvim_set_keymap("i", "{", "{}<left>", { noremap = true })
vim.api.nvim_set_keymap("i", "[", "[]<left>", { noremap = true })

vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<D-S>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<D-o>", "<Nop>")
