{
  self,
  inputs,
  ...
}: {
  flake.modules.homeManager.violetshine = {
    home = {
      username = "violetshine";
      homeDirectory = "/Users/violetshine";
      stateVersion = "25.11";
    };
  };

  flake.homeConfigurations.violetshine =
    inputs.home-manager.lib.homeManagerConfiguration
    {
      pkgs = self.lib.pkgsFor "aarch64-darwin";
      modules = [
        self.modules.homeManager.violetshine
      ];
    };
}
