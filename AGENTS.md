# AGENTS.md

NixOS + nix-darwin + Home Manager configurations (personal dotfiles).

## Layout

- `hosts/<name>/` — one flake **per host** (each has its own `flake.nix` + `flake.lock`). There is no top-level flake.
  - NixOS (x86_64-linux): `trilio` (niri), `naptop`, `lsktp`, `hyperz`
  - nix-darwin (aarch64-darwin): `airio`
  - `windows/` — PowerShell config only, not Nix.
- `mods/*.nix` — reusable NixOS modules, imported by a host's `configuration.nix`.
- `mods/home/*.nix` — Home Manager modules, imported by a host's `home.nix`.
- `dots/` — legacy raw configs (fish, git, nvim, doom, niri, fuzzel, waybar, opencode). Not built; symlinked into `~/.config` via `xdg.configFile` + `mods/home/link.nix`.

## Critical: repo path

`mods/home/link.nix` symlinks dots with `mkOutOfStoreSymlink "${home}/dotfiles/dots/<path>"`, so the repo **must live at `~/dotfiles`** or every `xdg.configFile` link breaks.

## Commands

```fish
# NixOS host (run from any host, one flake per host)
sudo nixos-rebuild switch --flake ~/dotfiles/hosts/$hostname --show-trace
nix flake update --flake ~/dotfiles/hosts/$hostname

# darwin host
darwin-rebuild switch --flake ~/dotfiles/hosts/airio

# format (nixfmt over every .nix via fd)
./fmt.sh
```

## Pitfalls

- **Flakes only see git-tracked files.** `git add` any new/renamed `.nix` before `nixos-rebuild` or the flake silently misses them.
- `lsktp` pins `nixpkgs.url = "path:/home/c31io/repo/nixpkgs"` (local checkout), unlike other hosts which use `nixos-unstable`. Don't "fix" this to a github URL.
- Deleting/re-linking dotfiles: `rm -rf ~/.config/{git,fish,nvim}` then `rm -rf ~/.local/share/nvim` before reopening nvim.
- Experimental-features errors: `export NIX_CONFIG="experimental-features = nix-command flakes"`.
- GitHub rate-limit errors: add `access-tokens = github.com=<token>` to `/root/.config/nix/nix.conf`.

## Conventions

- nixpkgs `nixos-unstable` (NixOS) / `nixpkgs-unstable` (darwin); `home-manager` follows nixpkgs.
- `username = "c31io"`, `allowUnfree = true` per host.
- `system.stateVersion` is set per installation and must **never** be bumped once set.
- `configuration.nix` takes one arg (`flake-overlays`) and returns a module; `flake.nix` calls `import ./configuration.nix flake-overlays`.
- Formatter is `nixfmt`; keep `fmt.sh` passing before committing.
