function lock
    if set -q SWAYSOCK
        swaylock -c 000000
    else if set -q XDG_SEAT_PATH
        dm-tool lock
    end
end
