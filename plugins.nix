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

  # telescope
  telescope-nvim # https://github.com/nvim-telescope/telescope.nvim
  telescope-fzy-native-nvim # https://github.com/nvim-telescope/telescope-fzy-native.nvim

  dressing-nvim
  fidget-nvim
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
    pname = "gitsigns";
    version = "2026-01-09";
    homepage = "https://github.com/lewis6991/gitsigns.nvim";
    doCheck = false;
    src = fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "42d6aed4e94e0f0bbced16bbdcc42f57673bd75e";
      sha256 = "sha256-L89x9n2OKCyUuWaNXPkuNGBEU9EBX+9zRlzS1Kfw428=";
    };
  })

  # TODO: upgrade
  # override treesitter with previous version from master branch
  # default branch contains breaking API changes
  # (vimUtils.buildVimPlugin {
  #   pname = "nvim-treesitter";
  #   version = "2025-05-24";
  #   homepage = "https://github.com/nvim-treesitter/nvim-treesitter/tree/master";
  #   src = fetchFromGitHub {
  #     owner = "nvim-treesitter";
  #     repo = "nvim-treesitter";
  #     rev = "42fc28ba918343ebfd5565147a42a26580579482";
  #     sha256 = "sha256-CVs9FTdg3oKtRjz2YqwkMr0W5qYLGfVyxyhE3qnGYbI=";
  #   };
  # })
]
