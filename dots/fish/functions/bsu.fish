function bsu
  set np ~/repo/nixpkgs
  if test -d $np
    cd $np
    set branch (git rev-parse --abbrev-ref HEAD)
    if test $branch = "nixos-unstable"
      git pull --depth=1 upstream nixos-unstable:nixos-unstable
    end
    cd -
  end
  nix flake update --flake ~/dotfiles/hosts/$hostname && bs
end
