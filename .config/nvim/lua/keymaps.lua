-- space bar leader key
vim.g.mapleader = " "

-- buffers
vim.keymap.set({"n","i"}, "<c-n>", "<ESC>:bn<cr>")
vim.keymap.set({"n","i"}, "<c-p>", "<ESC>:bp<cr>")
vim.keymap.set({"n","i"}, "<c-x>", "<ESC>:bd<cr>")

-- terminal
vim.keymap.set({"n","i"}, "<c-t>", "<ESC>:below 10sp<cr> :terminal<cr> :set norelativenumber<cr> :set nonumber<cr> i")
vim.keymap.set("t", "<c-t>", "<c-\\><c-n> :q!<cr>")

-- yank to clipboard
vim.keymap.set({"n","v"}, "<leader>y", [["+y]])
