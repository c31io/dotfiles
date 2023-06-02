function backup_home
    # no need to backup ~/.cache and ~/Downloads
    # ~/develop has many compiling artifacts
    # no need to backup managed packages in
    #   ~/.rustup ~/.cargo ~/.ghcup ~/.npm ~/.yarn
    # discord, chrome, and code abused ~/.config for storage
    rsync -a --delete -quiet        \
    --exclude /home/c31io/.cache    \
    --exclude /home/c31io/Downloads \
    --exclude /home/c31io/develop   \
    --exclude /home/c31io/.rustup   \
    --exclude /home/c31io/.cargo    \
    --exclude /home/c31io/.ghcup    \
    --exclude /home/c31io/.npm      \
    --exclude /home/c31io/.yarn     \
    --exclude /home/c31io/.config/google-chrome \
    --exclude /home/c31io/.config/discord       \
    --exclude /home/c31io/.config/Code\ -\ OSS  \
    /home /mnt/hdd
end
