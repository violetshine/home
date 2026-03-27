{lib, ...}: {
  flake.modules.homeManager.violetshine = {
    programs.zsh = {
      enable = true;

      ### zsh options (https://zsh.sourceforge.io/Doc/Release/Options.html) ###
      setOptions = [
        "always_to_end"
        "prompt_subst"
      ];

      initContent = let
        zshConfig = lib.mkOrder 1000 ''
          export NVM_DIR="''${HOME}/.nvm"
          [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
        '';
      in
        lib.mkMerge [zshConfig];
    };
  };
}
