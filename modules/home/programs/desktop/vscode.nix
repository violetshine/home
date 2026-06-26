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

            extensions = with pkgs; [
              # Automatically loads .envrc
              vscode-extensions.mkhl.direnv
              # Nix support
              vscode-extensions.jnoortheen.nix-ide
              # Tinymist - language server for Typst
              vscode-extensions.myriad-dreamin.tinymist
              # Java
              vscode-extensions.vscjava.vscode-java-pack
              # Deno
              vscode-extensions.denoland.vscode-deno
              # Svelte web framework support
              vscode-extensions.svelte.svelte-vscode
              # Other web dev extensions
              vscode-extensions.esbenp.prettier-vscode # Prettier
              vscode-extensions.dbaeumer.vscode-eslint # ESlint
              vscode-extensions.bradlc.vscode-tailwindcss # Tailwind CSS
              # Rust
              vscode-extensions.rust-lang.rust-analyzer
              # Scala syntax highligting & LSP
              vscode-extensions.scala-lang.scala
              vscode-extensions.scalameta.metals
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
              "explorer.confirmDragAndDrop" = false;

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
