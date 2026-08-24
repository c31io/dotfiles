function nhdo
    nohup $argv &>/dev/null &
    disown
end
