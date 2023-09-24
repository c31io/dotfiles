function lnbg
    ln -sf $argv[1] ~/.bg;
    swaymsg reload;
end
