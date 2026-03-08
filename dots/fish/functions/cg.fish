function cg
    # system-wide
    sudo nix-collect-garbage -d --delete-older-than 60d
    # current user
    read -p "collect user garbage? y/N" flag
    if [[ -z $flag || $flag == "n" || $flag == "N" ]]
        then
        echo skipped
        elif [[ $flag == "y" || $flag == "Y"]]
        then
        nix-collect-garbage -d
    else
        echo "invalid input. skipped"
    end
end
