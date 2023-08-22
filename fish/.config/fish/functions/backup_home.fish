function backup_home
    # not backup ~/.cache ~/.local and ~/Downloads
    # ~/develop has many compiling artifacts
    # not backup firefox cache ~/.mozilla
    # not backup managed packages in
    #   ~/.rustup ~/.cargo ~/.ghcup ~/.npm ~/.yarn ~/.julia
    # discord, chrome, and code abused ~/.config for storage
    rsync -a --delete --progress    \
    --exclude ~/.cache      \
    --exclude ~/.local      \
    --include ~/.local/bin  \
    --exclude ~/Downloads   \
    --exclude ~/develop     \
    --exclude ~/.rustup     \
    --exclude ~/.cargo      \
    --exclude ~/.ghcup      \
    --exclude ~/.npm        \
    --exclude ~/.yarn       \
    --exclude ~/.julia      \
    --exclude ~/.ipython    \
    --exclude ~/.mozilla    \
    --exclude ~/.config/Zettlr          \
    --exclude ~/.python_history         \
    --exclude ~/.config/google-chrome   \
    --exclude ~/.config/discord         \
    --exclude ~/.config/Code\ -\ OSS    \
    --exclude ~/.vscode-oss             \
    /home /mnt/hdd
end
