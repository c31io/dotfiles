function volume
  pactl list sinks | rg "Mute|Volume|Active Port" | awk 'FNR==1{print $1$2}FNR==2{print $1$5}FNR==4{print $3}'
end
