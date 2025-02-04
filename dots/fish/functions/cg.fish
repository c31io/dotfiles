function cg
  # system-wide
  sudo nix-collect-garbage -d
  # current user
  nix-collect-garbage -d
end
