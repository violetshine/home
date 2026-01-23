{
  flake.modules.homeManager.violetshine = {
    programs.lazygit = {
      enable = true;

      # required to edit signed commits.
      settings.git.overrideGpg = true;
    };
  };
}
