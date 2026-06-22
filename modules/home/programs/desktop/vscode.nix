{
  # VS Code
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;

        # The VS Code package to use
        package = pkgs.vscode;

        profiles = {
          default = {
            enableUpdateCheck = false;
            enableExtensionUpdateCheck = false;

            extensions = [
              # Automatically loads .envrc
              pkgs.vscode-extensions.mkhl.direnv
              # Nix support
              pkgs.vscode-extensions.jnoortheen.nix-ide
              # Tinymist - language server for Typst
              pkgs.vscode-extensions.myriad-dreamin.tinymist
              # Deno
              pkgs.vscode-extensions.denoland.vscode-deno
              # Svelte web framework support
              pkgs.vscode-extensions.svelte.svelte-vscode
              # Other web dev extensions
              pkgs.vscode-extensions.esbenp.prettier-vscode # Prettier
              pkgs.vscode-extensions.dbaeumer.vscode-eslint # ESlint
              pkgs.vscode-extensions.bradlc.vscode-tailwindcss # Tailwind CSS
              # Rust
              pkgs.vscode-extensions.rust-lang.rust-analyzer
              # C#
              pkgs.vscode-extensions.ms-dotnettools.csharp
              # Scala syntax highligting & LSP
              pkgs.vscode-extensions.scala-lang.scala
              pkgs.vscode-extensions.scalameta.metals
              # Claude Code AI
              pkgs.vscode-extensions.anthropic.claude-code
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

              "explorer.confirmDelete" = false;

              # Nix language
              "nix.enableLanguageServer" = true;
              "nix.formatterPath" = "nixfmt";
              "[nix]" = {
                "editor.formatOnSave" = true;
              };

              # Git
              "git.confirmSync" = false;

              # Svelte
              "svelte.enable-ts-plugin" = true;
            };
          };
        };
      };
    };
}
