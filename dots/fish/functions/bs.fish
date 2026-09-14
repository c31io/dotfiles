function bs
    if test (uname -s) = Darwin
        nh darwin switch ~/dotfiles/hosts/$hostname -H $hostname -t
    else
        nh os switch ~/dotfiles/hosts/$hostname -H $hostname -t
    end
end
