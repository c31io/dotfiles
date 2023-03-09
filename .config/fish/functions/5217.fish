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

function 5217
    while true
        clear
        echo '52 min work' | figlet | lolcat
        mpc pause | lolcat
        echo
        _count_down 52
        sleep 1
        clear
        echo '17 min rest' | figlet | lolcat
        mpc play | lolcat
        echo
        _count_down 17
        sleep 1
    end
end
