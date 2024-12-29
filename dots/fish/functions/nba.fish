function nba --wraps='nix-build ~/repo/nixpkgs/ -A' --description 'alias nba=nix-build ~/repo/nixpkgs/ -A'
  nix-build ~/repo/nixpkgs/ -A $argv
        
end
