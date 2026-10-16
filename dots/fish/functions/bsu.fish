if contains -- $hostname naptop lsktp trilio
  set release nixos-unstable
else
  set release nixos-24.11
end

function __confirm_branch
  while true
    read -l -P "not on $release, continue? " confirm
    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function bsu
  set -l np ~/repo/nixpkgs
  if test -d $np
    if test "$release" = nixos-unstable
      set -l remote (git -C $np config --get branch.nixos-unstable.remote)
      if test "$remote" != upstream
        printf 'warning: nixos-unstable should track upstream (configured remote: "%s").\n' "$remote" >&2
      end
      set -l filter (git -C $np config --get remote.upstream.partialclonefilter)
      set -l promisor (git -C $np config --bool --get remote.upstream.promisor)
      if test "$filter" != tree:0; or test "$promisor" != true
        echo 'warning: upstream is not configured for treeless fetching (promisor=true, partialclonefilter=tree:0).' >&2
      end
    end
    set -l branch (git -C $np rev-parse --abbrev-ref HEAD)
    if test "$branch" = "$release"
      git -C $np pull --ff-only upstream $release; or return
    else if not __confirm_branch
      echo "aborted"
      return
    end
  end
  nix flake update --flake ~/dotfiles/hosts/$hostname && bs
end
