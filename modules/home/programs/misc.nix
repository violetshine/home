{lib, ...}: {
  flake.modules.homeManager.violetshine = {pkgs, ...}: let
    mkPrograms = modules:
      lib.pipe modules [
        (lib.map (m: {"${m}".enable = true;}))
        (lib.foldr lib.mergeAttrs {})
      ];
  in {
    programs = mkPrograms [
      "home-manager"
      "zoxide"
    ];

    home.packages = with pkgs; [
      just
      nil
    ];
  };
}
