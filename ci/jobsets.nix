{ pulls, nixpkgs }:
let
  pkgs = import nixpkgs { };

  prs = builtins.fromJSON (builtins.readFile pulls);

  mkFlakeJobset = description: flake: {
    enabled = 1;
    hidden = false;
    inherit description flake;
    type = 1;
    checkinterval = 300;
    schedulingshares = 100;
    enableemail = false;
    emailoverride = "";
    keepnr = 3;
  };

  prJobsets = builtins.listToAttrs (
    map (
      num:
      let
        pr = prs.${num};
      in
      {
        name = "pr-${num}";
        value = mkFlakeJobset "PR #${num}: ${pr.title}" "github:${pr.head.repo.owner.login}/${pr.head.repo.name}/${pr.head.sha}";
      }
    ) (builtins.attrNames prs)
  );

  jobsets = prJobsets // {
    main = mkFlakeJobset "main branch" "github:theKlisha/nvim/main";
  };
in
{
  jobsets = pkgs.runCommand "jobsets.json" { } ''
    cat >$out <<'EOF'
    ${builtins.toJSON jobsets}
    EOF
  '';
}
