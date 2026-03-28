{
  perSystem =
    { pkgs, ... }:
    {
      pre-commit = {
        check.enable = true;
        settings.package = pkgs.prek;
        settings.hooks = {
          nixfmt.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };
      };
    };
}
