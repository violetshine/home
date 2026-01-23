{
  # automatic project environments.
  flake.modules.homeManager.violetshine = {
    programs.direnv = {
      enable = true;

      # reduce verbosity.
      config.global.hide_env_diff = true;
      config.global.warn_timeout = "0s";

      # enable nix-direnv for performance.
      nix-direnv.enable = true;
    };
  };
}
