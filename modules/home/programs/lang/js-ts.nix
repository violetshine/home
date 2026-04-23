{
  # JavaScript & TypeScript
  flake.modules.homeManager.violetshine =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nodejs # Node.js (latest LTS)
        deno # Deno (latest)

        pnpm # Fast, disk space efficient package manager for JavaScript
      ];
    };
}
