function powersave
    set fish_trace 1
    sudo cpupower frequency-set -g powersave
    sudo cpupower set -b 15
end
