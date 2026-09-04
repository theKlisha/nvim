require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
  desc = "Try to enable tree-sitter syntax highlighting",
  pattern = "*", -- run on *all* filetypes
  callback = function()
    pcall(function() vim.treesitter.start() end)
  end,
})

require('tssorter').setup({
  sortables = {
    typescriptreact = {
      object = { node = 'pair' },
    },
    typescript = {
      object = { node = 'pair' },
    },
    nix = {
      list_expression = { node = 'element' },
      attrset_expression = { node = 'binding' },
      formals = { node = 'formal' },
    }
  },
})
