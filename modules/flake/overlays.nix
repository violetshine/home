{
  flake.overlays = {
    # use Lix as the Nix impl.
    lix = final: prev: let
      lpkgs = final.lixPackageSets.latest;
    in {
      inherit
        (lpkgs)
        colmena
        lix
        nix-eval-jobs
        nix-fast-build
        nixpkgs-review
        ;

      # including it in the list above causes infinite recursion.
      nix-direnv = prev.nix-direnv.override {
        nix = final.lix;
      };
    };
  };
}
