{
  callPackage,
  writers,
  writeText,
  jq,
  lib,
  ...
}:

let
  plugins = callPackage ./plugins.nix { };

  default = {
    repo = "none";
    owner = "none";
    dependencies = [ ];
  };

  mapPlugins = lib.foldl (
    acc: plugin:
    let
      mapDef =
        plugin:
        (
          if plugin ? src && plugin.src ? owner && plugin.src ? repo then
            {
              "${plugin.name}".source = "${plugin.src.owner}/${plugin.src.repo}";
            }
          else
            {
              "${plugin.name}".source = "${plugin}";
            }
        );
      mapDeps = plugin: (if plugin ? dependencies then mapPlugins plugin.dependencies else { });
    in
    acc // (mapDef plugin) // (mapDeps plugin)
  ) { };

  # mapLock = map (
  #   plugin:
  #   let
  #     p = {
  #       repo = "none";
  #       owner = "none";
  #     }
  #     // plugin.src;
  #   in
  #   {
  #     source = "${p.owner}/${p.repo}";
  #     # name = plugin;
  #     # rev = rev;
  #   }
  # );
  lock = writeText "mini.lock" (builtins.toJSON (mapPlugins plugins));
in
writers.writeBashBin "lock" ''
  cat ${lock} | ${jq}/bin/jq > ./mini.lock
''
