function _count_down
    set t $argv[1]
    set seed (random)
    for i in (seq 0 (math $t - 1))
        set l (string repeat '>' -n $i)
        set r (string repeat ' ' -n (math $t - $i))
        echo -ne "[$l$r] $i/$t\r" | lolcat -S $seed
        sleep 60
    end
end

function start_music
    mpc play | lolcat
end

function pause_music
    mpc pause | lolcat
end

function get_workspace
    if set -q BSPWM
        echo (bspc query -D -d focused --names)
    end
end

function swith_to_workspace
    if set -q BSPWM
        bspc desktop -f $argv[1]
    end
end

function 5217
    while true
        set this (get_workspace)
        clear
        echo '52 min work' | figlet | lolcat
        if set -q argv[1]
            start_music
        end
        echo
        _count_down 52
        sleep 1 # double press C-c to exit

        set that (get_workspace)
        echo $that
        clear
        swith_to_workspace $this
        echo '17 min rest' | figlet | lolcat
        if set -q argv[1]
            pause_music
        end
        echo
        _count_down 17
        sleep 1 # double press C-c to exit
        swith_to_workspace $that
    end
end
