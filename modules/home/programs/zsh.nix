{
  flake.modules.homeManager.violetshine = {
    programs.zsh = {
      enable = true;

      ### zsh options (https://zsh.sourceforge.io/Doc/Release/Options.html) ###
      setOptions = [
        "always_to_end"
        "prompt_subst"
      ];
    };
  };
}
