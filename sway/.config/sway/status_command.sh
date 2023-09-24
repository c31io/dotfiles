d(){ date +'%Y-%m-%d %H:%M %A %V';}; while d; do sleep $((60-$(date +%S))); done
