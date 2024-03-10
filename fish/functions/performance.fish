function performance
    set fish_trace 1
    sudo cpupower frequency-set -g performance
    sudo cpupower set -b 0
end
