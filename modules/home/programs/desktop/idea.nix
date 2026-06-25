{
  # IntelliJ Idea
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        jetbrains.idea
      ];
    };
}
