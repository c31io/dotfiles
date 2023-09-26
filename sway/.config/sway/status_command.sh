while date +'%Y-%m-%d %H:%M %A %V'
    do sleep $((60-$(expr $(date +%S) + 0)))
done
