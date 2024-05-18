function pkgs --wraps='nix repl --expr "import <nixpkgs>{}"' --description 'alias pkgs=nix repl --expr "import <nixpkgs>{}"'
  nix repl --expr "import <nixpkgs>{}" $argv
        
end
