{
  fetchFromGitHub,
  vimPlugins,
  vimUtils,
}:

with vimPlugins;
[
  # lsp
  nvim-lspconfig
  nvim-jdtls
  lazydev-nvim
  lspkind-nvim
  none-ls-nvim

  # dap
  nvim-dap
  nvim-dap-go
  nvim-dap-ui

  # cmp
  blink-cmp # https://github.com/saghen/blink.cmp
  friendly-snippets # https://github.com/rafamadriz/friendly-snippets

  # nvim-treesitter-context
  nvim-treesitter-textobjects # https://github.com/nvim-treesitter/nvim-treesitter-textobjects/
  nvim-treesitter.withAllGrammars # https://github.com/nvim-treesitter/nvim-treesitter
  nvim-ts-context-commentstring # https://github.com/joosepalviste/nvim-ts-context-commentstring/
  comment-nvim # https://github.com/numToStr/Comment.nvim
  tssorter-nvim # https://github.com/mtrajano/tssorter.nvim

  # telescope
  telescope-nvim # https://github.com/nvim-telescope/telescope.nvim
  telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim

  dressing-nvim
  fidget-nvim
  gitsigns-nvim
  mini-base16
  mini-bufremove
  mini-cursorword
  mini-nvim
  neo-tree-nvim
  nvim-web-devicons
  plenary-nvim
  render-markdown-nvim
  text-case-nvim
  trouble-nvim
  vim-sleuth
  vim-visual-multi
  which-key-nvim
]
++ [
  (vimUtils.buildVimPlugin {
    pname = "OolongTheme";
    version = "2023-05-11";
    homepage = "https://github.com/theKlisha/oolong.nvim";
    src = fetchFromGitHub {
      owner = "theKlisha";
      repo = "oolong.nvim";
      rev = "4eae82334dba2ff21b27d0cc8469319afcd9b54e";
      sha256 = "sha256-iXovbl/+kysa1v5sHjLj2YArvK6gLP3kM4yg3aM76r8=";
    };
  })

  (vimUtils.buildVimPlugin {
    pname = "Agentic";
    version = "2026-08-23";
    homepage = "https://github.com/carlos-algms/agentic.nvim";
    doCheck = false; # no tests
    src = fetchFromGitHub {
      owner = "carlos-algms";
      repo = "agentic.nvim";
      rev = "81628c1dc07edadd1c2c3c27d8dbcb424da1dea0";
      sha256 = "sha256-gGesKupHCLVTQ27vj2OTllOPNG1hubZdUrYTqpofEVM=";
    };
  })
]
