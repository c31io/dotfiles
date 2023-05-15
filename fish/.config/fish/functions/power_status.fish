function power_status --wraps='cat /sys/class/power_supply/BAT0/status' --description 'alias power_status=cat /sys/class/power_supply/BAT0/status'
  cat /sys/class/power_supply/BAT0/status $argv
        
end
