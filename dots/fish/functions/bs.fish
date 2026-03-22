function bs
  if test (uname -s) = 'Darwin'
    nh darwin switch ~/dotfiles/hosts/$hostname -H $hostname
  else
    sudo nixos-rebuild switch --flake ~/dotfiles/hosts/$hostname --show-trace
  end
end
