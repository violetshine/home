{
  # The zed code editor - https://zed.dev/
  flake.modules.homeManager.violetshine = {
    programs.zed-editor = {
      enable = true;

      # Declare all of the extensions that should be installed.
      # Also remember to configure the extensions in userSettings.
      #
      # List of available extensions:
      # - https://github.com/zed-industries/extensions/tree/main/extensions
      extensions = [
        "nix" # Adds Nix language support
        "typst" # Adds support for the Typst markup language
      ];

      # We don't want Zed to update the user settings file since the settings should be managed from here.
      mutableUserSettings = false;

      # Configure Zed & all of the extensions.
      userSettings = {
        # Do not check for updates as those should be handled by Nix.
        auto_update = false;

        # No telemetry.
        telemetry = {
          diagnostics = false;
          metrics = false;
        };

        # Do not use hard tabs for indentation.
        hard_tabs = false;

        # This is fairly obvious - helps with readability.
        colorize_brackets = true;

        # Language-specific options.
        languages = {
          # Configure Nix to use the tools that are installed by programs/lang/nix.nix.
          "Nix" = {
            # Only use nixd as the language server.
            language_servers = [
              "nixd"
              "!nil"
            ];

            # Configure nixfmt as the formatter for Nix.
            formatter = {
              external = {
                command = "nixfmt";
              };
            };

            # Format Nix files on save.
            format_on_save = "on";
          };
        };
      };
    };
  };
}
