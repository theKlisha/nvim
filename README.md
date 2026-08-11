# nvim

A Nix flake that wraps Neovim with a fully self-contained configuration. All plugins, language servers, and runtime tools are pinned through nixpkgs, so the editor works identically on any machine without external dependencies.

## Usage

Run directly without installing:

```sh
nix run github:theKlisha/nvim
```

Install into your user profile:

```sh
nix profile add github:theKlisha/nvim
```

Or add to your NixOS/home-manager configuration as a flake input:

```nix
inputs.nvim.url = "github:theKlisha/nvim";
```

## How it works

`default.nix` builds the final Neovim derivation. It:

1. Bundles the `lua/` directory into a store path and prepends it to the runtime path.
2. Reads `init.lua` as the custom Lua RC.
3. Pulls the plugin list from `plugins.nix` (nixpkgs plugins plus a few custom builds via `buildVimPlugin`).
4. Injects runtime dependencies (language servers, formatters, CLI tools) onto `PATH` via wrapper args.

The result is a single `wrapNeovimUnstable` call that produces a hermetic, ready-to-use editor.

## Repository structure

```
flake.nix           Flake entry point, exposes packages and overlays for all systems
default.nix         Neovim derivation: wraps neovim-unwrapped with plugins, Lua config,
                    and runtime dependencies (LSPs, formatters, CLI tools)
plugins.nix         Plugin list: nixpkgs vim plugins + custom buildVimPlugin entries
init.lua            Lua entry point, loads all modules below via pcall
lua/
  options.lua       Editor options (indentation, clipboard, UI, folds, etc.)
  remaps.lua        Global key mappings (line movement, fast scroll, indent)
  plugins/          Per-plugin Lua setup and configuration
```

## Bundled language support

Language servers and tools are added to `PATH` at build time in `default.nix`. Currently included:

- Go, Java, Lua, Nix, TypeScript (language servers)
- SQL (formatter)
- Debug adapters for Go and Java
