set release nixos-unstable

function __confirm_branch
  while true
    read -l -P "not on $release, continue?" confirm
    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function bsu
  set np ~/repo/nixpkgs
  if test -d $np
    cd $np
    set branch (git rev-parse --abbrev-ref HEAD)
    if test $branch = $release
      git pull --depth=1 upstream $release:$release -f
      cd -
    else
      if not __confirm_branch
        echo "aborted"
        cd -
        return
      end
    end
  end
  nix flake update --flake ~/dotfiles/hosts/$hostname && \
    git -C ~/dotfiles add --all && \
    git -C ~/dotfiles commit -m "update $hostname" && \
    bs
end
