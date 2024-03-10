function lnbg
    ln -sf (realpath $argv[1]) ~/.bg;
    swaymsg reload;
end
