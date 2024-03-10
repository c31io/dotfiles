function smart
    for disk in /dev/sd?
        sudo smartctl $disk -A | rg Reallocated
    end
end
