function cg
    # system-wide
    sudo nix-collect-garbage -d --delete-older-than 60d
    # current user
    read -P "collect user garbage? y/N " flag
    switch "$flag"
        case '' n N
            echo skipped
        case y Y
            nix-collect-garbage -d
        case '*'
            echo "invalid input. skipped"
    end
end
