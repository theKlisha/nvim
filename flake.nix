{
  description = "A Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs lib.systems.flakeExposed (
          system:
          f rec {
            pkgs = import nixpkgs {
              inherit system;
              # https://github.com/johmsalas/text-case.nvim/issues/194
              config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "text-case.nvim" ];
            };
            neovim = pkgs.callPackage ./default.nix { };
          }
        );
    in
    {
      packages = forAllSystems (
        { neovim, ... }:
        {
          default = neovim;
          inherit neovim;
        }
      );

      overlays = forAllSystems (
        { neovim, ... }:
        {
          default = neovim;
          neovim = (
            final: prev: {
              inherit neovim;
            }
          );
        }
      );
    };
}
