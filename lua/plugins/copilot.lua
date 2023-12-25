return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-h>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

		vim.g.copilot_filetypes = {
			["qf"] = false,
			["telescope"] = false,
		}
	end,
}
