# NixOS Configurations

## Usage

Create your `./hosts/YOUR_HOST/*.nix`, commit and apply.

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
