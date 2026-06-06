{
  # VSCodium - a FOSS build of VS Code without Microsoft telemetry
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      programs.vscodium = {
        enable = true;

        # The VS Code package to use (VSCodium)
        package = pkgs.vscodium;

        profiles = {
          default = {
            enableUpdateCheck = false;
            enableExtensionUpdateCheck = false;

            extensions = [
              # Claude Code AI
              pkgs.vscode-extensions.anthropic.claude-code
              # Automatically loads .envrc
              pkgs.vscode-extensions.mkhl.direnv
              # Nix support
              pkgs.vscode-extensions.jnoortheen.nix-ide
              # Tinymist - language server for Typst
              pkgs.vscode-extensions.myriad-dreamin.tinymist
              # Rust
              pkgs.vscode-extensions.rust-lang.rust-analyzer
              # Deno
              pkgs.vscode-extensions.denoland.vscode-deno
              # Svelte web framework support
              pkgs.vscode-extensions.svelte.svelte-vscode
              # Scala syntax highligting & LSP
              pkgs.vscode-extensions.scala-lang.scala
              pkgs.vscode-extensions.scalameta.metals
            ];

            userSettings = {
              # Configure indentation
              "editor.insertSpaces" = true;
              "editor.tabSize" = 2;
              "editor.indentSize" = "tabSize";

              # Editor font
              "editor.fontFamily" = "Lilex-Regular, monospace";
              "editor.fontWeight" = "normal";
              "editor.fontLigatures" = true;
              "editor.fontSize" = 14;

              # Nix language
              "nix.enableLanguageServer" = true;
              "nix.formatterPath" = "nixfmt";
              "[nix]" = {
                "editor.formatOnSave" = true;
              };

              # Git
              "git.confirmSync" = false;
            };
          };
        };
      };
    };
}
