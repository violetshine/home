{lib, ...}: {
  flake.modules.homeManager.violetshine = {pkgs, ...}: let
    mkEnable = modules:
      lib.pipe modules [
        (lib.map (m: {"${m}".enable = true;}))
        (lib.foldr lib.mergeAttrs {})
      ];
  in {
    programs = mkEnable [
      "home-manager"
      "zoxide"
    ];

    services = mkEnable [
      "ssh-agent"
    ];

    home.packages = with pkgs; [
      just
      nh
      nil
      nix-output-monitor
      typst
    ];
  };
}
