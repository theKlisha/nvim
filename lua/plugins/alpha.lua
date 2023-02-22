local banner = {
	[[                  .                          ]],
	[[                 ":"                         ]],
	[[               ___:____     |"\/"|           ]],
	[[             ,'        `.    \  /            ]],
	[[             |  O        \___/ /             ]],
	[[^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^]],
	[[        _  _ ___ _____   _____ __  __        ]],
	[[       | \| | __/ _ \ \ / /_ _|  \/  |       ]],
	[[       | .` | _| (_) \ V / | || |\/| |       ]],
	[[       |_|\_|___\___/ \_/ |___|_|  |_|       ]],
}

local function button(sc, txt, keybind)
	local opts = {
		position = "center",
		cursor = 5,
		width = 29,
		align_shortcut = "right",
		hl_shortcut = "Keyword",
		shortcut = sc,
		keymap = { "n", sc, keybind, { noremap = true, silent = true, nowait = true } },
	}

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind, true, false, true)
		vim.api.nvim_feedkeys(key, "t", false)
	end

	return {
		type = "button",
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VimEnter",
		opts = {
			layout = {
				{ type = "padding", val = 5 },
				{
					type = "text",
					val = banner,
					opts = {
						position = "center",
						hl = "Type",
					},
				},
				{ type = "padding", val = 1 },
				{
					type = "text",
					val = "- Klisha -",
					opts = {
						position = "center",
						hl = "LineNr",
					},
				},
				{ type = "padding", val = 2 },
				{
					type = "group",
					val = {
						button("f", " " .. " Find file", ":Telescope find_files <CR>"),
						button("e", " " .. " New file", ":ene <CR>"),
						button("p", " " .. " Find project", ":Telescope projects <CR>"),
						button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
						button("t", "󱎸 " .. " Find text", ":Telescope live_grep <CR>"),
						button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
					},
					opts = {
						spacing = 1,
					},
				},
				{ type = "padding", val = 2 },
				button("q", " " .. " Quit", ":qa <CR>"),
			},
		},
	},
}
