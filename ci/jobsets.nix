# Run by Hydra's `.jobsets` jobset (see spec.json): one flake jobset for
# main plus one per open PR. Fields left out keep Hydra's defaults.
{ pulls, ... }:
let
  prs = builtins.fromJSON (builtins.readFile pulls);

  mkFlakeJobset = description: flake: {
    type = 1;
    inherit description flake;
    enableemail = false;
    emailoverride = "";
  };

  # PRs from a deleted fork have no head repo; skip them rather than
  # failing the whole evaluation.
  livePrs = builtins.filter (num: prs.${num}.head.repo != null) (builtins.attrNames prs);

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
    ) livePrs
  );

  jobsets = prJobsets // {
    main = mkFlakeJobset "main branch" "github:theKlisha/nvim/main";
  };
in
{
  # Plain derivation over the sandbox's /bin/sh, so evaluating this
  # doesn't need a nixpkgs input (a full-history git clone in Hydra).
  jobsets = derivation {
    name = "jobsets.json";
    system = builtins.currentSystem;
    builder = "/bin/sh";
    args = [ "-c" ''printf '%s' "$json" > "$out"'' ];
    json = builtins.toJSON jobsets;
  };
}
