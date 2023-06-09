function volume
  echo (pactl list sinks | rg "Mute|Volume" | awk 'FNR==1{print $1$2}FNR==2{print $1$5;exit}')
end
