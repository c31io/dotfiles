function bpo --wraps='bluetoothctl power on' --description 'alias bpo=bluetoothctl power on'
  bluetoothctl power on $argv
        
end
