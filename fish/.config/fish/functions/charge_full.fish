function charge_full --wraps='math (cat /sys/class/power_supply/BAT0/charge_full) / (cat /sys/class/power_supply/BAT0/charge_full_design)' --description 'alias charge_full=math (cat /sys/class/power_supply/BAT0/charge_full) / (cat /sys/class/power_supply/BAT0/charge_full_design)'
  math (cat /sys/class/power_supply/BAT0/charge_full) / (cat /sys/class/power_supply/BAT0/charge_full_design) $argv
        
end
