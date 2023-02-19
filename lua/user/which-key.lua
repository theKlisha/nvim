local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then
	return
end

which_key.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
})
