{
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        typst # Typst itself

        tinymist # Language server for Typst
        typstyle # Formatter for Typst
      ];
    };
}
