{
  flake.modules.homeManager.violetshine = {
    programs.starship = {
      enable = true;

      settings = {
        add_newline = true;

        username = {
          show_always = true;

          # PURPLE, PURPLE, PURPLEEEE!!!!!
          # Always purple, plenty of purple 💜💜💜💜💜💜💜
          style_root = "bold purple";
          style_user = "bright-purple";
        };
      };
    };
  };
}
