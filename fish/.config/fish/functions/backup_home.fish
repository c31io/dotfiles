function backup_home
    # not backup ~/.cache ~/.local and ~/Downloads
    # ~/develop has many compiling artifacts
    # not backup firefox cache ~/.mozilla
    # not backup managed packages in
    #   ~/.rustup ~/.cargo ~/.ghcup ~/.npm ~/.yarn ~/.julia
    # discord, chrome, and code abused ~/.config for storage
    rsync -a --delete --progress    \
    --exclude /home/c31io/.cache    \
    --exclude /home/c31io/.local    \
    --exclude /home/c31io/Downloads \
    --exclude /home/c31io/develop   \
    --exclude /home/c31io/.rustup   \
    --exclude /home/c31io/.cargo    \
    --exclude /home/c31io/.ghcup    \
    --exclude /home/c31io/.npm      \
    --exclude /home/c31io/.yarn     \
    --exclude /home/c31io/.julia    \
    --exclude /home/c31io/.mozilla  \
    --exclude /home/c31io/.config/google-chrome \
    --exclude /home/c31io/.config/discord       \
    --exclude /home/c31io/.config/Code\ -\ OSS  \
    --exclude /home/c31io/.vscode-oss           \
    /home /mnt/hdd
end
