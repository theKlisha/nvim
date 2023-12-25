vim.keymap.set("v", "<C-j>", "3j")
vim.keymap.set("v", "<C-k>", "3k")

vim.keymap.set("n", "<C-j>", "3j")
vim.keymap.set("n", "<C-k>", "3k")

-- Move current line
vim.keymap.set("n", "J", ":m +1<CR>")
vim.keymap.set("n", "K", ":m -2<CR>")

-- Move selected block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Indent with Tab
vim.keymap.set("v", "<Tab>", "><CR>gv")
vim.keymap.set("v", "<S-Tab>", "<<CR>gv")

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Keep selection in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
