{
  # Tools for working with the Nix language
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nixd # Feature-rich Nix language server
        nixfmt # Official formatter for Nix code
        deadnix # Find and remove unused code in .nix source files
        statix # Lints and suggestions for the Nix programming language
      ];
    };
}
