function smart
    for disk in (fd '^sd.$' /dev)
        echo $disk
        sudo smartctl $disk -x | rg --color never 'overall|ID#|Reallocated_'
        echo
    end
end
