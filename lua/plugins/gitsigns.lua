return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "契" },
			topdelete = { text = "契" },
			changedelete = { text = "▎" },
		},
	},
	-- on_attach = function(buffer)
	-- 	local gs = package.loaded.gitsigns

	-- 	local function map(mode, l, r, desc)
	-- 		vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
	-- 	end

	-- 	local blame_line = function()
	-- 		gs.blame_line({ full = true })
	-- 	end

	-- 	local diff_this = function()
	-- 		gs.diffthis("~")
	-- 	end

	--     -- stylua: ignore start
	--     vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Hunk", buffer = buffer })
	--     vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev Hunk", buffer = buffer })
	--     vim.keymap.set({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk", buffer = buffer })
	--     vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghb", blame_line, { desc = "Blame Line", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghd", gs.diffthis, { desc = "Diff This", buffer = buffer })
	--     vim.keymap.set("n", "<leader>ghD", diff_this, { desc = "Diff This ~", buffer = buffer })
	--     vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns Select Hunk", buffer = buffer })
	-- end,
}
