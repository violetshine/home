{
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        texliveFull # TeX Live contains LaTeX and all of the core packages
        texlab # Implementation of the Language Server Protocol for LaTeX
      ];
    };
}
