{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShellNoCC {
      inputs = [
        config.pre-commit.devShell
      ];

      packages = with pkgs; [
        just
      ];

      shellHook = ''
        ${config.pre-commit.shellHook}
      '';
    };
  };
}
