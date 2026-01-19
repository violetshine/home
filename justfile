default:
  just --list

@hm *args:
  system=$(\
    nix-instantiate \
      --eval \
      --expr \
      'builtins.currentSystem' \
  )
  home-manager \
    --flake . \
    {{args}}