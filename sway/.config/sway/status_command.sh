d(){ date +'%Y-%m-%d %H:%M %A %V';}; d; sleep $((60-$(date +%S))); while d; do sleep 60; done
