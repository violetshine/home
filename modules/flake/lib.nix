{
  self,
  inputs,
  ...
}: {
  flake.lib = {
    # supported systems.
    systems = [
      "aarch64-darwin"
    ];

    # make a nixpkgs instance for a given system.
    pkgsFor = system:
      import inputs.nixpkgs {
        inherit system;

        overlays =
          builtins.attrValues
          self.overlays;

        config.allowUnfree = true;
      };
  };
}
