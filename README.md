# NixOS Configurations

## Usage

Create your `./hosts/YOUR_HOST/*.nix`, git-add and apply.

Link `/etc/nixos/*` to the right files. Backup your hardware config. Keep your state version.

```fish
nix flake update --flake ~/dotfiles/hosts/$hostname
sudo nixos-rebuild switch --flake ~/dotfiles/hosts/$hostname --show-trace
```

For fresh installations, import `pc.nix` and `kde.nix`.

## Pitfalls

Git-add *.nix before using flake.

Delete dotfiles before switch.

```fish
rm -rf ~/.config/{git,fish,nvim}
```

Clear cache files before openning nvim.

```fish
rm -rf ~/.local/share/nvim
```

On ratelimit errors, put `access-tokens = github.com=<token>` in `/root/.config/nix/nix.conf`.

On experimental feature errors, `export NIX_CONFIG="experimental-features = nix-command flakes"` before `nixos-install`.

## READMEs

[dots](./dots/README.md)
[hosts](./hosts/README.md)
[mods](./mods/README.md)
