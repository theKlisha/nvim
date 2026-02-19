require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

require("comment").setup({
  -- enables context aware comments, for example in jsx/tsx
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
