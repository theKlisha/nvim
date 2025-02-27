vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.autoread = true -- reload files changed outside vim
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cursorline = true -- highlight the current line
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.fillchars = {
	eob = " ", -- hide ugly end of buffer '~' chars
	-- stl           ' ' or '^'      statusline of the current window
	-- stlnc         ' ' or '='      statusline of the non-current windows
	-- vert          '|'             vertical separators :vsplit
	-- fold          '-'             filling 'foldtext'
	-- foldopen      '-'             mark the beginning of a fold
	-- foldclose     '+'             show a closed fold
	-- foldsep       '|'             open fold middle character
	-- diff          '-'             deleted lines of the 'diff' option
	-- eob           '~'             empty lines below the end of a buffer

	horiz = '━',
	horizup = '┻',
	horizdown = '┳',
	vert = '┃',
	vertleft = '┫',
	vertright = '┣',
	verthoriz = '╋'
}
vim.opt.foldmethod = "indent" -- fold based on indent level
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.iskeyword:append("-") -- treats words with `-` as single words
vim.opt.laststatus = 3 -- only the last window will always have a status line
vim.opt.linebreak = true
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.foldenable = false -- don't fold by default
vim.opt.number = true -- set numbered lines
vim.opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.relativenumber = true -- set relative line numbers
vim.opt.ruler = false -- hide the line and column number of the cursor position
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.wrap = false -- display lines as one long line
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
