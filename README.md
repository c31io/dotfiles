# NixOS Configurations

## Usage

Create your own `./hosts/YOUR_HOST/*.nix`, then apply them.

```fish
# Defined in /home/c31io/.config/fish/functions/bs.fish @ line 1
function bs
  sudo nixos-rebuild switch --flake ~/dotfiles/hosts/$hostname --show-trace
end
```

## READMEs

[dots](./dots/README.md)
[hosts](./hosts/README.md)
[mods](./mods/README.md)
