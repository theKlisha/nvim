# nvim

A Nix flake packaging a personal Neovim configuration.

## Usage

Run directly without installing:

```sh
nix run github:theKlisha/nvim
```

Or add to your NixOS/home-manager configuration as an overlay:

```nix
inputs.nvim.url = "github:theKlisha/nvim";
```
