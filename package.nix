{
  fetchFromGitHub,
  lib,
  neovim-unwrapped,
  neovimUtils,
  stdenv,
  vimPlugins,
  vimUtils,
  wrapNeovimUnstable,
  callPackage,

  # runtime deps
  fzf,
  git,
  lazygit,

  gopls,
  jdt-language-server,
  lombok,
  lua-language-server,
  nil,
  sleek,
  typescript-go,

  pkgs,
  ...
}:

let
  luaDir = stdenv.mkDerivation {
    name = "nvim-lua-dir";
    src = ./lua;
    buildPhase = ''
      mkdir -p $out/lua
      cp -r . $out/lua
    '';
  };

  customLuaRC = ''
    -- prepend lua directory
    vim.opt.rtp:prepend('${luaDir}')
  ''
  # Wrap init.lua
  + (builtins.readFile ./init.lua);

  plugins = callPackage ./plugins.nix { };

  extraConfig = {
    wrapperArgs = [
      "--set"
      "JDTLS_VSCJAVA_DEBUG"
      # https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-bundle-configuration
      "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server/"
    ]
    ++ [
      "--prefix"
      "JDTLS_JVM_ARGS"
      " "
      "-javaagent:${lombok}/share/java/lombok.jar"
    ]
    ++ [
      "--suffix"
      "PATH"
      ":"
      (lib.makeBinPath [
        fzf # used by telescope-fzy-native-nvim
        git
        lazygit # git tui

        gopls # Go language server: https://go.dev/gopls
        jdt-language-server # Java language server: https://github.com/eclipse-jdtls/eclipse.jdt.ls
        lua-language-server # Lua language server: https://github.com/LuaLS/lua-language-server
        nil # Nix language server: https://github.com/oxalica/nil
        sleek # small, fast and deterministic SQL formatter
        typescript-go # TS language server: https://github.com/microsoft/typescript-go
      ])
    ];
  };

  neovimConfig = neovimUtils.makeNeovimConfig {
    inherit customLuaRC;
    inherit plugins;
  };
in
wrapNeovimUnstable neovim-unwrapped (neovimConfig // extraConfig)
