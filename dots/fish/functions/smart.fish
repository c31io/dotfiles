function smart
    for disk in /dev/sd?
        echo $disk
        sudo smartctl $disk -x | rg --color never 'overall|ID#|Reallocated_'
        echo
    end
end
