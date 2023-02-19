-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move around buffer
keymap("n", "<C-Up>", "<C-y>", opts)
keymap("n", "<C-Down>", "<C-e>", opts)
keymap("n", "<S-Up>", "{", opts)
keymap("n", "<S-Down>", "}", opts)
keymap("v", "<S-Up>", "{", opts)
keymap("v", "<S-Down>", "}", opts)

-- Navigate buffers
keymap("n", "<leader>]", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>[", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>}", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>{", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>bs", ":BufferLineSortByRelativeDirectory<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>q", ":Bdelete!<CR>", opts)

-- Write buffers
keymap("n", "<leader>w", ":w<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
keymap("n", "<C-Left>", ":NvimTreeResize -2<CR>", opts)
keymap("n", "<C-Right>", ":NvimTreeResize +2<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope resume<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fh", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>LazyGitCurrentFile<CR>", opts)
keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
